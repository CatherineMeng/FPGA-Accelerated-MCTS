

#include <hls_stream.h>
#include <ap_int.h>
#include <cmath>

#define D 32 //32 stages
#define Y 64 //64 banks
#define fo 3 //action space(fanout)

using namespace std;

// typedef ap_int<16> dtype;
typedef ap_int<3> fotype; //used to record number of expanded childs, bitwidth determined by action space N. 2^bitwidth>=fo.
typedef ap_fixed<18,10> dtype; //UCT sqrt term type. <a,b>: b-bit integer,a-b bit fractional.
typedef ap_fixed<18,10> rtype; //reward/utility type
// typedef int sigtype; //control signal

typedef ap_int<1> ctrlbit; //instead of using accumulation counter, used to control the termination ofwhile loops

struct item{
    int pipstage;
    int bankidx;
    int nodeidx;
};


struct interconnection_io{
    item intf[D];
};

// struct interconnection_m{
    // hls::stream<item> intf[2*D];
// };


struct Tnode
{
    dtype numv; //num visits to the parent
    fotype numc; //num expanded children. init as 0. numc<fo means leaf.
    dtype ucta[fo];
    // int cind[fo]; //not useful bc we are encoding index-address assuming complete trees
    dtype numvc[fo]; //num visits to all childs	
    dtype bkidx[fo]; //bank indices of all child node entries
    dtype neidx[fo]; //Tnode entry indices of all child node entries in their bank	
    // dtype ndidx[fo]; //node indices of all childs	
};

// template<Y>
//cannot aggregate more than 4096 bits, so if Y>16, use multiple tree_banks ports
// struct tree_banks{
//     Tnode banks[Y];
// };
struct tree_banks{
    Tnode banks[16]; //can only aggregate 16 banks at max
};
//in kernel modules, tree_banks arr[1024] means the tree is stored in Y banks (aggregated), each has 1024 elements. In the dimension Y the tree can be accessed in parallel.

// top function
extern "C" void top(int* out);

