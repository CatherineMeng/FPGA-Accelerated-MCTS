

#include <hls_stream.h>
#include <ap_int.h>

// #define Fo 3 //fanout
// #define f 3 //clut factor
// #define num_comp 3 //C^Fo_2
// #define lut_size 8 //2^(C^Fo_2)
#define Fo 6 //fanout
#define f 6 //clut factor
#define num_comp 15 //C^Fo_2
#define lut_size 32768 //2^(C^Fo_2)

using namespace std;

typedef ap_int<num_comp> lutindex; //used to concatenate comparator results
// typedef ap_int<16> dtype;
typedef ap_int<3> fotype; //used to record number of expanded childs, bitwidth determined by action space N. 2^bitwidth>=fo.
typedef ap_fixed<18,10> dtype; //UCT sqrt term type. <a,b>: b-bit integer,a-b bit fractional.
typedef ap_fixed<18,10> rtype; //reward/utility type
// typedef int sigtype; //control signal

typedef ap_int<1> compbit; //comparison reslt, < is 0, > is 1

struct item{
    int pipstage;
    int bankidx;
    int nodeidx;
};

struct sub_array{
    dtype ucta[f];
};

struct Tnode
{
    dtype numv; //num visits to the parent
    fotype numc; //num expanded children. init as 0. numc<fo means leaf.
    dtype ucta[Fo];
    // int cind[fo]; //not useful bc we are encoding index-address assuming complete trees
    dtype numvc[Fo]; //num visits to all childs	
    dtype bkidx[Fo]; //bank indices of all child node entries
    dtype neidx[Fo]; //Tnode entry indices of all child node entries in their bank	
    // dtype ndidx[fo]; //node indices of all childs	
};


// top function
extern "C" void top(ap_int<1> init_control, int* clut_content, int* ucta_content);

// input: Tnode.ucta[fo]; (aggregated)
// output: integer index of argmax Tnode.ucta[fo]; 
int hierarchical_cluts(Tnode node_entr, ap_int<1> init_control, int* clut_contenty);

// input: ucta[f]; (aggregated)
// output: integer index of argmax ucta[f]; dtype max ucta[f];
template<int clut_id>
void clut(sub_array ucta, int argmaxu, dtype maxu, ap_int<1> init_control, int* clut_content);

// template<int i, int j>
// bool comparison(dtype ucti, dtype uctj);

