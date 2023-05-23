from multiprocessing import Process
from copy import deepcopy
import random
import numpy as np

import gym


# A worker = a sim thread
class Worker(Process):
    def __init__(self, pipe, env_params, environment):
        # environment: string, gym name of benchmark
        super(Worker, self).__init__()

        self.pipe = pipe
        self.env_params = deepcopy(env_params)

        self.wrapped_env = None
        self.action_n = None
        self.max_episode_length = None
        self.environment=environment

        self.policy_wrapper = None

    # Initialize the environment
    def init_process(self):
        # self.wrapped_env = EnvWrapper(**self.env_params)
        # # self.wrapped_env.seed(self.seed)
        # self.action_n = self.wrapped_env.get_action_n()
        # self.max_episode_length = self.wrapped_env.get_max_episode_length()
        exp_env = gym.make(self.environment)
        exp_env.reset()
        # exp_env.unwrapped.state = np.array(node.params) 
        # exp_env.unwrapped.state = np.array(self.env_params) #this should be done in the expansion/simulation itself
        self.wrapped_env = exp_env

    def run(self):
        self.init_process()
        # self.init_policy()

        print("> Worker environment ready.")

        while True:
            # Wait for tasks received from MCTS-thread
            command, args = self.receive_safe_protocol()

            if command == "KillProc":
                return
            elif command == "ExpansionAndSimulation":
                # receive selected expand action a, ST[node.id], task_idx from MCTS-thread=======
                action, init_reward, checkpoint_params, task_idx = args

                # do expansion
                # expand_action, next_state, reward, done, \
                    # checkpoint_data = self.expand_node(checkpoint_data, curr_node)
                self.wrapped_env.reset()
                self.wrapped_env.unwrapped.state = np.array(checkpoint_params)
                reward=init_reward
                if (action==-1):
                    reward=0
                    params=checkpoint_params
                    done=True
                else:
                    # print(action)
                    params, _, done, _ = self.wrapped_env.step(action)
                    # print(done)
                if (done):
                    self.wrapped_env.reset()

                done_expanded=done
                # item = (done_expanded, params, task_idx)
                # self.send_safe_protocol("ReturnExpansion", item)

                # do simulation
                while not done:
                    random_action = random.choice([0, 1])
                    # observation, reward, done and info
                    _, step_reward, done, _ = self.wrapped_env.step(random_action)
                    if (done):
                        self.wrapped_env.reset()
                    reward += step_reward

                #first two for in-tree expansion, second two for in-tree backup
                item2 = (done_expanded, params, reward, task_idx)
                self.send_safe_protocol("ReturnSimulation", item2)

    # Send message through pipe
    # send from sim-thread
    def send_safe_protocol(self, command, args):
        success = False

        count = 0
        while not success:
            self.pipe.send((command, args))

            ret = self.pipe.recv() #if no handshake, wait in while loop and do not proceed
            if ret == command or count >= 100:
                success = True
                
            count += 1

    # Receive message from pipe
    # send by sim-thread
    def receive_safe_protocol(self):
        self.pipe.poll(None)

        command, args = self.pipe.recv()

        self.pipe.send(command) 
        #moving this to after Expansion returned new params, send together with new params

        return deepcopy(command), deepcopy(args)