void switch_in(hls::stream<item> &inpipe0, hls::stream<item> &inpipe1, hls::stream<item> &inpipe2, hls::stream<item> &inpipe3,
	hls::stream<item> &inpipe4, hls::stream<item> &inpipe5, hls::stream<item> &inpipe6, hls::stream<item> &inpipe7,
	hls::stream<item> &inpipe8, hls::stream<item> &inpipe9, hls::stream<item> &inpipe10, hls::stream<item> &inpipe11,
	hls::stream<item> &inpipe12, hls::stream<item> &inpipe13, hls::stream<item> &inpipe14, hls::stream<item> &inpipe15,
	hls::stream<item> &inpipe16, hls::stream<item> &inpipe17, hls::stream<item> &inpipe18, hls::stream<item> &inpipe19,
	hls::stream<item> &inpipe20, hls::stream<item> &inpipe21, hls::stream<item> &inpipe22, hls::stream<item> &inpipe23,
	hls::stream<item> &inpipe24, hls::stream<item> &inpipe25, hls::stream<item> &inpipe26, hls::stream<item> &inpipe27,
	hls::stream<item> &inpipe28, hls::stream<item> &inpipe29, hls::stream<item> &inpipe30, hls::stream<item> &inpipe31,
	hls::stream<item> &pipe_l0_0to0, hls::stream<item> &pipe_l0_0to1,hls::stream<item> &pipe_l0_1to0, hls::stream<item> &pipe_l0_1to1,
	hls::stream<item> &pipe_l0_2to2, hls::stream<item> &pipe_l0_2to3,hls::stream<item> &pipe_l0_3to2, hls::stream<item> &pipe_l0_3to3,
	hls::stream<item> &pipe_l0_4to4, hls::stream<item> &pipe_l0_4to5,hls::stream<item> &pipe_l0_5to4, hls::stream<item> &pipe_l0_5to5,
	hls::stream<item> &pipe_l0_6to6, hls::stream<item> &pipe_l0_6to7,hls::stream<item> &pipe_l0_7to6, hls::stream<item> &pipe_l0_7to7,
	hls::stream<item> &pipe_l0_8to8, hls::stream<item> &pipe_l0_8to9,hls::stream<item> &pipe_l0_9to8, hls::stream<item> &pipe_l0_9to9,
	hls::stream<item> &pipe_l0_10to10, hls::stream<item> &pipe_l0_10to11,hls::stream<item> &pipe_l0_11to10, hls::stream<item> &pipe_l0_11to11,
	hls::stream<item> &pipe_l0_12to12, hls::stream<item> &pipe_l0_12to13,hls::stream<item> &pipe_l0_13to12, hls::stream<item> &pipe_l0_13to13,
	hls::stream<item> &pipe_l0_14to14, hls::stream<item> &pipe_l0_14to15,hls::stream<item> &pipe_l0_15to14, hls::stream<item> &pipe_l0_15to15,
	hls::stream<item> &pipe_l0_16to16, hls::stream<item> &pipe_l0_16to17,hls::stream<item> &pipe_l0_17to16, hls::stream<item> &pipe_l0_17to17,
	hls::stream<item> &pipe_l0_18to18, hls::stream<item> &pipe_l0_18to19,hls::stream<item> &pipe_l0_19to18, hls::stream<item> &pipe_l0_19to19,
	hls::stream<item> &pipe_l0_20to20, hls::stream<item> &pipe_l0_20to21,hls::stream<item> &pipe_l0_21to20, hls::stream<item> &pipe_l0_21to21,
	hls::stream<item> &pipe_l0_22to22, hls::stream<item> &pipe_l0_22to23,hls::stream<item> &pipe_l0_23to22, hls::stream<item> &pipe_l0_23to23,
	hls::stream<item> &pipe_l0_24to24, hls::stream<item> &pipe_l0_24to25,hls::stream<item> &pipe_l0_25to24, hls::stream<item> &pipe_l0_25to25,
	hls::stream<item> &pipe_l0_26to26, hls::stream<item> &pipe_l0_26to27,hls::stream<item> &pipe_l0_27to26, hls::stream<item> &pipe_l0_27to27,
	hls::stream<item> &pipe_l0_28to28, hls::stream<item> &pipe_l0_28to29,hls::stream<item> &pipe_l0_29to28, hls::stream<item> &pipe_l0_29to29,
	hls::stream<item> &pipe_l0_30to30, hls::stream<item> &pipe_l0_30to31,hls::stream<item> &pipe_l0_31to30, hls::stream<item> &pipe_l0_31to31,
	hls::stream<ctrlbit> &ctrl_i);

