import os
import time
import random
import argparse

import gym
from gym import logger
from gym.wrappers.monitoring.video_recorder import VideoRecorder

from mcts_thread import MCTSAgent

SEED = 28
EPISODES = 100
ENVIRONMENT = 'CartPole-v0'
LOGGER_LEVEL = logger.WARN
ITERATION_BUDGET = 280 #number of nodes to expand in MCTS
LOOKAHEAD_TARGET = 100
MAX_EPISODE_STEPS = 1500
VIDEO_BASEPATH = './video'
START_CP = 20
NUM_SIM_THREADS = 4
 #assume it <= action space for now


if __name__ == '__main__':
    random.seed(SEED)
    parser = argparse.ArgumentParser(
        description='Run a Monte Carlo Tree Search agent on the Cartpole environment', formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--env_id', nargs='?', default=ENVIRONMENT,
                        help='The environment to run (only CartPole-v0 is supperted)')
    parser.add_argument('--episodes', nargs='?', default=EPISODES, type=int,
                        help='The number of episodes to run.')
    parser.add_argument('--iteration_budget', nargs='?', default=ITERATION_BUDGET, type=int,
                        help='The number of iterations for each search step. Increasing this should lead to better performance.')
    parser.add_argument('--lookahead_target', nargs='?', default=LOOKAHEAD_TARGET, type=int,
                        help='The target number of steps the agent aims to look forward.')
    parser.add_argument('--max_episode_steps', nargs='?', default=MAX_EPISODE_STEPS, type=int,
                        help='The maximum number of steps to play.')
    parser.add_argument('--video_basepath', nargs='?', default=VIDEO_BASEPATH,
                        help='The basepath where the videos will be stored.')
    parser.add_argument('--num_workers', nargs='?', default=NUM_SIM_THREADS,
                        help='The number of simulation threads used.')
    parser.add_argument('--start_cp', nargs='?', default=START_CP, type=int,
                        help='The start value of C_p, the value that the agent changes to try to achieve the lookahead target. Decreasing this makes the search tree deeper, increasing this makes the search tree wider.')
    parser.add_argument('--seed', nargs='?', default=SEED, type=int,
                        help='The random seed.')

    args = parser.parse_args()

    logger.set_level(LOGGER_LEVEL)

    env = gym.make(args.env_id)

    env.seed(args.seed)

    agent = MCTSAgent(args.iteration_budget, args.env_id, args.num_workers)

    timestr = time.strftime("%Y%m%d-%H%M%S")

    reward = 0
    done = False

    for i in range(args.episodes):
        ob = env.reset()
        env._max_episode_steps = args.max_episode_steps
        video_path = os.path.join(
            args.video_basepath, f"output_{timestr}_{i}.mp4")
        # rec = VideoRecorder(env, path=video_path)

        try:
            sum_reward = 0
            node = None
            all_nodes = []
            C_p = args.start_cp
            while True:
                print("################")
                # env.render()
                # rec.capture_frame()
                action, node, C_p = agent.act(
                    env.state, n_actions=env.action_space.n, node=node, C_p=C_p, lookahead_target=args.lookahead_target)
                assert (action==0 or action==1)
                ob, reward, done, _ = env.step(action)
                print("### observed state: ", ob)
                sum_reward += reward
                print("### sum_reward: ", sum_reward)
                if done:
                    # rec.close()
                    print("break now")
                    break

        except KeyboardInterrupt as e:
            # rec.close()
            env.close()
            raise e

    env.close()