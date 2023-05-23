import numpy as np
from copy import deepcopy
import gc
import time
import logging

from Node.WU_UCTnode import WU_UCTnode

from Env.EnvWrapper import EnvWrapper

from ParallelPool.PoolManager import PoolManager

from Mem.CheckpointManager import CheckpointManager


class WU_UCT():
    def __init__(self, env_params, max_steps = 1000, max_depth = 20, max_width = 5,
                 gamma = 1.0, expansion_worker_num = 16, simulation_worker_num = 16,
                 policy = "Random", seed = 123, device = "cpu", record_video = False):
        self.env_params = env_params
        self.max_steps = max_steps
        self.max_depth = max_depth
        self.max_width = max_width
        self.gamma = gamma
        self.expansion_worker_num = expansion_worker_num #no need for this
        self.simulation_worker_num = simulation_worker_num
        self.policy = policy
        self.device = device
        self.record_video = record_video

        # Environment
        record_path = "Records/P-UCT_" + env_params["env_name"] + ".mp4"
        self.wrapped_env = EnvWrapper(**env_params, enable_record = record_video,
                                      record_path = record_path)

        # Environment properties
        self.action_n = self.wrapped_env.get_action_n()
        self.max_width = min(self.action_n, self.max_width)

        assert self.max_depth > 0 and 0 < self.max_width <= self.action_n
        print("main: executing wuuct")
        # ======changed======
        # Expansion worker pool
        # self.expansion_worker_pool = PoolManager(
        #     worker_num = expansion_worker_num,
        #     env_params = env_params,
        #     policy = policy,
        #     gamma = gamma,
        #     seed = seed,
        #     device = device,
        #     need_policy = False
        # )

        # # Simulation worker pool
        # self.simulation_worker_pool = PoolManager(
        #     worker_num = simulation_worker_num,
        #     env_params = env_params,
        #     policy = policy,
        #     gamma = gamma,
        #     seed = seed,
        #     device = device,
        #     need_policy = True
        # )
        self.expsim_worker_pool = PoolManager(
            worker_num = simulation_worker_num,
            env_params = env_params,
            policy = policy,
            gamma = gamma,
            seed = seed,
            device = device,
            need_policy = True
        )

        # Checkpoint data manager
        self.checkpoint_data_manager = CheckpointManager()
        self.checkpoint_data_manager.hock_env("main", self.wrapped_env)

        # For MCTS tree
        self.root_node = None
        self.global_saving_idx = 0

        # Task recorder ======changed======
        # self.expansion_task_recorder = dict()
        # self.unscheduled_expansion_tasks = list()
        # self.simulation_task_recorder = dict()
        # self.unscheduled_simulation_tasks = list()
        self.expsim_task_recorder = dict()
        self.unscheduled_expsim_tasks = list()


        # Simulation count
        self.simulation_count = 0

        # Logging
        logging.basicConfig(filename = "Logs/P-UCT_" + self.env_params["env_name"] + "_" +
                                       str(self.simulation_worker_num) + ".log", level = logging.INFO)

    # Entrance of the P-UCT algorithm
    # This is the outer loop of P-UCT simulation, where the P-UCT agent consecutively plan a best action and
    # interact with the environment.
    def simulate_trajectory(self, max_episode_length = -1):
        print("main: in simulate_trajectory")
        state = self.wrapped_env.reset()
        accu_reward = 0.0
        done = False
        step_count = 0
        rewards = []
        times = []

        # game_start_time = time.clock()
        game_start_time = time.perf_counter()

        logging.info("Start simulation")

        while not done and (max_episode_length == -1 or step_count < max_episode_length):
            print("main: in while")
            # Plan a best action under the current state
            # simulation_start_time = time.clock()
            simulation_start_time = time.perf_counter()
            action = self.simulate_single_move(state)
            # simulation_end_time = time.clock()
            simulation_end_time = time.perf_counter()

            # Interact with the environment
            next_state, reward, done = self.wrapped_env.step(action)
            rewards.append(reward)
            times.append(simulation_end_time - simulation_start_time)

            print("> Time step {}, take action {}, instance reward {}, cumulative reward {}, used {} seconds".format(
                step_count, action, reward, accu_reward + reward, simulation_end_time - simulation_start_time))
            logging.info("> Time step {}, take action {}, instance reward {}, cumulative reward {}, used {} seconds".format(
                step_count, action, reward, accu_reward + reward, simulation_end_time - simulation_start_time))

            # Record video
            if self.record_video:
                self.wrapped_env.capture_frame()
                self.wrapped_env.store_video_files()

            # update game status
            accu_reward += reward
            state = next_state
            step_count += 1

        # game_end_time = time.clock()
        game_end_time = time.perf_counter()
        print("> game ended. total reward: {}, used time {} s".format(accu_reward, game_end_time - game_start_time))
        logging.info("> game ended. total reward: {}, used time {} s".format(accu_reward,
            game_end_time - game_start_time))

        return accu_reward, np.array(rewards, dtype = np.float32), np.array(times, dtype = np.float32)

    # This is the planning process of P-UCT. Starts from a tree with a root node only,
    # P-UCT performs selection, expansion, simulation, and backpropagation on it.
    def simulate_single_move(self, state):
        # Clear cache
        print("in simulate_single_move")
        self.root_node = None
        self.global_saving_idx = 0
        self.checkpoint_data_manager.clear()

        # Clear recorders======changed======
        # self.expansion_task_recorder.clear()
        # self.unscheduled_expansion_tasks.clear()
        # self.simulation_task_recorder.clear()
        # self.unscheduled_simulation_tasks.clear()
        self.expsim_task_recorder.clear()
        self.unscheduled_expsim_tasks.clear()


        gc.collect()

        # Free all workers
        # self.expansion_worker_pool.wait_until_all_envs_idle()
        # self.simulation_worker_pool.wait_until_all_envs_idle()
        self.expsim_worker_pool.wait_until_all_envs_idle()

        # Construct root node
        self.checkpoint_data_manager.checkpoint_env("main", self.global_saving_idx)
        self.root_node = WU_UCTnode(
            action_n = self.action_n,
            state = state,
            checkpoint_idx = self.global_saving_idx,
            parent = None,
            tree = self,
            is_head = True
        )

        # An index used to retrieve game-states
        self.global_saving_idx += 1

        # t_complete in the origin paper, measures the completed number of simulations
        self.simulation_count = 0

        # Repeatedly invoke the master loop (Figure 2 of the paper)
        sim_idx = 0
        # print("self.max_steps:",self.max_steps)
        while self.simulation_count < self.max_steps:
            self.simulate_single_step(sim_idx)
            # print("processing sim_idx",sim_idx)
            # print("self.simulation_count:",self.simulation_count)

            sim_idx += 1

        # Select the best root action
        best_action = self.root_node.max_utility_action()

        # Retrieve the game-state before simulation begins
        self.checkpoint_data_manager.load_checkpoint_env("main", self.root_node.checkpoint_idx)

        return best_action

    def simulate_single_step(self, sim_idx): #sim_idx is the node id in insertion order
        # Go into root node
        # print("in simulate_single_step")

        selexptime=0
        bptime=0
        start=time.perf_counter()

        curr_node = self.root_node

        # Selection
        curr_depth = 1
        while True:
            if curr_node.no_child_available() or (not curr_node.all_child_visited() and
                    curr_node != self.root_node and np.random.random() < 0.5) or \
                    (not curr_node.all_child_visited() and curr_node == self.root_node):
                # If no child node has been updated, we have to perform expansion anyway.
                # Or if root node is not fully visited.
                # Or if non-root node is not fully visited and {with prob 1/2}.

                cloned_curr_node = curr_node.shallow_clone()
                checkpoint_data = self.checkpoint_data_manager.retrieve(curr_node.checkpoint_idx)

                # Record the task=====changed=======
                # self.expansion_task_recorder[sim_idx] = (checkpoint_data, cloned_curr_node, curr_node)
                # self.unscheduled_expansion_tasks.append(sim_idx)
                self.expsim_task_recorder[sim_idx] = (checkpoint_data, cloned_curr_node, curr_node)
                self.unscheduled_expsim_tasks.append((sim_idx,"expsim")) #both expansion and simulation should be requested

                need_expansion = True
                break

            else:
                action = curr_node.select_action()

            curr_node.update_history(sim_idx, action, curr_node.rewards[action])
            # print("curr_node.traverse_history:",curr_node.traverse_history)

            if curr_node.dones[action] or curr_depth >= self.max_depth:
                # Exceed maximum depth
                need_expansion = False
                break

            if curr_node.children[action] is None:
                need_expansion = False
                break

            next_node = curr_node.children[action]

            curr_depth += 1
            curr_node = next_node


        # Expansion
        if not need_expansion:
            # print("in not need_expansion")
            if not curr_node.dones[action]:
                # Reach maximum depth but have not terminate.
                # Record simulation task.

                # =====changed=======
                # self.simulation_task_recorder[sim_idx] = (action,curr_node,curr_node.checkpoint_idx,None)
                self.expsim_task_recorder[sim_idx] = (action,curr_node,curr_node.checkpoint_idx,None)
                # self.unscheduled_simulation_tasks.append(sim_idx)  
                self.unscheduled_expsim_tasks.append((sim_idx,"onlysim")) #no expansion, only simulation should be requested
                # args sent now are action,curr_node,curr_node.checkpoint_idx,None,
            else:
                # Reach terminal node.
                # In this case, update directly.

                self.incomplete_update(curr_node, self.root_node, sim_idx)
                self.complete_update(curr_node, self.root_node, 0.0, sim_idx)

                self.simulation_count += 1

        elif need_expansion:
            # Assign tasks to idle server
            # while len(self.unscheduled_expansion_tasks) > 0 and self.expansion_worker_pool.has_idle_server():
            # print("in need_expansion")
            while len(self.unscheduled_expsim_tasks) > 0 and self.expsim_worker_pool.has_idle_server():
                # Get a task
                # curr_idx = np.random.randint(0, len(self.unscheduled_expansion_tasks))#======changed============
                # task_idx = self.unscheduled_expansion_tasks.pop(curr_idx) #======changed============
                curr_idx = np.random.randint(0, len(self.unscheduled_expsim_tasks))
                task_idx, commandstr = self.unscheduled_expsim_tasks.pop(curr_idx) # task_idx is the sim_idx associated with the curr_idx
                # print("in need_expansion while, popped task with idx",task_idx)
                # Assign the task to server
                #======changed=======
                # checkpoint_data, cloned_curr_node, _ = self.expansion_task_recorder[task_idx]
                if (commandstr =="expsim"):
                    checkpoint_data, cloned_curr_node, _ = self.expsim_task_recorder[task_idx]
                    # self.expansion_worker_pool.assign_expansion_task(
                    self.expsim_worker_pool.assign_expsim_task(
                        checkpoint_data,
                        cloned_curr_node,
                        self.global_saving_idx,
                        task_idx,
                        commandstr #added
                    )
                    self.global_saving_idx += 1

                # newly added
                elif (commandstr =="onlysim"):
                    # Assign the task to server
                    checkpoint_data = self.checkpoint_data_manager.retrieve(self.expsim_task_recorder[task_idx][2])
                    first_aciton = None if self.expsim_task_recorder[task_idx][3] is not None \
                        else self.expsim_task_recorder[task_idx][0]
                    self.expsim_worker_pool.assign_expsim_task(
                        # task_idx,
                        # checkpoint_data,
                        # first_action = first_aciton
                        checkpoint_data,
                        first_aciton,
                        self.global_saving_idx,
                        task_idx,
                        commandstr #added
                    )
                    # do incomplete update, later do complete update when ReturnSim
                    # Perform incomplete update

                    self.incomplete_update(
                        # for "onlysim": expsim_task_recorder[task_idx]=(action,curr_node,curr_node.checkpoint_idx,None)
                        self.expsim_task_recorder[task_idx][1], # This is the corresponding node
                        self.root_node,
                        task_idx
                    )
        selexptime=time.perf_counter()-start

        # Wait for a simulation task to complete
        # if self.simulation_worker_pool.server_occupied_rate() >= 0.99:
        if self.expsim_worker_pool.server_occupied_rate() >= 0.99:
            # args = self.simulation_worker_pool.get_complete_simulation_task()
            command_rcv, args = self.expsim_worker_pool.get_complete_expsim_task()

            if (command_rcv=="ReturnSim"):
                if len(args) == 3:
                    task_idx, accu_reward, prior_prob = args
                else:
                    task_idx, accu_reward, reward, done = args
                # print("ReturnSim of task idx",task_idx)
                expand_action, curr_node, saving_idx, next_state = self.expsim_task_recorder.pop(task_idx)
                #"ReturnSim" is for "onlysim", where next_state must be None (line 264.) no need to add node.

                if len(args) == 4:
                    curr_node.rewards[expand_action] = reward
                    curr_node.dones[expand_action] = done

                # # Add node
                # if next_state is not None:
                #     curr_node.add_child(
                #         expand_action,
                #         next_state,
                #         saving_idx,
                #         prior_prob = prior_prob
                #     )

                # Complete Update
                start=time.perf_counter()
                self.complete_update(curr_node, self.root_node, accu_reward, task_idx)
                bptime=time.perf_counter()-start

                self.simulation_count += 1

            elif (command_rcv=="ReturnExpNoSim"):

                # This expansion result in a terminal node, perform update directly.
                # (simulation is not needed, "ReturnExpNoSim")
                #  no need to add node.
                expand_action, next_state, reward, done, checkpoint_data, saving_idx, task_idx = args
                # print("ReturnExpNoSim of task idx",task_idx)
                #======changed=======
                # curr_node = self.expansion_task_recorder.pop(task_idx)[2]
                curr_node = self.expsim_task_recorder.pop(task_idx)[2] #[2]:cloned_curr_node, line268
                curr_node.update_history(task_idx, expand_action, reward)

                # Record info
                curr_node.dones[expand_action] = done
                curr_node.rewards[expand_action] = reward

                start=time.perf_counter()
                # do incomplete update, later do complete update when "ReturnExpNoSim" or "ReturnExpSim"
                # Perform incomplete update
                self.incomplete_update(
                    # for expsim: expsim_task_recorder[task_idx](checkpoint_data, cloned_curr_node, curr_node)
                    # self.expsim_task_recorder[task_idx][2], # This is the corresponding node
                    curr_node, #above line popped, just use it
                    self.root_node,
                    task_idx
                )
                # self.incomplete_update(curr_node, self.root_node, task_idx)
                self.complete_update(curr_node, self.root_node, 0.0, task_idx)
                bptime=time.perf_counter()-start

                self.simulation_count += 1

            elif (command_rcv=="ReturnExpSim"):
                prior_prob=None
                reward=None
                if len(args) == 7:
                    expand_action, next_state, saving_idx, checkpoint_data, task_idx, accu_reward, prior_prob = args
                    # print("update history in return task: len7")
                    # curr_node.update_history(task_idx, expand_action, accu_reward)
                    reward=accu_reward
                else:
                    expand_action, next_state, saving_idx, checkpoint_data, task_idx, accu_reward, reward, done = args
                    # print("update history in return task: len8")
                    
                # print("curr_node.traverse_history in return:",curr_node.traverse_history)
                # print("ReturnExpSim of task idx",task_idx)
                # expand_action, curr_node, saving_idx, next_state = self.expsim_task_recorder.pop(task_idx)
                checkpoint_data, cloned_curr_node, curr_node=self.expsim_task_recorder.pop(task_idx)
                curr_node.update_history(task_idx, expand_action, reward)

                if len(args) == 8:
                    curr_node.rewards[expand_action] = reward
                    curr_node.dones[expand_action] = done

                start=time.perf_counter()
                # Add node
                # if next_state is not None:
                ## next_state must not be none (if it is none, it would be in "onlysim" and returns "ReturnSim")
                curr_node.add_child(
                    expand_action,
                    next_state,
                    saving_idx,
                    prior_prob = prior_prob
                )
                # print("curr_node.traverse_history in return:",curr_node.traverse_history)
                # do incomplete update, later do complete update when "ReturnExpNoSim" or "ReturnExpSim"
                # Perform incomplete update
                self.incomplete_update(
                    # for expsim: expsim_task_recorder[task_idx](checkpoint_data, cloned_curr_node, curr_node)
                    # self.expsim_task_recorder[task_idx][2], # This is the corresponding node
                    curr_node, #above line popped, just use it
                    self.root_node,
                    task_idx
                )
                # Complete Update
                self.complete_update(curr_node, self.root_node, accu_reward, task_idx)

                # original expansion task
                self.checkpoint_data_manager.store(saving_idx, checkpoint_data)
                bptime=time.perf_counter()-start
                self.simulation_count += 1
        # print("selexptime+bptime in seconds (1 worker simulate_single_step):",selexptime+bptime)

    def close(self):
        # Free sub-processes
        # self.expansion_worker_pool.close_pool()
        # self.simulation_worker_pool.close_pool()
        self.expsim_worker_pool.close_pool()

    # Incomplete update allows to track unobserved samples (Algorithm 2 in the paper)
    @staticmethod
    def incomplete_update(curr_node, curr_node_head, idx):
        while curr_node != curr_node_head:
            curr_node.update_incomplete(idx)
            curr_node = curr_node.parent

        curr_node_head.update_incomplete(idx)

    # Complete update tracks the observed samples (Algorithm 3 in the paper)
    @staticmethod
    def complete_update(curr_node, curr_node_head, accu_reward, idx):
        while curr_node != curr_node_head:
            accu_reward = curr_node.update_complete(idx, accu_reward)
            curr_node = curr_node.parent

        curr_node_head.update_complete(idx, accu_reward)