template<int pow_2_bit_id_plusone, int pow_2_bit_id>
void switch_m(hls::stream<item> &in0_up, hls::stream<item> &in0_down,hls::stream<item> &in1_up, hls::stream<item> &in1_down,
			hls::stream<item> &in2_up, hls::stream<item> &in2_down,hls::stream<item> &in3_up, hls::stream<item> &in3_down,
			hls::stream<item> &in4_up, hls::stream<item> &in4_down,hls::stream<item> &in5_up, hls::stream<item> &in5_down,
			hls::stream<item> &in6_up, hls::stream<item> &in6_down,hls::stream<item> &in7_up, hls::stream<item> &in7_down,
			hls::stream<item> &in8_up, hls::stream<item> &in8_down,hls::stream<item> &in9_up, hls::stream<item> &in9_down,
			hls::stream<item> &in10_up, hls::stream<item> &in10_down,hls::stream<item> &in11_up, hls::stream<item> &in11_down,
			hls::stream<item> &in12_up, hls::stream<item> &in12_down,hls::stream<item> &in13_up, hls::stream<item> &in13_down,
			hls::stream<item> &in14_up, hls::stream<item> &in14_down,hls::stream<item> &in15_up, hls::stream<item> &in15_down,
			hls::stream<item> &in16_up, hls::stream<item> &in16_down,hls::stream<item> &in17_up, hls::stream<item> &in17_down,
			hls::stream<item> &in18_up, hls::stream<item> &in18_down,hls::stream<item> &in19_up, hls::stream<item> &in19_down,
			hls::stream<item> &in20_up, hls::stream<item> &in20_down,hls::stream<item> &in21_up, hls::stream<item> &in21_down,
			hls::stream<item> &in22_up, hls::stream<item> &in22_down,hls::stream<item> &in23_up, hls::stream<item> &in23_down,
			hls::stream<item> &in24_up, hls::stream<item> &in24_down,hls::stream<item> &in25_up, hls::stream<item> &in25_down,
			hls::stream<item> &in26_up, hls::stream<item> &in26_down,hls::stream<item> &in27_up, hls::stream<item> &in27_down,
			hls::stream<item> &in28_up, hls::stream<item> &in28_down,hls::stream<item> &in29_up, hls::stream<item> &in29_down,
			hls::stream<item> &in30_up, hls::stream<item> &in30_down,hls::stream<item> &in31_up, hls::stream<item> &in31_down,
			hls::stream<item> &out0_up, hls::stream<item> &out0_down,hls::stream<item> &out1_up, hls::stream<item> &out1_down,
			hls::stream<item> &out2_up, hls::stream<item> &out2_down,hls::stream<item> &out3_up, hls::stream<item> &out3_down,
			hls::stream<item> &out4_up, hls::stream<item> &out4_down,hls::stream<item> &out5_up, hls::stream<item> &out5_down,
			hls::stream<item> &out6_up, hls::stream<item> &out6_down,hls::stream<item> &out7_up, hls::stream<item> &out7_down,
			hls::stream<item> &out8_up, hls::stream<item> &out8_down,hls::stream<item> &out9_up, hls::stream<item> &out9_down,
			hls::stream<item> &out10_up, hls::stream<item> &out10_down,hls::stream<item> &out11_up, hls::stream<item> &out11_down,
			hls::stream<item> &out12_up, hls::stream<item> &out12_down,hls::stream<item> &out13_up, hls::stream<item> &out13_down,
			hls::stream<item> &out14_up, hls::stream<item> &out14_down,hls::stream<item> &out15_up, hls::stream<item> &out15_down,
			hls::stream<item> &out16_up, hls::stream<item> &out16_down,hls::stream<item> &out17_up, hls::stream<item> &out17_down,
			hls::stream<item> &out18_up, hls::stream<item> &out18_down,hls::stream<item> &out19_up, hls::stream<item> &out19_down,
			hls::stream<item> &out20_up, hls::stream<item> &out20_down,hls::stream<item> &out21_up, hls::stream<item> &out21_down,
			hls::stream<item> &out22_up, hls::stream<item> &out22_down,hls::stream<item> &out23_up, hls::stream<item> &out23_down,
			hls::stream<item> &out24_up, hls::stream<item> &out24_down,hls::stream<item> &out25_up, hls::stream<item> &out25_down,
			hls::stream<item> &out26_up, hls::stream<item> &out26_down,hls::stream<item> &out27_up, hls::stream<item> &out27_down,
			hls::stream<item> &out28_up, hls::stream<item> &out28_down,hls::stream<item> &out29_up, hls::stream<item> &out29_down,
			hls::stream<item> &out30_up, hls::stream<item> &out30_down,hls::stream<item> &out31_up, hls::stream<item> &out31_down,
			hls::stream<ctrlbit> &ctrl_i,hls::stream<ctrlbit> &ctrl_o);

