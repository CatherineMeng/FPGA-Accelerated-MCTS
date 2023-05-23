
#include <stdio.h>
#include "./dyna_mcts.h"
#include "hls_print.h"

// void Asym_Butterfly_Switch (int *arr, int idx, int lyr){
//     int temp = arr[i];
//     arr[i] = arr[j];
//     arr[j] = temp;
// }

extern "C" {
    void top(int* out) {   
        #pragma HLS INTERFACE m_axi port=out bundle=gmem0 offset=slave
        #pragma HLS INTERFACE s_axilite port=out bundle=control
        #pragma HLS INTERFACE s_axilite port=return bundle=control
        hls::stream<item> pipe_in0;
		hls::stream<item> pipe_in1;
		hls::stream<item> pipe_in2;
		hls::stream<item> pipe_in3;
		hls::stream<item> pipe_in4;
		hls::stream<item> pipe_in5;
		hls::stream<item> pipe_in6;
		hls::stream<item> pipe_in7;
		hls::stream<item> pipe_in8;
		hls::stream<item> pipe_in9;
		hls::stream<item> pipe_in10;
		hls::stream<item> pipe_in11;
		hls::stream<item> pipe_in12;
		hls::stream<item> pipe_in13;
		hls::stream<item> pipe_in14;
		hls::stream<item> pipe_in15;
		hls::stream<item> pipe_in16;
		hls::stream<item> pipe_in17;
		hls::stream<item> pipe_in18;
		hls::stream<item> pipe_in19;
		hls::stream<item> pipe_in20;
		hls::stream<item> pipe_in21;
		hls::stream<item> pipe_in22;
		hls::stream<item> pipe_in23;
		hls::stream<item> pipe_in24;
		hls::stream<item> pipe_in25;
		hls::stream<item> pipe_in26;
		hls::stream<item> pipe_in27;
		hls::stream<item> pipe_in28;
		hls::stream<item> pipe_in29;
		hls::stream<item> pipe_in30;
		hls::stream<item> pipe_in31;

		hls::stream<item> pipe_l0_0to0;
		hls::stream<item> pipe_l0_0to1;
		hls::stream<item> pipe_l0_1to0;
		hls::stream<item> pipe_l0_1to1;
		hls::stream<item> pipe_l0_2to2;
		hls::stream<item> pipe_l0_2to3;
		hls::stream<item> pipe_l0_3to2;
		hls::stream<item> pipe_l0_3to3;
		hls::stream<item> pipe_l0_4to4;
		hls::stream<item> pipe_l0_4to5;
		hls::stream<item> pipe_l0_5to4;
		hls::stream<item> pipe_l0_5to5;
		hls::stream<item> pipe_l0_6to6;
		hls::stream<item> pipe_l0_6to7;
		hls::stream<item> pipe_l0_7to6;
		hls::stream<item> pipe_l0_7to7;
		hls::stream<item> pipe_l0_8to8;
		hls::stream<item> pipe_l0_8to9;
		hls::stream<item> pipe_l0_9to8;
		hls::stream<item> pipe_l0_9to9;
		hls::stream<item> pipe_l0_10to10;
		hls::stream<item> pipe_l0_10to11;
		hls::stream<item> pipe_l0_11to10;
		hls::stream<item> pipe_l0_11to11;
		hls::stream<item> pipe_l0_12to12;
		hls::stream<item> pipe_l0_12to13;
		hls::stream<item> pipe_l0_13to12;
		hls::stream<item> pipe_l0_13to13;
		hls::stream<item> pipe_l0_14to14;
		hls::stream<item> pipe_l0_14to15;
		hls::stream<item> pipe_l0_15to14;
		hls::stream<item> pipe_l0_15to15;
		hls::stream<item> pipe_l0_16to16;
		hls::stream<item> pipe_l0_16to17;
		hls::stream<item> pipe_l0_17to16;
		hls::stream<item> pipe_l0_17to17;
		hls::stream<item> pipe_l0_18to18;
		hls::stream<item> pipe_l0_18to19;
		hls::stream<item> pipe_l0_19to18;
		hls::stream<item> pipe_l0_19to19;
		hls::stream<item> pipe_l0_20to20;
		hls::stream<item> pipe_l0_20to21;
		hls::stream<item> pipe_l0_21to20;
		hls::stream<item> pipe_l0_21to21;
		hls::stream<item> pipe_l0_22to22;
		hls::stream<item> pipe_l0_22to23;
		hls::stream<item> pipe_l0_23to22;
		hls::stream<item> pipe_l0_23to23;
		hls::stream<item> pipe_l0_24to24;
		hls::stream<item> pipe_l0_24to25;
		hls::stream<item> pipe_l0_25to24;
		hls::stream<item> pipe_l0_25to25;
		hls::stream<item> pipe_l0_26to26;
		hls::stream<item> pipe_l0_26to27;
		hls::stream<item> pipe_l0_27to26;
		hls::stream<item> pipe_l0_27to27;
		hls::stream<item> pipe_l0_28to28;
		hls::stream<item> pipe_l0_28to29;
		hls::stream<item> pipe_l0_29to28;
		hls::stream<item> pipe_l0_29to29;
		hls::stream<item> pipe_l0_30to30;
		hls::stream<item> pipe_l0_30to31;
		hls::stream<item> pipe_l0_31to30;
		hls::stream<item> pipe_l0_31to31;


		hls::stream<item> pipe_l1_0to0;
		hls::stream<item> pipe_l1_0to2;
		hls::stream<item> pipe_l1_1to1;
		hls::stream<item> pipe_l1_1to3;
		hls::stream<item> pipe_l1_2to0;
		hls::stream<item> pipe_l1_2to2;
		hls::stream<item> pipe_l1_3to1;
		hls::stream<item> pipe_l1_3to3;
		hls::stream<item> pipe_l1_4to4;
		hls::stream<item> pipe_l1_4to6;
		hls::stream<item> pipe_l1_5to5;
		hls::stream<item> pipe_l1_5to7;
		hls::stream<item> pipe_l1_6to4;
		hls::stream<item> pipe_l1_6to6;
		hls::stream<item> pipe_l1_7to5;
		hls::stream<item> pipe_l1_7to7;
		hls::stream<item> pipe_l1_8to8;
		hls::stream<item> pipe_l1_8to10;
		hls::stream<item> pipe_l1_9to9;
		hls::stream<item> pipe_l1_9to11;
		hls::stream<item> pipe_l1_10to8;
		hls::stream<item> pipe_l1_10to10;
		hls::stream<item> pipe_l1_11to9;
		hls::stream<item> pipe_l1_11to11;
		hls::stream<item> pipe_l1_12to12;
		hls::stream<item> pipe_l1_12to14;
		hls::stream<item> pipe_l1_13to13;
		hls::stream<item> pipe_l1_13to15;
		hls::stream<item> pipe_l1_14to12;
		hls::stream<item> pipe_l1_14to14;
		hls::stream<item> pipe_l1_15to13;
		hls::stream<item> pipe_l1_15to15;
		hls::stream<item> pipe_l1_16to16;
		hls::stream<item> pipe_l1_16to18;
		hls::stream<item> pipe_l1_17to17;
		hls::stream<item> pipe_l1_17to19;
		hls::stream<item> pipe_l1_18to16;
		hls::stream<item> pipe_l1_18to18;
		hls::stream<item> pipe_l1_19to17;
		hls::stream<item> pipe_l1_19to19;
		hls::stream<item> pipe_l1_20to20;
		hls::stream<item> pipe_l1_20to22;
		hls::stream<item> pipe_l1_21to21;
		hls::stream<item> pipe_l1_21to23;
		hls::stream<item> pipe_l1_22to20;
		hls::stream<item> pipe_l1_22to22;
		hls::stream<item> pipe_l1_23to21;
		hls::stream<item> pipe_l1_23to23;
		hls::stream<item> pipe_l1_24to24;
		hls::stream<item> pipe_l1_24to26;
		hls::stream<item> pipe_l1_25to25;
		hls::stream<item> pipe_l1_25to27;
		hls::stream<item> pipe_l1_26to24;
		hls::stream<item> pipe_l1_26to26;
		hls::stream<item> pipe_l1_27to25;
		hls::stream<item> pipe_l1_27to27;
		hls::stream<item> pipe_l1_28to28;
		hls::stream<item> pipe_l1_28to30;
		hls::stream<item> pipe_l1_29to29;
		hls::stream<item> pipe_l1_29to31;
		hls::stream<item> pipe_l1_30to28;
		hls::stream<item> pipe_l1_30to30;
		hls::stream<item> pipe_l1_31to29;
		hls::stream<item> pipe_l1_31to31;


		hls::stream<item> pipe_l2_0to0;
		hls::stream<item> pipe_l2_0to4;
		hls::stream<item> pipe_l2_1to1;
		hls::stream<item> pipe_l2_1to5;
		hls::stream<item> pipe_l2_2to2;
		hls::stream<item> pipe_l2_2to6;
		hls::stream<item> pipe_l2_3to3;
		hls::stream<item> pipe_l2_3to7;
		hls::stream<item> pipe_l2_4to0;
		hls::stream<item> pipe_l2_4to4;
		hls::stream<item> pipe_l2_5to1;
		hls::stream<item> pipe_l2_5to5;
		hls::stream<item> pipe_l2_6to2;
		hls::stream<item> pipe_l2_6to6;
		hls::stream<item> pipe_l2_7to3;
		hls::stream<item> pipe_l2_7to7;
		hls::stream<item> pipe_l2_8to8;
		hls::stream<item> pipe_l2_8to12;
		hls::stream<item> pipe_l2_9to9;
		hls::stream<item> pipe_l2_9to13;
		hls::stream<item> pipe_l2_10to10;
		hls::stream<item> pipe_l2_10to14;
		hls::stream<item> pipe_l2_11to11;
		hls::stream<item> pipe_l2_11to15;
		hls::stream<item> pipe_l2_12to8;
		hls::stream<item> pipe_l2_12to12;
		hls::stream<item> pipe_l2_13to9;
		hls::stream<item> pipe_l2_13to13;
		hls::stream<item> pipe_l2_14to10;
		hls::stream<item> pipe_l2_14to14;
		hls::stream<item> pipe_l2_15to11;
		hls::stream<item> pipe_l2_15to15;
		hls::stream<item> pipe_l2_16to16;
		hls::stream<item> pipe_l2_16to20;
		hls::stream<item> pipe_l2_17to17;
		hls::stream<item> pipe_l2_17to21;
		hls::stream<item> pipe_l2_18to18;
		hls::stream<item> pipe_l2_18to22;
		hls::stream<item> pipe_l2_19to19;
		hls::stream<item> pipe_l2_19to23;
		hls::stream<item> pipe_l2_20to16;
		hls::stream<item> pipe_l2_20to20;
		hls::stream<item> pipe_l2_21to17;
		hls::stream<item> pipe_l2_21to21;
		hls::stream<item> pipe_l2_22to18;
		hls::stream<item> pipe_l2_22to22;
		hls::stream<item> pipe_l2_23to19;
		hls::stream<item> pipe_l2_23to23;
		hls::stream<item> pipe_l2_24to24;
		hls::stream<item> pipe_l2_24to28;
		hls::stream<item> pipe_l2_25to25;
		hls::stream<item> pipe_l2_25to29;
		hls::stream<item> pipe_l2_26to26;
		hls::stream<item> pipe_l2_26to30;
		hls::stream<item> pipe_l2_27to27;
		hls::stream<item> pipe_l2_27to31;
		hls::stream<item> pipe_l2_28to24;
		hls::stream<item> pipe_l2_28to28;
		hls::stream<item> pipe_l2_29to25;
		hls::stream<item> pipe_l2_29to29;
		hls::stream<item> pipe_l2_30to26;
		hls::stream<item> pipe_l2_30to30;
		hls::stream<item> pipe_l2_31to27;
		hls::stream<item> pipe_l2_31to31;


		hls::stream<item> pipe_l3_0to0;
		hls::stream<item> pipe_l3_0to8;
		hls::stream<item> pipe_l3_1to1;
		hls::stream<item> pipe_l3_1to9;
		hls::stream<item> pipe_l3_2to2;
		hls::stream<item> pipe_l3_2to10;
		hls::stream<item> pipe_l3_3to3;
		hls::stream<item> pipe_l3_3to11;
		hls::stream<item> pipe_l3_4to4;
		hls::stream<item> pipe_l3_4to12;
		hls::stream<item> pipe_l3_5to5;
		hls::stream<item> pipe_l3_5to13;
		hls::stream<item> pipe_l3_6to6;
		hls::stream<item> pipe_l3_6to14;
		hls::stream<item> pipe_l3_7to7;
		hls::stream<item> pipe_l3_7to15;
		hls::stream<item> pipe_l3_8to0;
		hls::stream<item> pipe_l3_8to8;
		hls::stream<item> pipe_l3_9to1;
		hls::stream<item> pipe_l3_9to9;
		hls::stream<item> pipe_l3_10to2;
		hls::stream<item> pipe_l3_10to10;
		hls::stream<item> pipe_l3_11to3;
		hls::stream<item> pipe_l3_11to11;
		hls::stream<item> pipe_l3_12to4;
		hls::stream<item> pipe_l3_12to12;
		hls::stream<item> pipe_l3_13to5;
		hls::stream<item> pipe_l3_13to13;
		hls::stream<item> pipe_l3_14to6;
		hls::stream<item> pipe_l3_14to14;
		hls::stream<item> pipe_l3_15to7;
		hls::stream<item> pipe_l3_15to15;
		hls::stream<item> pipe_l3_16to16;
		hls::stream<item> pipe_l3_16to24;
		hls::stream<item> pipe_l3_17to17;
		hls::stream<item> pipe_l3_17to25;
		hls::stream<item> pipe_l3_18to18;
		hls::stream<item> pipe_l3_18to26;
		hls::stream<item> pipe_l3_19to19;
		hls::stream<item> pipe_l3_19to27;
		hls::stream<item> pipe_l3_20to20;
		hls::stream<item> pipe_l3_20to28;
		hls::stream<item> pipe_l3_21to21;
		hls::stream<item> pipe_l3_21to29;
		hls::stream<item> pipe_l3_22to22;
		hls::stream<item> pipe_l3_22to30;
		hls::stream<item> pipe_l3_23to23;
		hls::stream<item> pipe_l3_23to31;
		hls::stream<item> pipe_l3_24to16;
		hls::stream<item> pipe_l3_24to24;
		hls::stream<item> pipe_l3_25to17;
		hls::stream<item> pipe_l3_25to25;
		hls::stream<item> pipe_l3_26to18;
		hls::stream<item> pipe_l3_26to26;
		hls::stream<item> pipe_l3_27to19;
		hls::stream<item> pipe_l3_27to27;
		hls::stream<item> pipe_l3_28to20;
		hls::stream<item> pipe_l3_28to28;
		hls::stream<item> pipe_l3_29to21;
		hls::stream<item> pipe_l3_29to29;
		hls::stream<item> pipe_l3_30to22;
		hls::stream<item> pipe_l3_30to30;
		hls::stream<item> pipe_l3_31to23;
		hls::stream<item> pipe_l3_31to31;


		hls::stream<item> pipe_l4_0to0;
		hls::stream<item> pipe_l4_0to16;
		hls::stream<item> pipe_l4_1to1;
		hls::stream<item> pipe_l4_1to17;
		hls::stream<item> pipe_l4_2to2;
		hls::stream<item> pipe_l4_2to18;
		hls::stream<item> pipe_l4_3to3;
		hls::stream<item> pipe_l4_3to19;
		hls::stream<item> pipe_l4_4to4;
		hls::stream<item> pipe_l4_4to20;
		hls::stream<item> pipe_l4_5to5;
		hls::stream<item> pipe_l4_5to21;
		hls::stream<item> pipe_l4_6to6;
		hls::stream<item> pipe_l4_6to22;
		hls::stream<item> pipe_l4_7to7;
		hls::stream<item> pipe_l4_7to23;
		hls::stream<item> pipe_l4_8to8;
		hls::stream<item> pipe_l4_8to24;
		hls::stream<item> pipe_l4_9to9;
		hls::stream<item> pipe_l4_9to25;
		hls::stream<item> pipe_l4_10to10;
		hls::stream<item> pipe_l4_10to26;
		hls::stream<item> pipe_l4_11to11;
		hls::stream<item> pipe_l4_11to27;
		hls::stream<item> pipe_l4_12to12;
		hls::stream<item> pipe_l4_12to28;
		hls::stream<item> pipe_l4_13to13;
		hls::stream<item> pipe_l4_13to29;
		hls::stream<item> pipe_l4_14to14;
		hls::stream<item> pipe_l4_14to30;
		hls::stream<item> pipe_l4_15to15;
		hls::stream<item> pipe_l4_15to31;
		hls::stream<item> pipe_l4_16to0;
		hls::stream<item> pipe_l4_16to16;
		hls::stream<item> pipe_l4_17to1;
		hls::stream<item> pipe_l4_17to17;
		hls::stream<item> pipe_l4_18to2;
		hls::stream<item> pipe_l4_18to18;
		hls::stream<item> pipe_l4_19to3;
		hls::stream<item> pipe_l4_19to19;
		hls::stream<item> pipe_l4_20to4;
		hls::stream<item> pipe_l4_20to20;
		hls::stream<item> pipe_l4_21to5;
		hls::stream<item> pipe_l4_21to21;
		hls::stream<item> pipe_l4_22to6;
		hls::stream<item> pipe_l4_22to22;
		hls::stream<item> pipe_l4_23to7;
		hls::stream<item> pipe_l4_23to23;
		hls::stream<item> pipe_l4_24to8;
		hls::stream<item> pipe_l4_24to24;
		hls::stream<item> pipe_l4_25to9;
		hls::stream<item> pipe_l4_25to25;
		hls::stream<item> pipe_l4_26to10;
		hls::stream<item> pipe_l4_26to26;
		hls::stream<item> pipe_l4_27to11;
		hls::stream<item> pipe_l4_27to27;
		hls::stream<item> pipe_l4_28to12;
		hls::stream<item> pipe_l4_28to28;
		hls::stream<item> pipe_l4_29to13;
		hls::stream<item> pipe_l4_29to29;
		hls::stream<item> pipe_l4_30to14;
		hls::stream<item> pipe_l4_30to30;
		hls::stream<item> pipe_l4_31to15;
		hls::stream<item> pipe_l4_31to31;


		hls::stream<item> pipe_out0;
		hls::stream<item> pipe_out1;
		hls::stream<item> pipe_out2;
		hls::stream<item> pipe_out3;
		hls::stream<item> pipe_out4;
		hls::stream<item> pipe_out5;
		hls::stream<item> pipe_out6;
		hls::stream<item> pipe_out7;
		hls::stream<item> pipe_out8;
		hls::stream<item> pipe_out9;
		hls::stream<item> pipe_out10;
		hls::stream<item> pipe_out11;
		hls::stream<item> pipe_out12;
		hls::stream<item> pipe_out13;
		hls::stream<item> pipe_out14;
		hls::stream<item> pipe_out15;
		hls::stream<item> pipe_out16;
		hls::stream<item> pipe_out17;
		hls::stream<item> pipe_out18;
		hls::stream<item> pipe_out19;
		hls::stream<item> pipe_out20;
		hls::stream<item> pipe_out21;
		hls::stream<item> pipe_out22;
		hls::stream<item> pipe_out23;
		hls::stream<item> pipe_out24;
		hls::stream<item> pipe_out25;
		hls::stream<item> pipe_out26;
		hls::stream<item> pipe_out27;
		hls::stream<item> pipe_out28;
		hls::stream<item> pipe_out29;
		hls::stream<item> pipe_out30;
		hls::stream<item> pipe_out31;

		hls::stream<ctrlbit> ctrl_i_0; 
		hls::stream<ctrlbit> ctrl_0_1; 
		hls::stream<ctrlbit> ctrl_1_2; 
		hls::stream<ctrlbit> ctrl_2_3; 
		hls::stream<ctrlbit> ctrl_3_o;
		// hls::stream<ctrlbit> ctrl_4_o;
		hls::stream<ctrlbit> ctrl_o_r;
        // #pragma HLS stream variable=pipe_l0_00 depth=2
        

        // int banks[4][16]; 
        tree_banks MCTSTree0[32]; //size of MCTSTree: how many Tnode entry can a bank store
        tree_banks MCTSTree1[32]; //size of MCTSTree: how many Tnode entry can a bank store
        tree_banks MCTSTree2[32]; //size of MCTSTree: how many Tnode entry can a bank store
        tree_banks MCTSTree3[32]; //size of MCTSTree: how many Tnode entry can a bank store
        // #pragma HLS ARRAY_PARTITION variable=MCTSTree dim=1 complete
        #pragma HLS bind_storage variable=MCTSTree0 type=RAM_2P impl=BRAM
        #pragma HLS bind_storage variable=MCTSTree1 type=RAM_2P impl=BRAM
        #pragma HLS bind_storage variable=MCTSTree2 type=RAM_2P impl=BRAM
        #pragma HLS bind_storage variable=MCTSTree3 type=RAM_2P impl=URAM

        // int shift_arr[2] ={5}; //in real imp, size D. 5 is the placeholder for drain data. drain data always go through horizontal pipes in the network.
        item init_item; init_item.pipstage=D+1; init_item.bankidx=Y+1; init_item.nodeidx=0;
        item shift_arr[D] ={init_item};
        #pragma HLS array_partition variable=shift_arr type=complete

        // int gen_cnt=0; //hypothetical root-level index generator, delete in real impl
        Tnode Troot;
        /*TODO: init logic*/
        for (int i=0; i<fo; i++){
        	Troot.ucta[i]=i;
        	Troot.bkidx[i]=0;
        	Troot.neidx[i]=i;
        }
        
        loop_dataflow:for (int i=0;i<16+2*D;i++){ //TODO: loop trip count should be D+p+D, placeholder input needed at drain
        	#pragma HLS pipeline off
        	//===generate root level bank idx. only generate 16 time. after 16 times, generate 5 (placeholder). use a hyopthetical counter gen_cnt
        	//get max child at root level
			int cd_bkidx;int cd_neidx;fotype cd_ndidx;
			item root_level_item;
			childargmax(cd_bkidx,cd_neidx, cd_ndidx,Troot); //assigned values to new_bkidx amd new_neidx
			root_level_item.bankidx = cd_bkidx;
			root_level_item.nodeidx = cd_neidx;
			root_level_item.pipstage=0;
			Troot.ucta[cd_ndidx]-=1; //TODO: apply VL
        	shift_arr[0]= root_level_item;

        	//===================================================================
        	{
	        	#pragma HLS DATAFLOW

	        	printf("========loop %d========\n", i);
	        	
				pipe_in0.write(shift_arr[0]);pipe_in1.write(shift_arr[1]);pipe_in2.write(shift_arr[2]);pipe_in3.write(shift_arr[3]);
				pipe_in4.write(shift_arr[4]);pipe_in5.write(shift_arr[5]);pipe_in6.write(shift_arr[6]);pipe_in7.write(shift_arr[7]);
				pipe_in8.write(shift_arr[8]);pipe_in9.write(shift_arr[9]);pipe_in10.write(shift_arr[10]);pipe_in11.write(shift_arr[11]);
				pipe_in12.write(shift_arr[12]);pipe_in13.write(shift_arr[13]);pipe_in14.write(shift_arr[14]);pipe_in15.write(shift_arr[15]);
				pipe_in16.write(shift_arr[16]);pipe_in17.write(shift_arr[17]);pipe_in18.write(shift_arr[18]);pipe_in19.write(shift_arr[19]);
				pipe_in20.write(shift_arr[20]);pipe_in21.write(shift_arr[21]);pipe_in22.write(shift_arr[22]);pipe_in23.write(shift_arr[23]);
				pipe_in24.write(shift_arr[24]);pipe_in25.write(shift_arr[25]);pipe_in26.write(shift_arr[26]);pipe_in27.write(shift_arr[27]);
				pipe_in28.write(shift_arr[28]);pipe_in29.write(shift_arr[29]);pipe_in30.write(shift_arr[30]);pipe_in31.write(shift_arr[31]);
				switch_in(pipe_in0, pipe_in1, pipe_in2, pipe_in3,
				pipe_in4, pipe_in5, pipe_in6, pipe_in7,
				pipe_in8, pipe_in9, pipe_in10, pipe_in11,
				pipe_in12, pipe_in13, pipe_in14, pipe_in15,
				pipe_in16, pipe_in17, pipe_in18, pipe_in19,
				pipe_in20, pipe_in21, pipe_in22, pipe_in23,
				pipe_in24, pipe_in25, pipe_in26, pipe_in27,
				pipe_in28, pipe_in29, pipe_in30, pipe_in31,
				pipe_l0_0to0, pipe_l0_0to1,pipe_l0_1to0, pipe_l0_1to1,
				pipe_l0_2to2, pipe_l0_2to3,pipe_l0_3to2, pipe_l0_3to3,
				pipe_l0_4to4, pipe_l0_4to5,pipe_l0_5to4, pipe_l0_5to5,
				pipe_l0_6to6, pipe_l0_6to7,pipe_l0_7to6, pipe_l0_7to7,
				pipe_l0_8to8, pipe_l0_8to9,pipe_l0_9to8, pipe_l0_9to9,
				pipe_l0_10to10, pipe_l0_10to11,pipe_l0_11to10, pipe_l0_11to11,
				pipe_l0_12to12, pipe_l0_12to13,pipe_l0_13to12, pipe_l0_13to13,
				pipe_l0_14to14, pipe_l0_14to15,pipe_l0_15to14, pipe_l0_15to15,
				pipe_l0_16to16, pipe_l0_16to17,pipe_l0_17to16, pipe_l0_17to17,
				pipe_l0_18to18, pipe_l0_18to19,pipe_l0_19to18, pipe_l0_19to19,
				pipe_l0_20to20, pipe_l0_20to21,pipe_l0_21to20, pipe_l0_21to21,
				pipe_l0_22to22, pipe_l0_22to23,pipe_l0_23to22, pipe_l0_23to23,
				pipe_l0_24to24, pipe_l0_24to25,pipe_l0_25to24, pipe_l0_25to25,
				pipe_l0_26to26, pipe_l0_26to27,pipe_l0_27to26, pipe_l0_27to27,
				pipe_l0_28to28, pipe_l0_28to29,pipe_l0_29to28, pipe_l0_29to29,
				pipe_l0_30to30, pipe_l0_30to31,pipe_l0_31to30, pipe_l0_31to31,ctrl_i_0);
	        	printf("Returned from module in...\n");
				switch_m<2,1>(
				pipe_l0_0to0,pipe_l0_1to0,pipe_l0_0to1,pipe_l0_1to1,pipe_l0_2to2,pipe_l0_3to2,pipe_l0_2to3,pipe_l0_3to3,
				pipe_l0_4to4,pipe_l0_5to4,pipe_l0_4to5,pipe_l0_5to5,pipe_l0_6to6,pipe_l0_7to6,pipe_l0_6to7,pipe_l0_7to7,
				pipe_l0_8to8,pipe_l0_9to8,pipe_l0_8to9,pipe_l0_9to9,pipe_l0_10to10,pipe_l0_11to10,pipe_l0_10to11,pipe_l0_11to11,
				pipe_l0_12to12,pipe_l0_13to12,pipe_l0_12to13,pipe_l0_13to13,pipe_l0_14to14,pipe_l0_15to14,pipe_l0_14to15,pipe_l0_15to15,
				pipe_l0_16to16,pipe_l0_17to16,pipe_l0_16to17,pipe_l0_17to17,pipe_l0_18to18,pipe_l0_19to18,pipe_l0_18to19,pipe_l0_19to19,
				pipe_l0_20to20,pipe_l0_21to20,pipe_l0_20to21,pipe_l0_21to21,pipe_l0_22to22,pipe_l0_23to22,pipe_l0_22to23,pipe_l0_23to23,
				pipe_l0_24to24,pipe_l0_25to24,pipe_l0_24to25,pipe_l0_25to25,pipe_l0_26to26,pipe_l0_27to26,pipe_l0_26to27,pipe_l0_27to27,
				pipe_l0_28to28,pipe_l0_29to28,pipe_l0_28to29,pipe_l0_29to29,pipe_l0_30to30,pipe_l0_31to30,pipe_l0_30to31,pipe_l0_31to31,
				pipe_l1_0to0,pipe_l1_0to2,pipe_l1_1to1,pipe_l1_1to3,pipe_l1_2to0,pipe_l1_2to2,pipe_l1_3to1,pipe_l1_3to3,
				pipe_l1_4to4,pipe_l1_4to6,pipe_l1_5to5,pipe_l1_5to7,pipe_l1_6to4,pipe_l1_6to6,pipe_l1_7to5,pipe_l1_7to7,
				pipe_l1_8to8,pipe_l1_8to10,pipe_l1_9to9,pipe_l1_9to11,pipe_l1_10to8,pipe_l1_10to10,pipe_l1_11to9,pipe_l1_11to11,
				pipe_l1_12to12,pipe_l1_12to14,pipe_l1_13to13,pipe_l1_13to15,pipe_l1_14to12,pipe_l1_14to14,pipe_l1_15to13,pipe_l1_15to15,
				pipe_l1_16to16,pipe_l1_16to18,pipe_l1_17to17,pipe_l1_17to19,pipe_l1_18to16,pipe_l1_18to18,pipe_l1_19to17,pipe_l1_19to19,
				pipe_l1_20to20,pipe_l1_20to22,pipe_l1_21to21,pipe_l1_21to23,pipe_l1_22to20,pipe_l1_22to22,pipe_l1_23to21,pipe_l1_23to23,
				pipe_l1_24to24,pipe_l1_24to26,pipe_l1_25to25,pipe_l1_25to27,pipe_l1_26to24,pipe_l1_26to26,pipe_l1_27to25,pipe_l1_27to27,
				pipe_l1_28to28,pipe_l1_28to30,pipe_l1_29to29,pipe_l1_29to31,pipe_l1_30to28,pipe_l1_30to30,pipe_l1_31to29,pipe_l1_31to31,ctrl_i_0,ctrl_0_1);
				printf("Returned from module m %d...\n",0);

				switch_m<4,2>(
				pipe_l1_0to0,pipe_l1_2to0,pipe_l1_1to1,pipe_l1_3to1,pipe_l1_0to2,pipe_l1_2to2,pipe_l1_1to3,pipe_l1_3to3,
				pipe_l1_4to4,pipe_l1_6to4,pipe_l1_5to5,pipe_l1_7to5,pipe_l1_4to6,pipe_l1_6to6,pipe_l1_5to7,pipe_l1_7to7,
				pipe_l1_8to8,pipe_l1_10to8,pipe_l1_9to9,pipe_l1_11to9,pipe_l1_8to10,pipe_l1_10to10,pipe_l1_9to11,pipe_l1_11to11,
				pipe_l1_12to12,pipe_l1_14to12,pipe_l1_13to13,pipe_l1_15to13,pipe_l1_12to14,pipe_l1_14to14,pipe_l1_13to15,pipe_l1_15to15,
				pipe_l1_16to16,pipe_l1_18to16,pipe_l1_17to17,pipe_l1_19to17,pipe_l1_16to18,pipe_l1_18to18,pipe_l1_17to19,pipe_l1_19to19,
				pipe_l1_20to20,pipe_l1_22to20,pipe_l1_21to21,pipe_l1_23to21,pipe_l1_20to22,pipe_l1_22to22,pipe_l1_21to23,pipe_l1_23to23,
				pipe_l1_24to24,pipe_l1_26to24,pipe_l1_25to25,pipe_l1_27to25,pipe_l1_24to26,pipe_l1_26to26,pipe_l1_25to27,pipe_l1_27to27,
				pipe_l1_28to28,pipe_l1_30to28,pipe_l1_29to29,pipe_l1_31to29,pipe_l1_28to30,pipe_l1_30to30,pipe_l1_29to31,pipe_l1_31to31,
				pipe_l2_0to0,pipe_l2_0to4,pipe_l2_1to1,pipe_l2_1to5,pipe_l2_2to2,pipe_l2_2to6,pipe_l2_3to3,pipe_l2_3to7,
				pipe_l2_4to0,pipe_l2_4to4,pipe_l2_5to1,pipe_l2_5to5,pipe_l2_6to2,pipe_l2_6to6,pipe_l2_7to3,pipe_l2_7to7,
				pipe_l2_8to8,pipe_l2_8to12,pipe_l2_9to9,pipe_l2_9to13,pipe_l2_10to10,pipe_l2_10to14,pipe_l2_11to11,pipe_l2_11to15,
				pipe_l2_12to8,pipe_l2_12to12,pipe_l2_13to9,pipe_l2_13to13,pipe_l2_14to10,pipe_l2_14to14,pipe_l2_15to11,pipe_l2_15to15,
				pipe_l2_16to16,pipe_l2_16to20,pipe_l2_17to17,pipe_l2_17to21,pipe_l2_18to18,pipe_l2_18to22,pipe_l2_19to19,pipe_l2_19to23,
				pipe_l2_20to16,pipe_l2_20to20,pipe_l2_21to17,pipe_l2_21to21,pipe_l2_22to18,pipe_l2_22to22,pipe_l2_23to19,pipe_l2_23to23,
				pipe_l2_24to24,pipe_l2_24to28,pipe_l2_25to25,pipe_l2_25to29,pipe_l2_26to26,pipe_l2_26to30,pipe_l2_27to27,pipe_l2_27to31,
				pipe_l2_28to24,pipe_l2_28to28,pipe_l2_29to25,pipe_l2_29to29,pipe_l2_30to26,pipe_l2_30to30,pipe_l2_31to27,pipe_l2_31to31,ctrl_0_1,ctrl_1_2);
				printf("Returned from module m %d...\n",1);

				switch_m<8,4>(
				pipe_l2_0to0,pipe_l2_4to0,pipe_l2_1to1,pipe_l2_5to1,pipe_l2_2to2,pipe_l2_6to2,pipe_l2_3to3,pipe_l2_7to3,
				pipe_l2_0to4,pipe_l2_4to4,pipe_l2_1to5,pipe_l2_5to5,pipe_l2_2to6,pipe_l2_6to6,pipe_l2_3to7,pipe_l2_7to7,
				pipe_l2_8to8,pipe_l2_12to8,pipe_l2_9to9,pipe_l2_13to9,pipe_l2_10to10,pipe_l2_14to10,pipe_l2_11to11,pipe_l2_15to11,
				pipe_l2_8to12,pipe_l2_12to12,pipe_l2_9to13,pipe_l2_13to13,pipe_l2_10to14,pipe_l2_14to14,pipe_l2_11to15,pipe_l2_15to15,
				pipe_l2_16to16,pipe_l2_20to16,pipe_l2_17to17,pipe_l2_21to17,pipe_l2_18to18,pipe_l2_22to18,pipe_l2_19to19,pipe_l2_23to19,
				pipe_l2_16to20,pipe_l2_20to20,pipe_l2_17to21,pipe_l2_21to21,pipe_l2_18to22,pipe_l2_22to22,pipe_l2_19to23,pipe_l2_23to23,
				pipe_l2_24to24,pipe_l2_28to24,pipe_l2_25to25,pipe_l2_29to25,pipe_l2_26to26,pipe_l2_30to26,pipe_l2_27to27,pipe_l2_31to27,
				pipe_l2_24to28,pipe_l2_28to28,pipe_l2_25to29,pipe_l2_29to29,pipe_l2_26to30,pipe_l2_30to30,pipe_l2_27to31,pipe_l2_31to31,
				pipe_l3_0to0,pipe_l3_0to8,pipe_l3_1to1,pipe_l3_1to9,pipe_l3_2to2,pipe_l3_2to10,pipe_l3_3to3,pipe_l3_3to11,
				pipe_l3_4to4,pipe_l3_4to12,pipe_l3_5to5,pipe_l3_5to13,pipe_l3_6to6,pipe_l3_6to14,pipe_l3_7to7,pipe_l3_7to15,
				pipe_l3_8to0,pipe_l3_8to8,pipe_l3_9to1,pipe_l3_9to9,pipe_l3_10to2,pipe_l3_10to10,pipe_l3_11to3,pipe_l3_11to11,
				pipe_l3_12to4,pipe_l3_12to12,pipe_l3_13to5,pipe_l3_13to13,pipe_l3_14to6,pipe_l3_14to14,pipe_l3_15to7,pipe_l3_15to15,
				pipe_l3_16to16,pipe_l3_16to24,pipe_l3_17to17,pipe_l3_17to25,pipe_l3_18to18,pipe_l3_18to26,pipe_l3_19to19,pipe_l3_19to27,
				pipe_l3_20to20,pipe_l3_20to28,pipe_l3_21to21,pipe_l3_21to29,pipe_l3_22to22,pipe_l3_22to30,pipe_l3_23to23,pipe_l3_23to31,
				pipe_l3_24to16,pipe_l3_24to24,pipe_l3_25to17,pipe_l3_25to25,pipe_l3_26to18,pipe_l3_26to26,pipe_l3_27to19,pipe_l3_27to27,
				pipe_l3_28to20,pipe_l3_28to28,pipe_l3_29to21,pipe_l3_29to29,pipe_l3_30to22,pipe_l3_30to30,pipe_l3_31to23,pipe_l3_31to31,ctrl_1_2,ctrl_2_3);
				printf("Returned from module m %d...\n",2);

				switch_m<16,8>(
				pipe_l3_0to0,pipe_l3_8to0,pipe_l3_1to1,pipe_l3_9to1,pipe_l3_2to2,pipe_l3_10to2,pipe_l3_3to3,pipe_l3_11to3,
				pipe_l3_4to4,pipe_l3_12to4,pipe_l3_5to5,pipe_l3_13to5,pipe_l3_6to6,pipe_l3_14to6,pipe_l3_7to7,pipe_l3_15to7,
				pipe_l3_0to8,pipe_l3_8to8,pipe_l3_1to9,pipe_l3_9to9,pipe_l3_2to10,pipe_l3_10to10,pipe_l3_3to11,pipe_l3_11to11,
				pipe_l3_4to12,pipe_l3_12to12,pipe_l3_5to13,pipe_l3_13to13,pipe_l3_6to14,pipe_l3_14to14,pipe_l3_7to15,pipe_l3_15to15,
				pipe_l3_16to16,pipe_l3_24to16,pipe_l3_17to17,pipe_l3_25to17,pipe_l3_18to18,pipe_l3_26to18,pipe_l3_19to19,pipe_l3_27to19,
				pipe_l3_20to20,pipe_l3_28to20,pipe_l3_21to21,pipe_l3_29to21,pipe_l3_22to22,pipe_l3_30to22,pipe_l3_23to23,pipe_l3_31to23,
				pipe_l3_16to24,pipe_l3_24to24,pipe_l3_17to25,pipe_l3_25to25,pipe_l3_18to26,pipe_l3_26to26,pipe_l3_19to27,pipe_l3_27to27,
				pipe_l3_20to28,pipe_l3_28to28,pipe_l3_21to29,pipe_l3_29to29,pipe_l3_22to30,pipe_l3_30to30,pipe_l3_23to31,pipe_l3_31to31,
				pipe_l4_0to0,pipe_l4_0to16,pipe_l4_1to1,pipe_l4_1to17,pipe_l4_2to2,pipe_l4_2to18,pipe_l4_3to3,pipe_l4_3to19,
				pipe_l4_4to4,pipe_l4_4to20,pipe_l4_5to5,pipe_l4_5to21,pipe_l4_6to6,pipe_l4_6to22,pipe_l4_7to7,pipe_l4_7to23,
				pipe_l4_8to8,pipe_l4_8to24,pipe_l4_9to9,pipe_l4_9to25,pipe_l4_10to10,pipe_l4_10to26,pipe_l4_11to11,pipe_l4_11to27,
				pipe_l4_12to12,pipe_l4_12to28,pipe_l4_13to13,pipe_l4_13to29,pipe_l4_14to14,pipe_l4_14to30,pipe_l4_15to15,pipe_l4_15to31,
				pipe_l4_16to0,pipe_l4_16to16,pipe_l4_17to1,pipe_l4_17to17,pipe_l4_18to2,pipe_l4_18to18,pipe_l4_19to3,pipe_l4_19to19,
				pipe_l4_20to4,pipe_l4_20to20,pipe_l4_21to5,pipe_l4_21to21,pipe_l4_22to6,pipe_l4_22to22,pipe_l4_23to7,pipe_l4_23to23,
				pipe_l4_24to8,pipe_l4_24to24,pipe_l4_25to9,pipe_l4_25to25,pipe_l4_26to10,pipe_l4_26to26,pipe_l4_27to11,pipe_l4_27to27,
				pipe_l4_28to12,pipe_l4_28to28,pipe_l4_29to13,pipe_l4_29to29,pipe_l4_30to14,pipe_l4_30to30,pipe_l4_31to15,pipe_l4_31to31,ctrl_2_3,ctrl_3_o);
				printf("Returned from module m %d...\n",3);

				switch_out(
				pipe_l4_0to0,pipe_l4_16to0,pipe_l4_1to1,pipe_l4_17to1,pipe_l4_2to2,pipe_l4_18to2,pipe_l4_3to3,pipe_l4_19to3,
				pipe_l4_4to4,pipe_l4_20to4,pipe_l4_5to5,pipe_l4_21to5,pipe_l4_6to6,pipe_l4_22to6,pipe_l4_7to7,pipe_l4_23to7,
				pipe_l4_8to8,pipe_l4_24to8,pipe_l4_9to9,pipe_l4_25to9,pipe_l4_10to10,pipe_l4_26to10,pipe_l4_11to11,pipe_l4_27to11,
				pipe_l4_12to12,pipe_l4_28to12,pipe_l4_13to13,pipe_l4_29to13,pipe_l4_14to14,pipe_l4_30to14,pipe_l4_15to15,pipe_l4_31to15,
				pipe_l4_0to16,pipe_l4_16to16,pipe_l4_1to17,pipe_l4_17to17,pipe_l4_2to18,pipe_l4_18to18,pipe_l4_3to19,pipe_l4_19to19,
				pipe_l4_4to20,pipe_l4_20to20,pipe_l4_5to21,pipe_l4_21to21,pipe_l4_6to22,pipe_l4_22to22,pipe_l4_7to23,pipe_l4_23to23,
				pipe_l4_8to24,pipe_l4_24to24,pipe_l4_9to25,pipe_l4_25to25,pipe_l4_10to26,pipe_l4_26to26,pipe_l4_11to27,pipe_l4_27to27,
				pipe_l4_12to28,pipe_l4_28to28,pipe_l4_13to29,pipe_l4_29to29,pipe_l4_14to30,pipe_l4_30to30,pipe_l4_15to31,pipe_l4_31to31,
				pipe_out0,pipe_out1,pipe_out2,pipe_out3,
				pipe_out4,pipe_out5,pipe_out6,pipe_out7,
				pipe_out8,pipe_out9,pipe_out10,pipe_out11,
				pipe_out12,pipe_out13,pipe_out14,pipe_out15,
				pipe_out16,pipe_out17,pipe_out18,pipe_out19,
				pipe_out20,pipe_out21,pipe_out22,pipe_out23,
				pipe_out24,pipe_out25,pipe_out26,pipe_out27,
				pipe_out28,pipe_out29,pipe_out30,pipe_out31,
				MCTSTree0,MCTSTree1,MCTSTree2,MCTSTree3,ctrl_3_o,ctrl_o_r);

				printf("Returned from module out...\n");

	        	// update shift register, if pipstage==1, index out range, write to out array, not shiftarr.
	        	//is this still an all-to-all connetion from pipes to shiftarr?
	        	//TODO we have calculated newse stage number in switch_out, adjust the following block
				loop_renew: while(1){
					#pragma HLS pipeline off
					if (!pipe_out0.empty()){
						item outi=pipe_out0.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out1.empty()){
						item outi=pipe_out1.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out2.empty()){
						item outi=pipe_out2.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out3.empty()){
						item outi=pipe_out3.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out4.empty()){
						item outi=pipe_out4.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out5.empty()){
						item outi=pipe_out5.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out6.empty()){
						item outi=pipe_out6.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out7.empty()){
						item outi=pipe_out7.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out8.empty()){
						item outi=pipe_out8.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out9.empty()){
						item outi=pipe_out9.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out10.empty()){
						item outi=pipe_out10.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out11.empty()){
						item outi=pipe_out11.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out12.empty()){
						item outi=pipe_out12.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out13.empty()){
						item outi=pipe_out13.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out14.empty()){
						item outi=pipe_out14.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out15.empty()){
						item outi=pipe_out15.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out16.empty()){
						item outi=pipe_out16.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out17.empty()){
						item outi=pipe_out17.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out18.empty()){
						item outi=pipe_out18.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out19.empty()){
						item outi=pipe_out19.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out20.empty()){
						item outi=pipe_out20.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out21.empty()){
						item outi=pipe_out21.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out22.empty()){
						item outi=pipe_out22.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out23.empty()){
						item outi=pipe_out23.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out24.empty()){
						item outi=pipe_out24.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out25.empty()){
						item outi=pipe_out25.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out26.empty()){
						item outi=pipe_out26.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out27.empty()){
						item outi=pipe_out27.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out28.empty()){
						item outi=pipe_out28.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out29.empty()){
						item outi=pipe_out29.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out30.empty()){
						item outi=pipe_out30.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if (!pipe_out31.empty()){
						item outi=pipe_out31.read();
						int pipstg=outi.pipstage;
						if (pipstg==D) out[i]=outi.bankidx; //TODO: in host, out should be at least p+D? size.
						else {shift_arr[pipstg]=outi;}
					}
					if(!ctrl_o_r.empty() && pipe_out0.empty() && pipe_out0.empty() && pipe_out1.empty() && pipe_out1.empty()
				 && pipe_out2.empty() && pipe_out2.empty() && pipe_out3.empty() && pipe_out3.empty()
				 && pipe_out4.empty() && pipe_out4.empty() && pipe_out5.empty() && pipe_out5.empty()
				 && pipe_out6.empty() && pipe_out6.empty() && pipe_out7.empty() && pipe_out7.empty()
				 && pipe_out8.empty() && pipe_out8.empty() && pipe_out9.empty() && pipe_out9.empty()
				 && pipe_out10.empty() && pipe_out10.empty() && pipe_out11.empty() && pipe_out11.empty()
				 && pipe_out12.empty() && pipe_out12.empty() && pipe_out13.empty() && pipe_out13.empty()
				 && pipe_out14.empty() && pipe_out14.empty() && pipe_out15.empty() && pipe_out15.empty()
				 && pipe_out16.empty() && pipe_out16.empty() && pipe_out17.empty() && pipe_out17.empty()
				 && pipe_out18.empty() && pipe_out18.empty() && pipe_out19.empty() && pipe_out19.empty()
				 && pipe_out20.empty() && pipe_out20.empty() && pipe_out21.empty() && pipe_out21.empty()
				 && pipe_out22.empty() && pipe_out22.empty() && pipe_out23.empty() && pipe_out23.empty()
				 && pipe_out24.empty() && pipe_out24.empty() && pipe_out25.empty() && pipe_out25.empty()
				 && pipe_out26.empty() && pipe_out26.empty() && pipe_out27.empty() && pipe_out27.empty()
				 && pipe_out28.empty() && pipe_out28.empty() && pipe_out29.empty() && pipe_out29.empty()
				 && pipe_out30.empty() && pipe_out30.empty() && pipe_out31.empty() && pipe_out31.empty())
					{ctrl_o_r.read(); break;} 
	        	}
        	}
        }
    }
}



// template<int id>
// num inpipes: D; num outpipes:2D
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
	hls::stream<ctrlbit> &ctrl_i){

	printf("In module in...\n");
	item aa0=inpipe0.read();
	if (aa0.bankidx%2==0){pipe_l0_0to0.write(aa0);}
	else{pipe_l0_0to1.write(aa0);}
	item aa1=inpipe1.read();
	if (aa1.bankidx%2==0){pipe_l0_1to0.write(aa1);}
	else{pipe_l0_1to1.write(aa1);}
	item aa2=inpipe2.read();
	if (aa2.bankidx%2==0){pipe_l0_2to2.write(aa2);}
	else{pipe_l0_2to3.write(aa2);}
	item aa3=inpipe3.read();
	if (aa3.bankidx%2==0){pipe_l0_3to2.write(aa3);}
	else{pipe_l0_3to3.write(aa3);}
	item aa4=inpipe4.read();
	if (aa4.bankidx%2==0){pipe_l0_4to4.write(aa4);}
	else{pipe_l0_4to5.write(aa4);}
	item aa5=inpipe5.read();
	if (aa5.bankidx%2==0){pipe_l0_5to4.write(aa5);}
	else{pipe_l0_5to5.write(aa5);}
	item aa6=inpipe6.read();
	if (aa6.bankidx%2==0){pipe_l0_6to6.write(aa6);}
	else{pipe_l0_6to7.write(aa6);}
	item aa7=inpipe7.read();
	if (aa7.bankidx%2==0){pipe_l0_7to6.write(aa7);}
	else{pipe_l0_7to7.write(aa7);}
	item aa8=inpipe8.read();
	if (aa8.bankidx%2==0){pipe_l0_8to8.write(aa8);}
	else{pipe_l0_8to9.write(aa8);}
	item aa9=inpipe9.read();
	if (aa9.bankidx%2==0){pipe_l0_9to8.write(aa9);}
	else{pipe_l0_9to9.write(aa9);}
	item aa10=inpipe10.read();
	if (aa10.bankidx%2==0){pipe_l0_10to10.write(aa10);}
	else{pipe_l0_10to11.write(aa10);}
	item aa11=inpipe11.read();
	if (aa11.bankidx%2==0){pipe_l0_11to10.write(aa11);}
	else{pipe_l0_11to11.write(aa11);}
	item aa12=inpipe12.read();
	if (aa12.bankidx%2==0){pipe_l0_12to12.write(aa12);}
	else{pipe_l0_12to13.write(aa12);}
	item aa13=inpipe13.read();
	if (aa13.bankidx%2==0){pipe_l0_13to12.write(aa13);}
	else{pipe_l0_13to13.write(aa13);}
	item aa14=inpipe14.read();
	if (aa14.bankidx%2==0){pipe_l0_14to14.write(aa14);}
	else{pipe_l0_14to15.write(aa14);}
	item aa15=inpipe15.read();
	if (aa15.bankidx%2==0){pipe_l0_15to14.write(aa15);}
	else{pipe_l0_15to15.write(aa15);}
	item aa16=inpipe16.read();
	if (aa16.bankidx%2==0){pipe_l0_16to16.write(aa16);}
	else{pipe_l0_16to17.write(aa16);}
	item aa17=inpipe17.read();
	if (aa17.bankidx%2==0){pipe_l0_17to16.write(aa17);}
	else{pipe_l0_17to17.write(aa17);}
	item aa18=inpipe18.read();
	if (aa18.bankidx%2==0){pipe_l0_18to18.write(aa18);}
	else{pipe_l0_18to19.write(aa18);}
	item aa19=inpipe19.read();
	if (aa19.bankidx%2==0){pipe_l0_19to18.write(aa19);}
	else{pipe_l0_19to19.write(aa19);}
	item aa20=inpipe20.read();
	if (aa20.bankidx%2==0){pipe_l0_20to20.write(aa20);}
	else{pipe_l0_20to21.write(aa20);}
	item aa21=inpipe21.read();
	if (aa21.bankidx%2==0){pipe_l0_21to20.write(aa21);}
	else{pipe_l0_21to21.write(aa21);}
	item aa22=inpipe22.read();
	if (aa22.bankidx%2==0){pipe_l0_22to22.write(aa22);}
	else{pipe_l0_22to23.write(aa22);}
	item aa23=inpipe23.read();
	if (aa23.bankidx%2==0){pipe_l0_23to22.write(aa23);}
	else{pipe_l0_23to23.write(aa23);}
	item aa24=inpipe24.read();
	if (aa24.bankidx%2==0){pipe_l0_24to24.write(aa24);}
	else{pipe_l0_24to25.write(aa24);}
	item aa25=inpipe25.read();
	if (aa25.bankidx%2==0){pipe_l0_25to24.write(aa25);}
	else{pipe_l0_25to25.write(aa25);}
	item aa26=inpipe26.read();
	if (aa26.bankidx%2==0){pipe_l0_26to26.write(aa26);}
	else{pipe_l0_26to27.write(aa26);}
	item aa27=inpipe27.read();
	if (aa27.bankidx%2==0){pipe_l0_27to26.write(aa27);}
	else{pipe_l0_27to27.write(aa27);}
	item aa28=inpipe28.read();
	if (aa28.bankidx%2==0){pipe_l0_28to28.write(aa28);}
	else{pipe_l0_28to29.write(aa28);}
	item aa29=inpipe29.read();
	if (aa29.bankidx%2==0){pipe_l0_29to28.write(aa29);}
	else{pipe_l0_29to29.write(aa29);}
	item aa30=inpipe30.read();
	if (aa30.bankidx%2==0){pipe_l0_30to30.write(aa30);}
	else{pipe_l0_30to31.write(aa30);}
	item aa31=inpipe31.read();
	if (aa31.bankidx%2==0){pipe_l0_31to30.write(aa31);}
	else{pipe_l0_31to31.write(aa31);}
	ctrl_i.write((ctrlbit)1);
}


