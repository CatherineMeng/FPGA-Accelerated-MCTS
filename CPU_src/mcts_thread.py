# ---------------------------------------------------------------------------- #
#                                    Imports                                   #
# ---------------------------------------------------------------------------- #
import random
import math
import itertools
import random
import numpy as np

import gym

from ParallelPool.pool_util import PoolManager


# ---------------------------------------------------------------------------- #
#                                   Constants                                  #
# ---------------------------------------------------------------------------- #
DEBUG = False


# ---------------------------------------------------------------------------- #
#                            Monte Carlo Tree Search                           #
# ---------------------------------------------------------------------------- #
class MCTSNode:
    # infinite iterator, list of alll node IDs
    id_iter = itertools.count()

    def __init__(self, done, depth):
        # self.params = params #this is isolated out to ST
        self.children = {}
        self.parent = None
        self.Q = 0
        self.N = 1 #division by zero?
        #everytime init is called, a new id +1 is assigned by itertools
        self.id = next(MCTSNode.id_iter) 
        self.done = done
        self.depth = depth

    def add_child(self, action, child):
        self.children[action] = child

class State_Table:
    # dict index: ID - value: params (observation state)
    # ST_dict = {}

    def __init__(self):
        self.ST_dict={} #root node is not associated with a state

# worker_num: number of workers (sim-threads)
# iterations: max. num nodes in tree
def UctSearch(worker_num, params, ST, n_actions, environment, PoolMan, iterations=100, node=None,  C_p=None, lookahead_target=None):
    if C_p == None:
        C_p = 200
    if lookahead_target == None:
        lookahead_target = 200
    # C_p and lookahead_target adjusts the exploitation/exploration in random tree policy
    if node == None:
        # root_node = MCTSNode(params, False, 0)
        root_node = MCTSNode(False, 0)
        # root node ID and params sync with ST
        ST.ST_dict[root_node.id]=params
    else:
        root_node = node

    counter = 0
    max_depth = 0
    ix = 0
    # ########### TODO: vectorize these by num_workers
    while True:
        v_list=[]
        # Selection by all workers
        for idx in range(worker_num):
            v = TreePolicy(root_node, C_p, n_actions, environment)
            max_depth = max(v.depth - root_node.depth, max_depth)
            v_list.append(v) #indexes is task_idx

        # print("v_list nodes:", ' '.join([str(v.id) for v in v_list]))
    
        # Expansion & Simulation
        # Delta = DefaultPolicy(v, environment,ST.ST_dict)
        Delta_list, index_list = ExpandSimulate(v_list, n_actions, ST,PoolMan)

        Backup(v_list, Delta_list, index_list, root_node)
        # BackUp ###########TODO
        counter += worker_num
        ix += worker_num
        if ix > iterations:
            break

    if max_depth < lookahead_target:
        C_p = C_p - 1
    else:
        C_p = C_p + 1
    print(
        f"### max_depth: {max_depth:03}, lookahead_target: {lookahead_target:03} ")
    print(f"### C_p: {C_p} ")
    print("### Maximal depth considered: ", max_depth)
    for action, child in sorted(root_node.children.items()):
        print(
            f"### action: {action}, Q: {int(child.Q):08}, N: {child.N:08}, Q/N: {child.Q/child.N:07.2f}")

    best_child = max(root_node.children.values(), key=lambda x: x.N)
    best_child_action = best_child.action
    # print(f"### predicted state: {best_child.params}") 
    print(f"### predicted state: {ST.ST_dict[best_child.id]}")
    print(f"### chosen action: {best_child_action}")

    best_child_node = max(root_node.children.values(), key=lambda x: x.N)
    return (best_child_action, best_child_node, C_p)

# in-tree Selection 
def TreePolicy(node, C_p, n_actions, environment):
    while not node.done:
        if len(node.children) < n_actions:
            # return Expand(node, n_actions, environment, ST.ST_dict)
            return node
        else:
            node = BestChild(node, C_p)
            node.N += 1
    return node