void switch_out(hls::stream<item> &inpipe0up, hls::stream<item> &inpipe0down,hls::stream<item> &inpipe1up, hls::stream<item> &inpipe1down,
				hls::stream<item> &inpipe2up, hls::stream<item> &inpipe2down,hls::stream<item> &inpipe3up, hls::stream<item> &inpipe3down,
				hls::stream<item> &inpipe4up, hls::stream<item> &inpipe4down,hls::stream<item> &inpipe5up, hls::stream<item> &inpipe5down,
				hls::stream<item> &inpipe6up, hls::stream<item> &inpipe6down,hls::stream<item> &inpipe7up, hls::stream<item> &inpipe7down,
				hls::stream<item> &inpipe8up, hls::stream<item> &inpipe8down,hls::stream<item> &inpipe9up, hls::stream<item> &inpipe9down,
				hls::stream<item> &inpipe10up, hls::stream<item> &inpipe10down,hls::stream<item> &inpipe11up, hls::stream<item> &inpipe11down,
				hls::stream<item> &inpipe12up, hls::stream<item> &inpipe12down,hls::stream<item> &inpipe13up, hls::stream<item> &inpipe13down,
				hls::stream<item> &inpipe14up, hls::stream<item> &inpipe14down,hls::stream<item> &inpipe15up, hls::stream<item> &inpipe15down,
				hls::stream<item> &inpipe16up, hls::stream<item> &inpipe16down,hls::stream<item> &inpipe17up, hls::stream<item> &inpipe17down,
				hls::stream<item> &inpipe18up, hls::stream<item> &inpipe18down,hls::stream<item> &inpipe19up, hls::stream<item> &inpipe19down,
				hls::stream<item> &inpipe20up, hls::stream<item> &inpipe20down,hls::stream<item> &inpipe21up, hls::stream<item> &inpipe21down,
				hls::stream<item> &inpipe22up, hls::stream<item> &inpipe22down,hls::stream<item> &inpipe23up, hls::stream<item> &inpipe23down,
				hls::stream<item> &inpipe24up, hls::stream<item> &inpipe24down,hls::stream<item> &inpipe25up, hls::stream<item> &inpipe25down,
				hls::stream<item> &inpipe26up, hls::stream<item> &inpipe26down,hls::stream<item> &inpipe27up, hls::stream<item> &inpipe27down,
				hls::stream<item> &inpipe28up, hls::stream<item> &inpipe28down,hls::stream<item> &inpipe29up, hls::stream<item> &inpipe29down,
				hls::stream<item> &inpipe30up, hls::stream<item> &inpipe30down,hls::stream<item> &inpipe31up, hls::stream<item> &inpipe31down,
				hls::stream<item> &outpipe0, hls::stream<item> &outpipe1,
				hls::stream<item> &outpipe2, hls::stream<item> &outpipe3,
				hls::stream<item> &outpipe4, hls::stream<item> &outpipe5,
				hls::stream<item> &outpipe6, hls::stream<item> &outpipe7,
				hls::stream<item> &outpipe8, hls::stream<item> &outpipe9,
				hls::stream<item> &outpipe10, hls::stream<item> &outpipe11,
				hls::stream<item> &outpipe12, hls::stream<item> &outpipe13,
				hls::stream<item> &outpipe14, hls::stream<item> &outpipe15,
				hls::stream<item> &outpipe16, hls::stream<item> &outpipe17,
				hls::stream<item> &outpipe18, hls::stream<item> &outpipe19,
				hls::stream<item> &outpipe20, hls::stream<item> &outpipe21,
				hls::stream<item> &outpipe22, hls::stream<item> &outpipe23,
				hls::stream<item> &outpipe24, hls::stream<item> &outpipe25,
				hls::stream<item> &outpipe26, hls::stream<item> &outpipe27,
				hls::stream<item> &outpipe28, hls::stream<item> &outpipe29,
				hls::stream<item> &outpipe30, hls::stream<item> &outpipe31,
				 /*access the aggregated banks*/
				tree_banks treemcts0[], //0-15
				tree_banks treemcts1[], //16-31
				tree_banks treemcts2[], //32-47
				tree_banks treemcts3[], //48-63
				hls::stream<ctrlbit> &ctrl_i,hls::stream<ctrlbit> &ctrl_o
				);
void childargmax(int &bankidx,
				int &node_entry_idx, //node entri idx in the bank
				fotype &nodeidx, //node index under this parent (used to index bkidx and neidx arrays of Tnode)
				 /*access the aggregated banks*/
				Tnode to_select);