// template<int id>
//2*D inpipes, 2*D outpipes in real impl of in-netwprk switch (switch_m)
// up and down stands for the connection wrt the switch. (routing rule: bit 0->up, bit 1->down)
// bit_id: which layer this is in the butterfly (which bit of dest id to check. LSB should be 0, LSB+1 should be 1,...)
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
			hls::stream<ctrlbit> &ctrl_i,hls::stream<ctrlbit> &ctrl_o){
			printf("In module m...\n");
			int cnt=0;
			loop_pipeline_switch_m:while (1){
				#pragma HLS pipeline II=1
				
			if (!in0_up.empty()){
					item fromin0_up = in0_up.read();
					if (0 <= fromin0_up.bankidx%2 < 1){out0_up.write(fromin0_up);}
					else{ out0_down.write(fromin0_up);}
				}	
			if (!in0_down.empty()){
					item fromin0_down = in0_down.read();
					if (0 <= fromin0_down.bankidx%2 < 1){out0_up.write(fromin0_down);}
					else{ out0_down.write(fromin0_down);}
				}
				
			if (!in1_up.empty()){
					item fromin1_up = in1_up.read();
					if (0 <= fromin1_up.bankidx%2 < 1){out1_up.write(fromin1_up);}
					else{ out1_down.write(fromin1_up);}
				}	
			if (!in1_down.empty()){
					item fromin1_down = in1_down.read();
					if (0 <= fromin1_down.bankidx%2 < 1){out1_up.write(fromin1_down);}
					else{ out1_down.write(fromin1_down);}
				}
				
			if (!in2_up.empty()){
					item fromin2_up = in2_up.read();
					if (0 <= fromin2_up.bankidx%2 < 1){out2_up.write(fromin2_up);}
					else{ out2_down.write(fromin2_up);}
				}	
			if (!in2_down.empty()){
					item fromin2_down = in2_down.read();
					if (0 <= fromin2_down.bankidx%2 < 1){out2_up.write(fromin2_down);}
					else{ out2_down.write(fromin2_down);}
				}
				
			if (!in3_up.empty()){
					item fromin3_up = in3_up.read();
					if (0 <= fromin3_up.bankidx%2 < 1){out3_up.write(fromin3_up);}
					else{ out3_down.write(fromin3_up);}
				}	
			if (!in3_down.empty()){
					item fromin3_down = in3_down.read();
					if (0 <= fromin3_down.bankidx%2 < 1){out3_up.write(fromin3_down);}
					else{ out3_down.write(fromin3_down);}
				}
				
			if (!in4_up.empty()){
					item fromin4_up = in4_up.read();
					if (0 <= fromin4_up.bankidx%2 < 1){out4_up.write(fromin4_up);}
					else{ out4_down.write(fromin4_up);}
				}	
			if (!in4_down.empty()){
					item fromin4_down = in4_down.read();
					if (0 <= fromin4_down.bankidx%2 < 1){out4_up.write(fromin4_down);}
					else{ out4_down.write(fromin4_down);}
				}
				
			if (!in5_up.empty()){
					item fromin5_up = in5_up.read();
					if (0 <= fromin5_up.bankidx%2 < 1){out5_up.write(fromin5_up);}
					else{ out5_down.write(fromin5_up);}
				}	
			if (!in5_down.empty()){
					item fromin5_down = in5_down.read();
					if (0 <= fromin5_down.bankidx%2 < 1){out5_up.write(fromin5_down);}
					else{ out5_down.write(fromin5_down);}
				}
				
			if (!in6_up.empty()){
					item fromin6_up = in6_up.read();
					if (0 <= fromin6_up.bankidx%2 < 1){out6_up.write(fromin6_up);}
					else{ out6_down.write(fromin6_up);}
				}	
			if (!in6_down.empty()){
					item fromin6_down = in6_down.read();
					if (0 <= fromin6_down.bankidx%2 < 1){out6_up.write(fromin6_down);}
					else{ out6_down.write(fromin6_down);}
				}
				
			if (!in7_up.empty()){
					item fromin7_up = in7_up.read();
					if (0 <= fromin7_up.bankidx%2 < 1){out7_up.write(fromin7_up);}
					else{ out7_down.write(fromin7_up);}
				}	
			if (!in7_down.empty()){
					item fromin7_down = in7_down.read();
					if (0 <= fromin7_down.bankidx%2 < 1){out7_up.write(fromin7_down);}
					else{ out7_down.write(fromin7_down);}
				}
				
			if (!in8_up.empty()){
					item fromin8_up = in8_up.read();
					if (0 <= fromin8_up.bankidx%2 < 1){out8_up.write(fromin8_up);}
					else{ out8_down.write(fromin8_up);}
				}	
			if (!in8_down.empty()){
					item fromin8_down = in8_down.read();
					if (0 <= fromin8_down.bankidx%2 < 1){out8_up.write(fromin8_down);}
					else{ out8_down.write(fromin8_down);}
				}
				
			if (!in9_up.empty()){
					item fromin9_up = in9_up.read();
					if (0 <= fromin9_up.bankidx%2 < 1){out9_up.write(fromin9_up);}
					else{ out9_down.write(fromin9_up);}
				}	
			if (!in9_down.empty()){
					item fromin9_down = in9_down.read();
					if (0 <= fromin9_down.bankidx%2 < 1){out9_up.write(fromin9_down);}
					else{ out9_down.write(fromin9_down);}
				}
				
			if (!in10_up.empty()){
					item fromin10_up = in10_up.read();
					if (0 <= fromin10_up.bankidx%2 < 1){out10_up.write(fromin10_up);}
					else{ out10_down.write(fromin10_up);}
				}	
			if (!in10_down.empty()){
					item fromin10_down = in10_down.read();
					if (0 <= fromin10_down.bankidx%2 < 1){out10_up.write(fromin10_down);}
					else{ out10_down.write(fromin10_down);}
				}
				
			if (!in11_up.empty()){
					item fromin11_up = in11_up.read();
					if (0 <= fromin11_up.bankidx%2 < 1){out11_up.write(fromin11_up);}
					else{ out11_down.write(fromin11_up);}
				}	
			if (!in11_down.empty()){
					item fromin11_down = in11_down.read();
					if (0 <= fromin11_down.bankidx%2 < 1){out11_up.write(fromin11_down);}
					else{ out11_down.write(fromin11_down);}
				}
				
			if (!in12_up.empty()){
					item fromin12_up = in12_up.read();
					if (0 <= fromin12_up.bankidx%2 < 1){out12_up.write(fromin12_up);}
					else{ out12_down.write(fromin12_up);}
				}	
			if (!in12_down.empty()){
					item fromin12_down = in12_down.read();
					if (0 <= fromin12_down.bankidx%2 < 1){out12_up.write(fromin12_down);}
					else{ out12_down.write(fromin12_down);}
				}
				
			if (!in13_up.empty()){
					item fromin13_up = in13_up.read();
					if (0 <= fromin13_up.bankidx%2 < 1){out13_up.write(fromin13_up);}
					else{ out13_down.write(fromin13_up);}
				}	
			if (!in13_down.empty()){
					item fromin13_down = in13_down.read();
					if (0 <= fromin13_down.bankidx%2 < 1){out13_up.write(fromin13_down);}
					else{ out13_down.write(fromin13_down);}
				}
				
			if (!in14_up.empty()){
					item fromin14_up = in14_up.read();
					if (0 <= fromin14_up.bankidx%2 < 1){out14_up.write(fromin14_up);}
					else{ out14_down.write(fromin14_up);}
				}	
			if (!in14_down.empty()){
					item fromin14_down = in14_down.read();
					if (0 <= fromin14_down.bankidx%2 < 1){out14_up.write(fromin14_down);}
					else{ out14_down.write(fromin14_down);}
				}
				
			if (!in15_up.empty()){
					item fromin15_up = in15_up.read();
					if (0 <= fromin15_up.bankidx%2 < 1){out15_up.write(fromin15_up);}
					else{ out15_down.write(fromin15_up);}
				}	
			if (!in15_down.empty()){
					item fromin15_down = in15_down.read();
					if (0 <= fromin15_down.bankidx%2 < 1){out15_up.write(fromin15_down);}
					else{ out15_down.write(fromin15_down);}
				}
				
			if (!in16_up.empty()){
					item fromin16_up = in16_up.read();
					if (0 <= fromin16_up.bankidx%2 < 1){out16_up.write(fromin16_up);}
					else{ out16_down.write(fromin16_up);}
				}	
			if (!in16_down.empty()){
					item fromin16_down = in16_down.read();
					if (0 <= fromin16_down.bankidx%2 < 1){out16_up.write(fromin16_down);}
					else{ out16_down.write(fromin16_down);}
				}
				
			if (!in17_up.empty()){
					item fromin17_up = in17_up.read();
					if (0 <= fromin17_up.bankidx%2 < 1){out17_up.write(fromin17_up);}
					else{ out17_down.write(fromin17_up);}
				}	
			if (!in17_down.empty()){
					item fromin17_down = in17_down.read();
					if (0 <= fromin17_down.bankidx%2 < 1){out17_up.write(fromin17_down);}
					else{ out17_down.write(fromin17_down);}
				}
				
			if (!in18_up.empty()){
					item fromin18_up = in18_up.read();
					if (0 <= fromin18_up.bankidx%2 < 1){out18_up.write(fromin18_up);}
					else{ out18_down.write(fromin18_up);}
				}	
			if (!in18_down.empty()){
					item fromin18_down = in18_down.read();
					if (0 <= fromin18_down.bankidx%2 < 1){out18_up.write(fromin18_down);}
					else{ out18_down.write(fromin18_down);}
				}
				
			if (!in19_up.empty()){
					item fromin19_up = in19_up.read();
					if (0 <= fromin19_up.bankidx%2 < 1){out19_up.write(fromin19_up);}
					else{ out19_down.write(fromin19_up);}
				}	
			if (!in19_down.empty()){
					item fromin19_down = in19_down.read();
					if (0 <= fromin19_down.bankidx%2 < 1){out19_up.write(fromin19_down);}
					else{ out19_down.write(fromin19_down);}
				}
				
			if (!in20_up.empty()){
					item fromin20_up = in20_up.read();
					if (0 <= fromin20_up.bankidx%2 < 1){out20_up.write(fromin20_up);}
					else{ out20_down.write(fromin20_up);}
				}	
			if (!in20_down.empty()){
					item fromin20_down = in20_down.read();
					if (0 <= fromin20_down.bankidx%2 < 1){out20_up.write(fromin20_down);}
					else{ out20_down.write(fromin20_down);}
				}
				
			if (!in21_up.empty()){
					item fromin21_up = in21_up.read();
					if (0 <= fromin21_up.bankidx%2 < 1){out21_up.write(fromin21_up);}
					else{ out21_down.write(fromin21_up);}
				}	
			if (!in21_down.empty()){
					item fromin21_down = in21_down.read();
					if (0 <= fromin21_down.bankidx%2 < 1){out21_up.write(fromin21_down);}
					else{ out21_down.write(fromin21_down);}
				}
				
			if (!in22_up.empty()){
					item fromin22_up = in22_up.read();
					if (0 <= fromin22_up.bankidx%2 < 1){out22_up.write(fromin22_up);}
					else{ out22_down.write(fromin22_up);}
				}	
			if (!in22_down.empty()){
					item fromin22_down = in22_down.read();
					if (0 <= fromin22_down.bankidx%2 < 1){out22_up.write(fromin22_down);}
					else{ out22_down.write(fromin22_down);}
				}
				
			if (!in23_up.empty()){
					item fromin23_up = in23_up.read();
					if (0 <= fromin23_up.bankidx%2 < 1){out23_up.write(fromin23_up);}
					else{ out23_down.write(fromin23_up);}
				}	
			if (!in23_down.empty()){
					item fromin23_down = in23_down.read();
					if (0 <= fromin23_down.bankidx%2 < 1){out23_up.write(fromin23_down);}
					else{ out23_down.write(fromin23_down);}
				}
				
			if (!in24_up.empty()){
					item fromin24_up = in24_up.read();
					if (0 <= fromin24_up.bankidx%2 < 1){out24_up.write(fromin24_up);}
					else{ out24_down.write(fromin24_up);}
				}	
			if (!in24_down.empty()){
					item fromin24_down = in24_down.read();
					if (0 <= fromin24_down.bankidx%2 < 1){out24_up.write(fromin24_down);}
					else{ out24_down.write(fromin24_down);}
				}
				
			if (!in25_up.empty()){
					item fromin25_up = in25_up.read();
					if (0 <= fromin25_up.bankidx%2 < 1){out25_up.write(fromin25_up);}
					else{ out25_down.write(fromin25_up);}
				}	
			if (!in25_down.empty()){
					item fromin25_down = in25_down.read();
					if (0 <= fromin25_down.bankidx%2 < 1){out25_up.write(fromin25_down);}
					else{ out25_down.write(fromin25_down);}
				}
				
			if (!in26_up.empty()){
					item fromin26_up = in26_up.read();
					if (0 <= fromin26_up.bankidx%2 < 1){out26_up.write(fromin26_up);}
					else{ out26_down.write(fromin26_up);}
				}	
			if (!in26_down.empty()){
					item fromin26_down = in26_down.read();
					if (0 <= fromin26_down.bankidx%2 < 1){out26_up.write(fromin26_down);}
					else{ out26_down.write(fromin26_down);}
				}
				
			if (!in27_up.empty()){
					item fromin27_up = in27_up.read();
					if (0 <= fromin27_up.bankidx%2 < 1){out27_up.write(fromin27_up);}
					else{ out27_down.write(fromin27_up);}
				}	
			if (!in27_down.empty()){
					item fromin27_down = in27_down.read();
					if (0 <= fromin27_down.bankidx%2 < 1){out27_up.write(fromin27_down);}
					else{ out27_down.write(fromin27_down);}
				}
				
			if (!in28_up.empty()){
					item fromin28_up = in28_up.read();
					if (0 <= fromin28_up.bankidx%2 < 1){out28_up.write(fromin28_up);}
					else{ out28_down.write(fromin28_up);}
				}	
			if (!in28_down.empty()){
					item fromin28_down = in28_down.read();
					if (0 <= fromin28_down.bankidx%2 < 1){out28_up.write(fromin28_down);}
					else{ out28_down.write(fromin28_down);}
				}
				
			if (!in29_up.empty()){
					item fromin29_up = in29_up.read();
					if (0 <= fromin29_up.bankidx%2 < 1){out29_up.write(fromin29_up);}
					else{ out29_down.write(fromin29_up);}
				}	
			if (!in29_down.empty()){
					item fromin29_down = in29_down.read();
					if (0 <= fromin29_down.bankidx%2 < 1){out29_up.write(fromin29_down);}
					else{ out29_down.write(fromin29_down);}
				}
				
			if (!in30_up.empty()){
					item fromin30_up = in30_up.read();
					if (0 <= fromin30_up.bankidx%2 < 1){out30_up.write(fromin30_up);}
					else{ out30_down.write(fromin30_up);}
				}	
			if (!in30_down.empty()){
					item fromin30_down = in30_down.read();
					if (0 <= fromin30_down.bankidx%2 < 1){out30_up.write(fromin30_down);}
					else{ out30_down.write(fromin30_down);}
				}
				
			if (!in31_up.empty()){
					item fromin31_up = in31_up.read();
					if (0 <= fromin31_up.bankidx%2 < 1){out31_up.write(fromin31_up);}
					else{ out31_down.write(fromin31_up);}
				}	
			if (!in31_down.empty()){
					item fromin31_down = in31_down.read();
					if (0 <= fromin31_down.bankidx%2 < 1){out31_up.write(fromin31_down);}
					else{ out31_down.write(fromin31_down);}
				}
			if (!ctrl_i.empty() && in0_up.empty() && in0_down.empty() && in1_up.empty() && in1_down.empty()
			 && in2_up.empty() && in2_down.empty() && in3_up.empty() && in3_down.empty()
			 && in4_up.empty() && in4_down.empty() && in5_up.empty() && in5_down.empty()
			 && in6_up.empty() && in6_down.empty() && in7_up.empty() && in7_down.empty()
			 && in8_up.empty() && in8_down.empty() && in9_up.empty() && in9_down.empty()
			 && in10_up.empty() && in10_down.empty() && in11_up.empty() && in11_down.empty()
			 && in12_up.empty() && in12_down.empty() && in13_up.empty() && in13_down.empty()
			 && in14_up.empty() && in14_down.empty() && in15_up.empty() && in15_down.empty()
			 && in16_up.empty() && in16_down.empty() && in17_up.empty() && in17_down.empty()
			 && in18_up.empty() && in18_down.empty() && in19_up.empty() && in19_down.empty()
			 && in20_up.empty() && in20_down.empty() && in21_up.empty() && in21_down.empty()
			 && in22_up.empty() && in22_down.empty() && in23_up.empty() && in23_down.empty()
			 && in24_up.empty() && in24_down.empty() && in25_up.empty() && in25_down.empty()
			 && in26_up.empty() && in26_down.empty() && in27_up.empty() && in27_down.empty()
			 && in28_up.empty() && in28_down.empty() && in29_up.empty() && in29_down.empty()
			 && in30_up.empty() && in30_down.empty() && in31_up.empty() && in31_down.empty()
			){ ctrl_i.read(); break;}
		}

	ctrl_o.write((ctrlbit)1);

}

