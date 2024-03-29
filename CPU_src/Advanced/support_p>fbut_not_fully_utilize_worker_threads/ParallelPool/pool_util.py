from multiprocessing import Pipe
from copy import deepcopy
import os
# import torch

from ParallelPool.sim_thread import Worker


# Works in the main MCTS-process and manages sim-workers
class PoolManager():
    def __init__(self, worker_num, env_params, env):
        self.worker_num = worker_num
        self.env_params = env_params


        # Buffer for workers and pipes
        self.workers = []
        self.pipes = []


        # Initialize workers
        for worker_idx in range(worker_num):
            parent_pipe, child_pipe = Pipe()
            self.pipes.append(parent_pipe)

            worker = Worker(
                pipe = child_pipe,
                env_params = deepcopy(env_params),
                environment = env
            )
            self.workers.append(worker)

        # Start workers
        for worker in self.workers:
            worker.start() #python Process function

        # Worker status: 0 for idle, 1 for busy
        self.worker_status = [0 for _ in range(worker_num)]

    def has_idle_server(self):
        for status in self.worker_status:
            if status == 0:
                return True

        return False

    def server_occupied_rate(self):
        occupied_count = 0.0

        for status in self.worker_status:
            occupied_count += status

        return occupied_count / self.worker_num

    def find_idle_worker(self):
        for idx, status in enumerate(self.worker_status):
            if status == 0:
                self.worker_status[idx] = 1
                return idx

        return None

    def assign_expansion_simulation_task(self, action, init_reward, checkpoint_params, task_idx):
        worker_idx = self.find_idle_worker()

        self.send_safe_protocol(worker_idx, "ExpansionAndSimulation", (
            action, 
            init_reward,
            checkpoint_params, 
            task_idx
        ))

        self.worker_status[worker_idx] = 1

    # def assign_simulation_task(self, task_idx, checkpoint_data, first_action = None):
    #     worker_idx = self.find_idle_worker()

    #     self.send_safe_protocol(worker_idx, "Simulation", (
    #         task_idx,
    #         checkpoint_data,
    #         first_action
    #     ))

    #     self.worker_status[worker_idx] = 1

    def get_complete_expansion_task(self):
        flag = False
        selected_worker_idx = -1

        while not flag:
            for worker_idx in range(self.worker_num):
                item = self.receive_safe_protocol_tapcheck(worker_idx)

                if item is not None: #busy wait
                    flag = True
                    selected_worker_idx = worker_idx
                    break

        command, args = item
        print("command received by get_complete_expansion_task:",command)
        assert command == "ReturnExpansion"

        # Set to idle
        self.worker_status[selected_worker_idx] = 0

        return args #this is (done, params, task_idx) from sim_thread: Worker::run()

    def get_complete_simulation_task(self):
        flag = False
        selected_worker_idx = -1

        # busy wait
        while not flag:
            for worker_idx in range(self.worker_num):
                item = self.receive_safe_protocol_tapcheck(worker_idx)

                # busy waited, got response
                if item is not None:
                    flag = True
                    selected_worker_idx = worker_idx
                    break

        command, args = item
        assert command == "ReturnSimulation"

        # Set to idle
        self.worker_status[selected_worker_idx] = 0

        return args

    # send from MCTS host thread
    def send_safe_protocol(self, worker_idx, command, args):
        success = False

        while not success:
            self.pipes[worker_idx].send((command, args))

            ret = self.pipes[worker_idx].recv()
            if ret == command:
                success = True

    def wait_until_all_envs_idle(self):
        for worker_idx in range(self.worker_num):
            if self.worker_status[worker_idx] == 0:
                continue

            self.receive_safe_protocol(worker_idx)

            self.worker_status[worker_idx] = 0

    # send by MCTS host thread
    def receive_safe_protocol(self, worker_idx):
        self.pipes[worker_idx].poll(None)

        command, args = self.pipes[worker_idx].recv()

        self.pipes[worker_idx].send(command)

        return deepcopy(command), deepcopy(args)

    def receive_safe_protocol_tapcheck(self, worker_idx):
        flag = self.pipes[worker_idx].poll()
        if not flag:
            return None

        command, args = self.pipes[worker_idx].recv()

        self.pipes[worker_idx].send(command)

        return deepcopy(command), deepcopy(args)

    def close_pool(self):
        for worker_idx in range(self.worker_num):
            self.send_safe_protocol(worker_idx, "KillProc", None)

        for worker in self.workers:
            worker.join()