def BestChild(node, c, random=False):
    if random:
        child_values = {child: child.Q/child.N + c *
                        math.sqrt(2*math.log(node.N)/child.N) for child in node.children}
        mv = max(child_values.values())
        am = random.choice([k for (k, v) in child_values.items() if v == mv])
    else:
        am = max(node.children.values(), key=lambda v_prime: v_prime.Q /
                 v_prime.N + c*math.sqrt(2*math.log(node.N)/v_prime.N))
    return am

# Expansion one-step simulation from a node
# ####node -> nodes (list of selected nodes), child_node -> child_nodes (list of selected nodes), indexed by task_idx
def ExpandSimulate(nodes, n_actions, ST, PoolMan):
    act_list=[]
    for node in nodes:
        unchosen_actions = list(
            filter(lambda action: not action in node.children.keys(), range(n_actions)))
        # if there is no unchosen action, bthen node.done must=true (TreePolicy did not enter while) 
        if len(unchosen_actions)==0:
            a=-1 #this will be sent to sim-thread where expansion does not do one-step sim
        else:
            a = random.choice(unchosen_actions)
        node.children[a]=None
        act_list.append(a)
    # =======send action a, params ST.ST_dict[node.id], task_idx to a SIM-thread=======
    # print("act_list:",act_list)
    i=0 #used to track task index
    rewards=[]
    task_indices=[]
    for node in nodes:
        task_idx=i #########for loop to get task idx for each selected node
        a=act_list[i]
        i+=1

        # print ("ST dictionary indices now:",' '.join([str(k) for k in ST.ST_dict.keys()]))
        # print ("Accessing ST index:",node.id)
        checkpoint_params=ST.ST_dict[node.id] #read from ST
        PoolMan.assign_expansion_simulation_task(a, node.depth+1, checkpoint_params, task_idx)
        child_node = MCTSNode(False, node.depth+1)
        child_node.parent = node
        node.children[a] = child_node
        if (a!=-1):
            child_node.action = a 
        else:
            child_node.action = random.choice([0,1])

    i=0
    # for node in nodes:    
        # return child_node
        # =============End Expansion===============
        # done, params, rcv_task_idx = PoolMan.get_complete_expansion_task() #done, params, task_idx
        # a=act_list[i]
        # node.children[a].done=done
        # i+=1
        # ST.ST_dict[node.children[a].id]=params #receive new params sent back from sim-thread, insert to ST
    for node in nodes: # combined get_complete_expansion and get_complete_simulation to avoid race condition
        # =============End Simulation===============
        # reward, rcv_task_idx = PoolMan.get_complete_simulation_task()
        done, params,reward, rcv_task_idx = PoolMan.get_complete_simulation_task()
        a=act_list[i]
        node.children[a].done=done #in-tree expansion
        i+=1
        #in-tree expansion, receive new params sent back from sim-thread one-step sim, insert to ST
        ST.ST_dict[node.children[a].id]=params 
        rewards.append(reward)
        task_indices.append(rcv_task_idx)

    return rewards,task_indices

# nodes, Deltas should have the same len and their indices corresponds to values of indices 
def Backup(nodes, Deltas, indices, root_node):
    for idx in indices:
        node=nodes[idx]
        Delta=Deltas[idx]
        while not node is root_node.parent:
            # node.N += 1 #moved to Selection as virtual loss
            node.Q = node.Q + Delta
            node = node.parent

class MCTSAgent(object):
    ST=State_Table()
    
    def __init__(self, time_budget, environment,wn):
        self.agenttype = 'mcts'
        self.time_budget = time_budget # number of nodes in tree
        self.environment = environment
        self.worker_num=wn
        # create and initialize worker threads only once
        self.PoolMan=PoolManager(worker_num=wn, env_params=None, env="CartPole-v0") 
        self.PoolMan.wait_until_all_envs_idle()

    def act(self, params, n_actions, node, C_p, lookahead_target):
        #params is of root node
        return UctSearch(self.worker_num, params, self.ST, n_actions, self.environment, self.PoolMan, self.time_budget, node=node, C_p=C_p, lookahead_target=lookahead_target)