//if Y==2*D: 2*D inpipes, D outpipes
//if Y>=4*D: Y/2 inpipes, Y/2 outpipes
//new: just use 2*D inpipes, D outpipes
//new: to choose memory banks: if Y=2*D, need bit_MSB; if Y=4*D, need bit_MSB and bit_MSB-1. so forth.
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
				){ 
#pragma HLS aggregate variable=treemcts0
	#pragma HLS aggregate variable=treemcts1
	#pragma HLS aggregate variable=treemcts2
	#pragma HLS aggregate variable=treemcts3
	printf("In module out...\n");
	loop_pipeline_switch_out:while (1){
		#pragma HLS pipeline II=1
		if (!inpipe0up.empty()){
			item new_sel; Tnode to_select;
			item from0up = inpipe0up.read();
			if ((int)from0up.bankidx/2==0) {to_select = treemcts0[from0up.nodeidx].banks[0];} //global_bank_index=0 
			else if ((int)from0up.bankidx/2==1) {to_select = treemcts2[from0up.nodeidx].banks[0];} //global_bank_index=32 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from0up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe0down.empty()){
			item new_sel; Tnode to_select;
			item from0down = inpipe0down.read();
			if ((int)from0down.bankidx/2==0) {to_select = treemcts0[from0down.nodeidx].banks[0];} //global_bank_index=0 
			else if ((int)from0down.bankidx/2==1) {to_select = treemcts2[from0down.nodeidx].banks[0];} //global_bank_index=32 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from0down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe1up.empty()){
			item new_sel; Tnode to_select;
			item from1up = inpipe1up.read();
			if ((int)from1up.bankidx/2==0) {to_select = treemcts0[from1up.nodeidx].banks[1];} //global_bank_index=1 
			else if ((int)from1up.bankidx/2==1) {to_select = treemcts2[from1up.nodeidx].banks[1];} //global_bank_index=33 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from1up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe1down.empty()){
			item new_sel; Tnode to_select;
			item from1down = inpipe1down.read();
			if ((int)from1down.bankidx/2==0) {to_select = treemcts0[from1down.nodeidx].banks[1];} //global_bank_index=1 
			else if ((int)from1down.bankidx/2==1) {to_select = treemcts2[from1down.nodeidx].banks[1];} //global_bank_index=33 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from1down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe2up.empty()){
			item new_sel; Tnode to_select;
			item from2up = inpipe2up.read();
			if ((int)from2up.bankidx/2==0) {to_select = treemcts0[from2up.nodeidx].banks[2];} //global_bank_index=2 
			else if ((int)from2up.bankidx/2==1) {to_select = treemcts2[from2up.nodeidx].banks[2];} //global_bank_index=34 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from2up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe2down.empty()){
			item new_sel; Tnode to_select;
			item from2down = inpipe2down.read();
			if ((int)from2down.bankidx/2==0) {to_select = treemcts0[from2down.nodeidx].banks[2];} //global_bank_index=2 
			else if ((int)from2down.bankidx/2==1) {to_select = treemcts2[from2down.nodeidx].banks[2];} //global_bank_index=34 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from2down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe3up.empty()){
			item new_sel; Tnode to_select;
			item from3up = inpipe3up.read();
			if ((int)from3up.bankidx/2==0) {to_select = treemcts0[from3up.nodeidx].banks[3];} //global_bank_index=3 
			else if ((int)from3up.bankidx/2==1) {to_select = treemcts2[from3up.nodeidx].banks[3];} //global_bank_index=35 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from3up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe3down.empty()){
			item new_sel; Tnode to_select;
			item from3down = inpipe3down.read();
			if ((int)from3down.bankidx/2==0) {to_select = treemcts0[from3down.nodeidx].banks[3];} //global_bank_index=3 
			else if ((int)from3down.bankidx/2==1) {to_select = treemcts2[from3down.nodeidx].banks[3];} //global_bank_index=35 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from3down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe4up.empty()){
			item new_sel; Tnode to_select;
			item from4up = inpipe4up.read();
			if ((int)from4up.bankidx/2==0) {to_select = treemcts0[from4up.nodeidx].banks[4];} //global_bank_index=4 
			else if ((int)from4up.bankidx/2==1) {to_select = treemcts2[from4up.nodeidx].banks[4];} //global_bank_index=36 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from4up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe4down.empty()){
			item new_sel; Tnode to_select;
			item from4down = inpipe4down.read();
			if ((int)from4down.bankidx/2==0) {to_select = treemcts0[from4down.nodeidx].banks[4];} //global_bank_index=4 
			else if ((int)from4down.bankidx/2==1) {to_select = treemcts2[from4down.nodeidx].banks[4];} //global_bank_index=36 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from4down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe5up.empty()){
			item new_sel; Tnode to_select;
			item from5up = inpipe5up.read();
			if ((int)from5up.bankidx/2==0) {to_select = treemcts0[from5up.nodeidx].banks[5];} //global_bank_index=5 
			else if ((int)from5up.bankidx/2==1) {to_select = treemcts2[from5up.nodeidx].banks[5];} //global_bank_index=37 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from5up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe5down.empty()){
			item new_sel; Tnode to_select;
			item from5down = inpipe5down.read();
			if ((int)from5down.bankidx/2==0) {to_select = treemcts0[from5down.nodeidx].banks[5];} //global_bank_index=5 
			else if ((int)from5down.bankidx/2==1) {to_select = treemcts2[from5down.nodeidx].banks[5];} //global_bank_index=37 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from5down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe6up.empty()){
			item new_sel; Tnode to_select;
			item from6up = inpipe6up.read();
			if ((int)from6up.bankidx/2==0) {to_select = treemcts0[from6up.nodeidx].banks[6];} //global_bank_index=6 
			else if ((int)from6up.bankidx/2==1) {to_select = treemcts2[from6up.nodeidx].banks[6];} //global_bank_index=38 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from6up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe6down.empty()){
			item new_sel; Tnode to_select;
			item from6down = inpipe6down.read();
			if ((int)from6down.bankidx/2==0) {to_select = treemcts0[from6down.nodeidx].banks[6];} //global_bank_index=6 
			else if ((int)from6down.bankidx/2==1) {to_select = treemcts2[from6down.nodeidx].banks[6];} //global_bank_index=38 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from6down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe7up.empty()){
			item new_sel; Tnode to_select;
			item from7up = inpipe7up.read();
			if ((int)from7up.bankidx/2==0) {to_select = treemcts0[from7up.nodeidx].banks[7];} //global_bank_index=7 
			else if ((int)from7up.bankidx/2==1) {to_select = treemcts2[from7up.nodeidx].banks[7];} //global_bank_index=39 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from7up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe7down.empty()){
			item new_sel; Tnode to_select;
			item from7down = inpipe7down.read();
			if ((int)from7down.bankidx/2==0) {to_select = treemcts0[from7down.nodeidx].banks[7];} //global_bank_index=7 
			else if ((int)from7down.bankidx/2==1) {to_select = treemcts2[from7down.nodeidx].banks[7];} //global_bank_index=39 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from7down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe8up.empty()){
			item new_sel; Tnode to_select;
			item from8up = inpipe8up.read();
			if ((int)from8up.bankidx/2==0) {to_select = treemcts0[from8up.nodeidx].banks[8];} //global_bank_index=8 
			else if ((int)from8up.bankidx/2==1) {to_select = treemcts2[from8up.nodeidx].banks[8];} //global_bank_index=40 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from8up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe8down.empty()){
			item new_sel; Tnode to_select;
			item from8down = inpipe8down.read();
			if ((int)from8down.bankidx/2==0) {to_select = treemcts0[from8down.nodeidx].banks[8];} //global_bank_index=8 
			else if ((int)from8down.bankidx/2==1) {to_select = treemcts2[from8down.nodeidx].banks[8];} //global_bank_index=40 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from8down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe9up.empty()){
			item new_sel; Tnode to_select;
			item from9up = inpipe9up.read();
			if ((int)from9up.bankidx/2==0) {to_select = treemcts0[from9up.nodeidx].banks[9];} //global_bank_index=9 
			else if ((int)from9up.bankidx/2==1) {to_select = treemcts2[from9up.nodeidx].banks[9];} //global_bank_index=41 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from9up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe9down.empty()){
			item new_sel; Tnode to_select;
			item from9down = inpipe9down.read();
			if ((int)from9down.bankidx/2==0) {to_select = treemcts0[from9down.nodeidx].banks[9];} //global_bank_index=9 
			else if ((int)from9down.bankidx/2==1) {to_select = treemcts2[from9down.nodeidx].banks[9];} //global_bank_index=41 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from9down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe10up.empty()){
			item new_sel; Tnode to_select;
			item from10up = inpipe10up.read();
			if ((int)from10up.bankidx/2==0) {to_select = treemcts0[from10up.nodeidx].banks[10];} //global_bank_index=10 
			else if ((int)from10up.bankidx/2==1) {to_select = treemcts2[from10up.nodeidx].banks[10];} //global_bank_index=42 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from10up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe10down.empty()){
			item new_sel; Tnode to_select;
			item from10down = inpipe10down.read();
			if ((int)from10down.bankidx/2==0) {to_select = treemcts0[from10down.nodeidx].banks[10];} //global_bank_index=10 
			else if ((int)from10down.bankidx/2==1) {to_select = treemcts2[from10down.nodeidx].banks[10];} //global_bank_index=42 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from10down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe11up.empty()){
			item new_sel; Tnode to_select;
			item from11up = inpipe11up.read();
			if ((int)from11up.bankidx/2==0) {to_select = treemcts0[from11up.nodeidx].banks[11];} //global_bank_index=11 
			else if ((int)from11up.bankidx/2==1) {to_select = treemcts2[from11up.nodeidx].banks[11];} //global_bank_index=43 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from11up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe11down.empty()){
			item new_sel; Tnode to_select;
			item from11down = inpipe11down.read();
			if ((int)from11down.bankidx/2==0) {to_select = treemcts0[from11down.nodeidx].banks[11];} //global_bank_index=11 
			else if ((int)from11down.bankidx/2==1) {to_select = treemcts2[from11down.nodeidx].banks[11];} //global_bank_index=43 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from11down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe12up.empty()){
			item new_sel; Tnode to_select;
			item from12up = inpipe12up.read();
			if ((int)from12up.bankidx/2==0) {to_select = treemcts0[from12up.nodeidx].banks[12];} //global_bank_index=12 
			else if ((int)from12up.bankidx/2==1) {to_select = treemcts2[from12up.nodeidx].banks[12];} //global_bank_index=44 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from12up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe12down.empty()){
			item new_sel; Tnode to_select;
			item from12down = inpipe12down.read();
			if ((int)from12down.bankidx/2==0) {to_select = treemcts0[from12down.nodeidx].banks[12];} //global_bank_index=12 
			else if ((int)from12down.bankidx/2==1) {to_select = treemcts2[from12down.nodeidx].banks[12];} //global_bank_index=44 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from12down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe13up.empty()){
			item new_sel; Tnode to_select;
			item from13up = inpipe13up.read();
			if ((int)from13up.bankidx/2==0) {to_select = treemcts0[from13up.nodeidx].banks[13];} //global_bank_index=13 
			else if ((int)from13up.bankidx/2==1) {to_select = treemcts2[from13up.nodeidx].banks[13];} //global_bank_index=45 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from13up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe13down.empty()){
			item new_sel; Tnode to_select;
			item from13down = inpipe13down.read();
			if ((int)from13down.bankidx/2==0) {to_select = treemcts0[from13down.nodeidx].banks[13];} //global_bank_index=13 
			else if ((int)from13down.bankidx/2==1) {to_select = treemcts2[from13down.nodeidx].banks[13];} //global_bank_index=45 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from13down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe14up.empty()){
			item new_sel; Tnode to_select;
			item from14up = inpipe14up.read();
			if ((int)from14up.bankidx/2==0) {to_select = treemcts0[from14up.nodeidx].banks[14];} //global_bank_index=14 
			else if ((int)from14up.bankidx/2==1) {to_select = treemcts2[from14up.nodeidx].banks[14];} //global_bank_index=46 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from14up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe14down.empty()){
			item new_sel; Tnode to_select;
			item from14down = inpipe14down.read();
			if ((int)from14down.bankidx/2==0) {to_select = treemcts0[from14down.nodeidx].banks[14];} //global_bank_index=14 
			else if ((int)from14down.bankidx/2==1) {to_select = treemcts2[from14down.nodeidx].banks[14];} //global_bank_index=46 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from14down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe15up.empty()){
			item new_sel; Tnode to_select;
			item from15up = inpipe15up.read();
			if ((int)from15up.bankidx/2==0) {to_select = treemcts0[from15up.nodeidx].banks[15];} //global_bank_index=15 
			else if ((int)from15up.bankidx/2==1) {to_select = treemcts2[from15up.nodeidx].banks[15];} //global_bank_index=47 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from15up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe15down.empty()){
			item new_sel; Tnode to_select;
			item from15down = inpipe15down.read();
			if ((int)from15down.bankidx/2==0) {to_select = treemcts0[from15down.nodeidx].banks[15];} //global_bank_index=15 
			else if ((int)from15down.bankidx/2==1) {to_select = treemcts2[from15down.nodeidx].banks[15];} //global_bank_index=47 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from15down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe16up.empty()){
			item new_sel; Tnode to_select;
			item from16up = inpipe16up.read();
			if ((int)from16up.bankidx/2==0) {to_select = treemcts1[from16up.nodeidx].banks[0];} //global_bank_index=16 
			else if ((int)from16up.bankidx/2==1) {to_select = treemcts3[from16up.nodeidx].banks[0];} //global_bank_index=48 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from16up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe16down.empty()){
			item new_sel; Tnode to_select;
			item from16down = inpipe16down.read();
			if ((int)from16down.bankidx/2==0) {to_select = treemcts1[from16down.nodeidx].banks[0];} //global_bank_index=16 
			else if ((int)from16down.bankidx/2==1) {to_select = treemcts3[from16down.nodeidx].banks[0];} //global_bank_index=48 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from16down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe17up.empty()){
			item new_sel; Tnode to_select;
			item from17up = inpipe17up.read();
			if ((int)from17up.bankidx/2==0) {to_select = treemcts1[from17up.nodeidx].banks[1];} //global_bank_index=17 
			else if ((int)from17up.bankidx/2==1) {to_select = treemcts3[from17up.nodeidx].banks[1];} //global_bank_index=49 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from17up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe17down.empty()){
			item new_sel; Tnode to_select;
			item from17down = inpipe17down.read();
			if ((int)from17down.bankidx/2==0) {to_select = treemcts1[from17down.nodeidx].banks[1];} //global_bank_index=17 
			else if ((int)from17down.bankidx/2==1) {to_select = treemcts3[from17down.nodeidx].banks[1];} //global_bank_index=49 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from17down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe18up.empty()){
			item new_sel; Tnode to_select;
			item from18up = inpipe18up.read();
			if ((int)from18up.bankidx/2==0) {to_select = treemcts1[from18up.nodeidx].banks[2];} //global_bank_index=18 
			else if ((int)from18up.bankidx/2==1) {to_select = treemcts3[from18up.nodeidx].banks[2];} //global_bank_index=50 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from18up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe18down.empty()){
			item new_sel; Tnode to_select;
			item from18down = inpipe18down.read();
			if ((int)from18down.bankidx/2==0) {to_select = treemcts1[from18down.nodeidx].banks[2];} //global_bank_index=18 
			else if ((int)from18down.bankidx/2==1) {to_select = treemcts3[from18down.nodeidx].banks[2];} //global_bank_index=50 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from18down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe19up.empty()){
			item new_sel; Tnode to_select;
			item from19up = inpipe19up.read();
			if ((int)from19up.bankidx/2==0) {to_select = treemcts1[from19up.nodeidx].banks[3];} //global_bank_index=19 
			else if ((int)from19up.bankidx/2==1) {to_select = treemcts3[from19up.nodeidx].banks[3];} //global_bank_index=51 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from19up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe19down.empty()){
			item new_sel; Tnode to_select;
			item from19down = inpipe19down.read();
			if ((int)from19down.bankidx/2==0) {to_select = treemcts1[from19down.nodeidx].banks[3];} //global_bank_index=19 
			else if ((int)from19down.bankidx/2==1) {to_select = treemcts3[from19down.nodeidx].banks[3];} //global_bank_index=51 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from19down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe20up.empty()){
			item new_sel; Tnode to_select;
			item from20up = inpipe20up.read();
			if ((int)from20up.bankidx/2==0) {to_select = treemcts1[from20up.nodeidx].banks[4];} //global_bank_index=20 
			else if ((int)from20up.bankidx/2==1) {to_select = treemcts3[from20up.nodeidx].banks[4];} //global_bank_index=52 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from20up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe20down.empty()){
			item new_sel; Tnode to_select;
			item from20down = inpipe20down.read();
			if ((int)from20down.bankidx/2==0) {to_select = treemcts1[from20down.nodeidx].banks[4];} //global_bank_index=20 
			else if ((int)from20down.bankidx/2==1) {to_select = treemcts3[from20down.nodeidx].banks[4];} //global_bank_index=52 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from20down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe21up.empty()){
			item new_sel; Tnode to_select;
			item from21up = inpipe21up.read();
			if ((int)from21up.bankidx/2==0) {to_select = treemcts1[from21up.nodeidx].banks[5];} //global_bank_index=21 
			else if ((int)from21up.bankidx/2==1) {to_select = treemcts3[from21up.nodeidx].banks[5];} //global_bank_index=53 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from21up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe21down.empty()){
			item new_sel; Tnode to_select;
			item from21down = inpipe21down.read();
			if ((int)from21down.bankidx/2==0) {to_select = treemcts1[from21down.nodeidx].banks[5];} //global_bank_index=21 
			else if ((int)from21down.bankidx/2==1) {to_select = treemcts3[from21down.nodeidx].banks[5];} //global_bank_index=53 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from21down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe22up.empty()){
			item new_sel; Tnode to_select;
			item from22up = inpipe22up.read();
			if ((int)from22up.bankidx/2==0) {to_select = treemcts1[from22up.nodeidx].banks[6];} //global_bank_index=22 
			else if ((int)from22up.bankidx/2==1) {to_select = treemcts3[from22up.nodeidx].banks[6];} //global_bank_index=54 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from22up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe22down.empty()){
			item new_sel; Tnode to_select;
			item from22down = inpipe22down.read();
			if ((int)from22down.bankidx/2==0) {to_select = treemcts1[from22down.nodeidx].banks[6];} //global_bank_index=22 
			else if ((int)from22down.bankidx/2==1) {to_select = treemcts3[from22down.nodeidx].banks[6];} //global_bank_index=54 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from22down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe23up.empty()){
			item new_sel; Tnode to_select;
			item from23up = inpipe23up.read();
			if ((int)from23up.bankidx/2==0) {to_select = treemcts1[from23up.nodeidx].banks[7];} //global_bank_index=23 
			else if ((int)from23up.bankidx/2==1) {to_select = treemcts3[from23up.nodeidx].banks[7];} //global_bank_index=55 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from23up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe23down.empty()){
			item new_sel; Tnode to_select;
			item from23down = inpipe23down.read();
			if ((int)from23down.bankidx/2==0) {to_select = treemcts1[from23down.nodeidx].banks[7];} //global_bank_index=23 
			else if ((int)from23down.bankidx/2==1) {to_select = treemcts3[from23down.nodeidx].banks[7];} //global_bank_index=55 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from23down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe24up.empty()){
			item new_sel; Tnode to_select;
			item from24up = inpipe24up.read();
			if ((int)from24up.bankidx/2==0) {to_select = treemcts1[from24up.nodeidx].banks[8];} //global_bank_index=24 
			else if ((int)from24up.bankidx/2==1) {to_select = treemcts3[from24up.nodeidx].banks[8];} //global_bank_index=56 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from24up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe24down.empty()){
			item new_sel; Tnode to_select;
			item from24down = inpipe24down.read();
			if ((int)from24down.bankidx/2==0) {to_select = treemcts1[from24down.nodeidx].banks[8];} //global_bank_index=24 
			else if ((int)from24down.bankidx/2==1) {to_select = treemcts3[from24down.nodeidx].banks[8];} //global_bank_index=56 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from24down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe25up.empty()){
			item new_sel; Tnode to_select;
			item from25up = inpipe25up.read();
			if ((int)from25up.bankidx/2==0) {to_select = treemcts1[from25up.nodeidx].banks[9];} //global_bank_index=25 
			else if ((int)from25up.bankidx/2==1) {to_select = treemcts3[from25up.nodeidx].banks[9];} //global_bank_index=57 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from25up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe25down.empty()){
			item new_sel; Tnode to_select;
			item from25down = inpipe25down.read();
			if ((int)from25down.bankidx/2==0) {to_select = treemcts1[from25down.nodeidx].banks[9];} //global_bank_index=25 
			else if ((int)from25down.bankidx/2==1) {to_select = treemcts3[from25down.nodeidx].banks[9];} //global_bank_index=57 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from25down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe26up.empty()){
			item new_sel; Tnode to_select;
			item from26up = inpipe26up.read();
			if ((int)from26up.bankidx/2==0) {to_select = treemcts1[from26up.nodeidx].banks[10];} //global_bank_index=26 
			else if ((int)from26up.bankidx/2==1) {to_select = treemcts3[from26up.nodeidx].banks[10];} //global_bank_index=58 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from26up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe26down.empty()){
			item new_sel; Tnode to_select;
			item from26down = inpipe26down.read();
			if ((int)from26down.bankidx/2==0) {to_select = treemcts1[from26down.nodeidx].banks[10];} //global_bank_index=26 
			else if ((int)from26down.bankidx/2==1) {to_select = treemcts3[from26down.nodeidx].banks[10];} //global_bank_index=58 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from26down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe27up.empty()){
			item new_sel; Tnode to_select;
			item from27up = inpipe27up.read();
			if ((int)from27up.bankidx/2==0) {to_select = treemcts1[from27up.nodeidx].banks[11];} //global_bank_index=27 
			else if ((int)from27up.bankidx/2==1) {to_select = treemcts3[from27up.nodeidx].banks[11];} //global_bank_index=59 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from27up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe27down.empty()){
			item new_sel; Tnode to_select;
			item from27down = inpipe27down.read();
			if ((int)from27down.bankidx/2==0) {to_select = treemcts1[from27down.nodeidx].banks[11];} //global_bank_index=27 
			else if ((int)from27down.bankidx/2==1) {to_select = treemcts3[from27down.nodeidx].banks[11];} //global_bank_index=59 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from27down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe28up.empty()){
			item new_sel; Tnode to_select;
			item from28up = inpipe28up.read();
			if ((int)from28up.bankidx/2==0) {to_select = treemcts1[from28up.nodeidx].banks[12];} //global_bank_index=28 
			else if ((int)from28up.bankidx/2==1) {to_select = treemcts3[from28up.nodeidx].banks[12];} //global_bank_index=60 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from28up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe28down.empty()){
			item new_sel; Tnode to_select;
			item from28down = inpipe28down.read();
			if ((int)from28down.bankidx/2==0) {to_select = treemcts1[from28down.nodeidx].banks[12];} //global_bank_index=28 
			else if ((int)from28down.bankidx/2==1) {to_select = treemcts3[from28down.nodeidx].banks[12];} //global_bank_index=60 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from28down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe29up.empty()){
			item new_sel; Tnode to_select;
			item from29up = inpipe29up.read();
			if ((int)from29up.bankidx/2==0) {to_select = treemcts1[from29up.nodeidx].banks[13];} //global_bank_index=29 
			else if ((int)from29up.bankidx/2==1) {to_select = treemcts3[from29up.nodeidx].banks[13];} //global_bank_index=61 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from29up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe29down.empty()){
			item new_sel; Tnode to_select;
			item from29down = inpipe29down.read();
			if ((int)from29down.bankidx/2==0) {to_select = treemcts1[from29down.nodeidx].banks[13];} //global_bank_index=29 
			else if ((int)from29down.bankidx/2==1) {to_select = treemcts3[from29down.nodeidx].banks[13];} //global_bank_index=61 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from29down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe30up.empty()){
			item new_sel; Tnode to_select;
			item from30up = inpipe30up.read();
			if ((int)from30up.bankidx/2==0) {to_select = treemcts1[from30up.nodeidx].banks[14];} //global_bank_index=30 
			else if ((int)from30up.bankidx/2==1) {to_select = treemcts3[from30up.nodeidx].banks[14];} //global_bank_index=62 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from30up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe30down.empty()){
			item new_sel; Tnode to_select;
			item from30down = inpipe30down.read();
			if ((int)from30down.bankidx/2==0) {to_select = treemcts1[from30down.nodeidx].banks[14];} //global_bank_index=30 
			else if ((int)from30down.bankidx/2==1) {to_select = treemcts3[from30down.nodeidx].banks[14];} //global_bank_index=62 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from30down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!inpipe31up.empty()){
			item new_sel; Tnode to_select;
			item from31up = inpipe31up.read();
			if ((int)from31up.bankidx/2==0) {to_select = treemcts1[from31up.nodeidx].banks[15];} //global_bank_index=31 
			else if ((int)from31up.bankidx/2==1) {to_select = treemcts3[from31up.nodeidx].banks[15];} //global_bank_index=63 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from31up.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}
		if (!inpipe31down.empty()){
			item new_sel; Tnode to_select;
			item from31down = inpipe31down.read();
			if ((int)from31down.bankidx/2==0) {to_select = treemcts1[from31down.nodeidx].banks[15];} //global_bank_index=31 
			else if ((int)from31down.bankidx/2==1) {to_select = treemcts3[from31down.nodeidx].banks[15];} //global_bank_index=63 
			int new_bkidx; int new_neidx; fotype ndidx;        
			childargmax(new_bkidx,new_neidx,ndidx,to_select); //assigned values to new_bkidx amd new_neidx        
			new_sel.bankidx = new_bkidx; new_sel.nodeidx = new_neidx;        
			new_sel.pipstage = from31down.pipstage+1; //e.g. pass the bank index output by stage 1 to be input by stage 2 in next iteration        
			outpipe0.write(new_sel);
		}

		if (!ctrl_i.empty()	&& inpipe0up.empty() && inpipe0down.empty() && inpipe1up.empty() && inpipe1down.empty()
		 && inpipe2up.empty() && inpipe2down.empty() && inpipe3up.empty() && inpipe3down.empty()
		 && inpipe4up.empty() && inpipe4down.empty() && inpipe5up.empty() && inpipe5down.empty()
		 && inpipe6up.empty() && inpipe6down.empty() && inpipe7up.empty() && inpipe7down.empty()
		 && inpipe8up.empty() && inpipe8down.empty() && inpipe9up.empty() && inpipe9down.empty()
		 && inpipe10up.empty() && inpipe10down.empty() && inpipe11up.empty() && inpipe11down.empty()
		 && inpipe12up.empty() && inpipe12down.empty() && inpipe13up.empty() && inpipe13down.empty()
		 && inpipe14up.empty() && inpipe14down.empty() && inpipe15up.empty() && inpipe15down.empty()
		 && inpipe16up.empty() && inpipe16down.empty() && inpipe17up.empty() && inpipe17down.empty()
		 && inpipe18up.empty() && inpipe18down.empty() && inpipe19up.empty() && inpipe19down.empty()
		 && inpipe20up.empty() && inpipe20down.empty() && inpipe21up.empty() && inpipe21down.empty()
		 && inpipe22up.empty() && inpipe22down.empty() && inpipe23up.empty() && inpipe23down.empty()
		 && inpipe24up.empty() && inpipe24down.empty() && inpipe25up.empty() && inpipe25down.empty()
		 && inpipe26up.empty() && inpipe26down.empty() && inpipe27up.empty() && inpipe27down.empty()
		 && inpipe28up.empty() && inpipe28down.empty() && inpipe29up.empty() && inpipe29down.empty()
		 && inpipe30up.empty() && inpipe30down.empty() && inpipe31up.empty() && inpipe31down.empty()
			){ctrl_i.read(); break;}
	}
	ctrl_o.write((ctrlbit)1);

}

/*argmax of all the nodes in adj list of to_select, return its bkidx and neidx*/
void childargmax(int &bankidx,
				int &node_entry_idx, //node entri idx in the bank
				fotype &nodeidx, //node index under this parent (used to index bkidx and neidx arrays of Tnode)
				 /*access the aggregated banks*/
				Tnode to_select){
	fotype max_child=0;
	int max_uct=-100;
	Loop_children: for (fotype i=0;i<fo;i++){
		#pragma HLS pipeline II=1
        dtype uct=to_select.ucta[i];
        if(uct>max_uct){
        	max_uct=uct;
        	max_child=i;
		}
	}
	bankidx=to_select.bkidx[max_child];
	node_entry_idx=to_select.neidx[max_child];
	nodeidx=max_child;
}