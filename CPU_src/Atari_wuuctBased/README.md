## This is an optimized tree-parallel MCTS framework based n WU-UCT: [Link](https://github.com/liuanji/WU-UCT.git)

### The main optimization is to combine the expansion and simulation worker pools into the same pool. This avoid repeated communication between master and worker threads in the 1-step simulation for expansopn phase. In each simulation worker thread, the 1-step simulation in Exapnsion and the actual simulation is executed together, and their output are communicated to th emaster for node insertion, etc.

### The above optimization increased the overall performance by reducing the total latency for Expansion + Simulatoon. However, for large number of workers (simulation threads), it also shifted the system bottleeck from the simulation threads to the master (in-tree operations) thread. E.g., for number of simulation workers > 16, the simulation threads (Worker Pool) utilization becomes well below 90%.

### This optimized implementation is the baseline for our CPU-FPGA accelerated MCTS. We remove the bottleneck of in-tree operations by offloading the Tree and its operations from the master thead to an FPGA accelerator, and show better scalability to larger number of workers (>16)
