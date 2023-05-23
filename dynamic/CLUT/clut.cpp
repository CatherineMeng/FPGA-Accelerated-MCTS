
#include <stdio.h>
#include "./clut.h"
#include "hls_print.h"

// void Asym_Butterfly_Switch (int *arr, int idx, int lyr){
//     int temp = arr[i];
//     arr[i] = arr[j];
//     arr[j] = temp;
// }

extern "C" {
    void top(ap_int<1> init_control, int* clut_content, int* ucta_content) {   
        #pragma HLS INTERFACE m_axi port=ucta_content bundle=gmem0 offset=slave
        #pragma HLS INTERFACE s_axilite port=ucta_content bundle=control
        #pragma HLS INTERFACE m_axi port=clut_content bundle=gmem0 offset=slave
        #pragma HLS INTERFACE s_axilite port=clut_content bundle=control
        #pragma HLS INTERFACE s_axilite port=init_control bundle=control
        #pragma HLS INTERFACE s_axilite port=return bundle=control

        hls::stream<ap_int<1>> cntrlpipe;
        
        static Tnode example_node;

        if (init_control){
        	for (int i=0;i<Fo;i++){
        		example_node.ucta[i]=ucta_content[i];
        	}
        }
        int result= hierarchical_cluts(example_node, init_control,clut_content);
        
        printf("argmax: %d\n", result);
    }
}



int hierarchical_cluts(Tnode node_entry, ap_int<1> init_control, int* clut_content){
	#pragma HLS aggregate variable=node_entry.ucta
	sub_array f1;
	for (int i=0;i<f;i++){
		#pragma HLS UNROLL
		f1.ucta[i]=node_entry.ucta[i];
	}
	int argmaxu =0;
	dtype maxu= -100;
	clut<0>(f1, argmaxu,  maxu, init_control,clut_content);
	//TODO: concatenate multiple results into new subarray, dataflow, etc
	return argmaxu;
}

// Set Bit Value
// void ap_(u)int::set (unsigned i, bool v)                              
// void ap_(u)int::set_bit (unsigned i, bool v)
template<int clut_id>
void clut(sub_array uctas, int argmaxu, dtype maxu, ap_int<1> init_control, int* clut_content){
	#pragma HLS aggregate variable=uctas
	static int LUTable [lut_size];
	
	if (init_control){
		for (int i=0;i<lut_size;i++){
			LUTable[i]=clut_content[i];
		}
	}
	else{
		ap_int<num_comp> comp_results;
		// ap_int bit selection /set/clear: https://docs.xilinx.com/r/en-US/ug1399-vitis-hls/Other-Class-Methods-Operators-and-Data-Members
		for (int i=0;i<num_comp-1;i++){
			#pragma HLS UNROLL
			for (int j=i+1;j<num_comp;j++){
				#pragma HLS UNROLL
				unsigned cnt=i*Fo+j-((i+1)*(i+2)/2); //map 2D trangular array to 1D index array
				// comp_results[cnt]=comparison<i,j>(uctas.ucta[i], uctas.ucta[j]);
				bool compresult;
				//compresult = comparison<i,j>(uctas.ucta[i], uctas.ucta[j]);
				if (uctas.ucta[i]<uctas.ucta[j]){compresult = (bool)0;}
				else{compresult = (bool)1;}
				comp_results.set(cnt,compresult);
			}
		}	
		argmaxu = LUTable[comp_results];
		maxu = uctas.ucta[argmaxu];
	}

}

// template<int i, int j>
// bool comparison(dtype ucti, dtype uctj){
// 	if (ucti<uctj){return (bool)0;}
// 	else{return (bool)1;}
// }

