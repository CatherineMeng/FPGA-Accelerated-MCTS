# FPGA-Accelerated-MCTS
Monte Carlo Tree Search (MCTS) is a widely used search technique in Artificial Intelligence (AI) applications. 
MCTS manages a dynamically evolving decision tree (i.e., one whose depth and height evolve at run-time) to guide an AI agent toward an optimal policy. 
In-tree operations are memory-bound leading to a critical performance bottleneck for large-scale parallel MCTS on general-purpose processors.
CPU-FPGA accelerators can alleviate the memory bottleneck of in-tree operations. 

This repo contains the modules for implementing general Tree-Parallel MCTS, where the tree is managed on FPGA and parallel simulations on multi-core CPU.

## static

The static folder contains HLS host and device code for a static tree management module, where the SRAM bank (i.e., array) for each full tree level is allocated at compile time. The in-tree operators operate on each tree level in a pipeline manner based on streaming requests.

<img src="https://github.com/CatherineMeng/FPGA-Accelerated-MCTS/tree/blob/main/figs/arch_uct.PNG" alt="drawing" width="250"/>

## dynamic

The dynamic folder contains HLS host and device code for a dynamic tree management module, where the SRAM banks are connected to the in-tree operators through a butterfly-based interconnection. 

### Stage-Bank Interconnection
The SRAM banks are dynamically assigned tree level indices at run-time, and the in-tree operators access the banks based on the tree level they are responsible for through the interconnection:

<img src="https://github.com/CatherineMeng/FPGA-Accelerated-MCTS/tree/blob/main/figs/butterfly.png" alt="drawing" width="250"/>

The specification for a module with 32 operators and 64 banks is in dynamic/knl_test_D32Y64_src.

To generate the HLS code for the interconnection design supporting arbitrary tree height and number of SRAM banks, refer to dynamic/CodeGen/pipes generator.ipynb.

### In-tree Operator

Each selection in-tree operator adopts a comparison-lookup-table (CLUT):

<img src="https://github.com/CatherineMeng/FPGA-Accelerated-MCTS/tree/blob/main/figs/CLUT.png" alt="drawing" width="250"/>

To generate the HLS code for the CLUT design supporting arbitrary tree fanout, refer to dynamic/CodeGen/CLUT Generator.ipynb.

