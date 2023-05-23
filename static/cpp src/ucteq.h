#include <hls_stream.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include <stdint.h>
#include <math.h>

using namespace std;

// typedef ap_fixed<20,12> dtype; //UCT sqrt term type <all_width,int_wdith,round_mode>
typedef ap_int<3> fotype; //used to record number of expanded childs, bitwidth determined by action space N. 2^bitwidth>=fo.
// typedef float dtype; //UCT sqrt term type
// typedef float rtype; //reward/utility type
typedef ap_fixed<20,12> dtype; //UCT sqrt term type
typedef ap_fixed<20,12> rtype; //reward/utility type
typedef int sigtype; //control signal

#define fo 3 //action space(fanout)
#define mstps 1000 //max tree size: max-steps
#define pw 32 //number of parallel workers


// template<int fo>
struct node{
    // int ind; //node index is in array index
    dtype numv; //num visits to the parent
    fotype numc; //num expanded children. init as 0. numc<fo means leaf.
    // adj<N> adj_edges; 
    //edge array: UCT weights, children indices
    dtype ucta[fo];
    // int cind[fo]; //not useful bc we are encoding index-address assuming complete trees
    dtype numvc[fo]; //num visits to all childs
};


struct BpSel_inputObj{
    // The worker id and associated reward to be distributed among Tree pipes
    int wind; //which node in node_array
    dtype new_rewd; //new reward
};


struct pipecomm{
    //  For selection in the dataflow pipeline
    int depth; //record the returning depth of each sub-tree pipeline
    int ind; //returned child index
};

struct memoized{
    // For backUp to read in the dataflow pipeline
    // in a tree level with depth j, the uct values are stored as a node_array[3^j].
    // memoization array botth attributes should be init as fo+1
    int par_ind; //which node in node_array
    int child_ind; //which ucta index in the node
};


struct SelTupleOut{
    // selected UCT leaf index, expansion actions (Selection output)
        // where leafind is the leaf node itself,  (memoized.par_ind of that worker at retuned depth)
        // and aind corresponds to which action edge to be taken at this leaf (memoized.child_ind of that worker at retuned depth)
    // out_sti: subtree index,
    // out_di: leaf depth index,
    int leafind;
    int aind;
    int out_sti,
    int out_di;
    
    // worker id
    // int wid;
};

// template<int fo>
// struct adj{
//     dtype d[fo];
//     dtype d2[fo];
// };


extern "C" void top(
            hls::stream<pkt> &X, // rewards (Backprop+Sel input)
            hls::stream<pkt32> &ids, // simulation worker id (Backprop input for identifying memoization location, not needed for sync. version)
            hls::stream<pkt32> &selsig, // an array of selection signals (only non-empty before the execution of tree flush) (Backprop+Sel input)
            // const unsigned dtype *n, // an array of visit counts should be stored on-chip
            hls::stream<pkt128> &out,       // pw best UCT leaf index,subtree index,leaf depth index,expansion actions (Selection output)
            node *adj_list  //Tree array output port for flushing, size mstps
            // int size                 // Size in integer
            int flushs  //flushs signal =1, rerun kernel once for every tree-flush.
                        //flushs signal =2, rerun kernel once for every init.
                        //otherwise, run backupsel pipeline.
            );

void xbar(
        hls::stream<ap_int<fo>> &inpipe,

        hls::stream<BpSel_inputObj> &inIDRpipe,
        hls::stream<BpSel_inputObj> &outIDRpipe1, 
        hls::stream<BpSel_inputObj> &outIDRpipe2,
        hls::stream<BpSel_inputObj> &outIDRpipe3
        );

void subT1_pipl(
        // hls::stream<dtype> &Reward_inpipe, //a reward for BackUp comes
        // hls::stream<int> &IDpipe, //a worker ID for memoization of selected indices
        hls::stream<BpSel_inputObj> &inIDRpipe,
        hls::stream<pkt128> &out,
        int flushs);

void subT1_lev_stage(
        hls::stream<pipecomm> &inpipe, //input(parent) child index,depth for Selection
        hls::stream<pipecomm> &outpipe, //output child index,depth for Selection
        hls::stream<ap_int<1>> &returnpipe_in, //=1 if level returned, =0 if not return
        hls::stream<ap_int<1>> &returnpipe_out, //=1 if level returned, =0 if not return
        hls::stream<IDRobject> &IDRpipe_in, //input worker index and reward used to index memoiz_array and update(BackUp)
        hls::stream<IDRobject> &IDRpipe_out, //output worker index and reward used to index memoiz_array and update(BackUp)
        // int depth, //depth to be returned by the last level (which depth is the leaf node), may be changed, may remain same
        node *node_array, //input memory bank
        memoized memoiz_array[pw], //input, memoization of workers at this level
        ) ;

