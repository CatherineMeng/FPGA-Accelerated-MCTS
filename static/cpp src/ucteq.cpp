// #define L1_Stride 1

// this is the async version. for this, matching worker ids to reward indexes ahve to be checked on FPGA.
// Therefore, the sstrweam ids and the id in the output tuple struct are neecded.
// for the sync version, cpu can make sure X array index is matched to simualtion worker who write to X array in the same index.
// so no need for transsferring IDs.
#include "ucteq.h"

#define D 5 //depth of tree excluding root

typedef qdma_axis<20,0,0,0> pkt; //for streaming reward with host
typedef qdma_axis<32,0,0,0> pkt32; //for streaming input worker id with host
typedef qdma_axis<128,0,0,0> pkt128; //for streaming output with host
extern "C" {
	void top(
	        hls::stream<pkt> &X, // rewards (Backprop+Sel input)
	        hls::stream<pkt32> &ids, // simulation worker id (Backprop input for identifying memoization location, not needed for sync. version)
	        hls::stream<pkt32> &selsig, // an array of selection signals (only non-empty before the execution of tree flush) (Backprop+Sel input)
	        // const unsigned dtype *n, // an array of visit counts should be stored on-chip
	        hls::stream<pkt128> &out,       // pw best UCT leaf index,subtree index,leaf depth index,expansion actions (Selection output)
	        node *adj_list	//Tree array output port for flushing, size mstps
	        // int size                 // Size in integer
	        int flushs	//flushs signal =1, rerun kernel once for every tree-flush.
	        			//flushs signal =2, rerun kernel once for every init.
	        			//otherwise, run backupsel pipeline.
	        )
	{
		#pragma HLS INTERFACE axis port=X 
		#pragma HLS INTERFACE axis port=ids 
		#pragma HLS INTERFACE axis port=selsig
		#pragma HLS INTERFACE axis port=out

		#pragma HLS INTERFACE m_axi port=adj_list bundle=gmem0 offset=slave

		#pragma HLS INTERFACE s_axilite port=adj_list bundle=control
		#pragma HLS INTERFACE s_axilite port=flushs bundle=control
		#pragma HLS INTERFACE s_axilite port=return bundle=control


		// lev1 selector
		hls::stream<ap_int<fo>> xbarpipe("xbarpipe");
		#pragma HLS STREAM variable=xbarpipe depth=1
	 	#pragma HLS bind_storage variable=xbarpipe type=fifo impl=SRL 
	 	
	 	hls::stream<BpSel_inputObj> xbarIDRpipe("xbarIDRpipe");
		#pragma HLS STREAM variable=xbarIDRpipe depth=1
	 	#pragma HLS bind_storage variable=xbarIDRpipe type=fifo impl=SRL 

	 	/*
	 	hls::stream<int> xbarIDpipe("xbarIDpipe");
		#pragma HLS STREAM variable=xbarIDpipe depth=1
	 	#pragma HLS bind_storage variable=xbarIDpipe type=fifo impl=SRL 
	 	hls::stream<int> rewardpipe("rewardpipe");
		#pragma HLS STREAM variable=rewardpipe depth=1
	 	#pragma HLS bind_storage variable=rewardpipe type=fifo impl=SRL
	 	*/


		// number of xbar output pipes should be equal to fo (A).

	 	hls::stream<BpSel_inputObj> IDRpipe1("IDRpipe1");
		#pragma HLS STREAM variable=IDRpipe1 depth=pw
	 	#pragma HLS bind_storage variable=IDRpipe1 type=fifo impl=SRL
		hls::stream<BpSel_inputObj> IDRpipe2("IDRpipe2");
		#pragma HLS STREAM variable=IDRpipe2 depth=pw
	 	#pragma HLS bind_storage variable=IDRpipe2 type=fifo impl=SRL
		hls::stream<BpSel_inputObj> IDRpipe3("IDRpipe3");
		#pragma HLS STREAM variable=IDRpipe3 depth=pw
	 	#pragma HLS bind_storage variable=IDRpipe3 type=fifo impl=SRL

		/*
		hls::stream<int> IDpipe1("IDpipe1");
		#pragma HLS STREAM variable=IDpipe1 depth=1
	 	#pragma HLS bind_storage variable=IDpipe1 type=fifo impl=SRL
		hls::stream<int> IDpipe2("IDpipe2");
		#pragma HLS STREAM variable=IDpipe2 depth=1
	 	#pragma HLS bind_storage variable=IDpipe2 type=fifo impl=SRL
		hls::stream<int> IDpipe3("IDpipe3");
		#pragma HLS STREAM variable=IDpipe3 depth=1
	 	#pragma HLS bind_storage variable=IDpipe3 type=fifo impl=SRL

		hls::stream<dtype> rewardpipe1("rewardpipe1");
		#pragma HLS STREAM variable=rewardpipe1 depth=1
	 	#pragma HLS bind_storage variable=rewardpipe1 type=fifo impl=SRL
		hls::stream<dtype> rewardpipe2("rewardpipe2");
		#pragma HLS STREAM variable=rewardpipe2 depth=1
	 	#pragma HLS bind_storage variable=rewardpipe2 type=fifo impl=SRL
		hls::stream<dtype> rewardpipe3("rewardpipe3");
		#pragma HLS STREAM variable=rewardpipe3 depth=1
	 	#pragma HLS bind_storage variable=rewardpipe3 type=fifo impl=SRL
	 	*/
	 	hls::stream<SelTupleOut> OutTuppipe1("OutTuppipe1");
		#pragma HLS STREAM variable=OutTuppipe1 depth=pw
	 	#pragma HLS bind_storage variable=OutTuppipe1 type=fifo impl=SRL
		hls::stream<SelTupleOut> OutTuppipe2("OutTuppipe2");
		#pragma HLS STREAM variable=OutTuppipe2 depth=pw
	 	#pragma HLS bind_storage variable=OutTuppipe2 type=fifo impl=SRL
		hls::stream<SelTupleOut> OutTuppipe3("OutTuppipe3");
		#pragma HLS STREAM variable=OutTuppipe3 depth=pw
	 	#pragma HLS bind_storage variable=OutTuppipe3 type=fifo impl=SRL


		static node root;
		static ap_int<2> memoi_lev1BkUp[pw]; //datawidth=log2(fo)
		static node lev1[fo];


		#ifndef __SYNTHESIS__
		std::cout << "HI there krnl1." << std::endl;
		#endif

		while (!X.empty()){
			// put dataflow here
			#pragma HLS DATAFLOW
			// ======back-up at root======
			dtype V=X.read();
			int id=ids.read();
			root.ucta[id]+=V;
			// ======selection at root======
			dtype max_uct=-100;
			Loop_children: for(int i = 0; i < fo; ++i){ 
		    	#pragma HLS pipeline      
		        dtype uct=root.ucta[i];
		        if(uct>max_uct){
		        	max_uct=uct;
		        	ap_int<fo> max_child=root.cind[i];
		        }
		    }
		    xbarpipe.write(max_child);

		    // =========replaced with BpSel_inputObj=========
		    BpSel_inputObj bps_in;
		    bps_in.wind=id
			bps_in.new_rewd=V

			xbarIDRpipe.write(bps_in);
		    // xbarIDpipe.write(id);
		    // rewardpipe.write(V);

		    // xbar(xbarpipe,
		    // 	rewardpipe,rewardpipe1,rewardpipe2,rewardpipe3,
		    // 	xbarIDpipe,IDpipe1,IDpipe2,IDpipe3);
		    xbar(xbarpipe,
		    	xbarIDRpipe,IDRpipe1,IDRpipe2,IDRpipe3);

		    subT1_pipl(IDRpipe1,OutTuppipe1,flushs);
		    // subT2_pipl();
		    // subT3_pipl();
		    collect_out(OutTuppipe1,OutTuppipe2,OutTuppipe3,out);


		}

		// initialize (one sub-)tree in the beginning
		if (flushs==2){ //this need to be ported too the functions where banks are declared
			for(int i =0; i<mstps; i++){
				counter[i]=0;
				tree[i].ind=i;
				tree[i].numv=0;
				tree[i].numc=1;
				for(int j =0; j<fo; j++){
					#pragma HLS pipeline
					tree[i].cind[j]=0; //need to init this to specific numbers
					tree[i].ucta[j]=0;
					tree[i].numvc[j]=1;
				}
			}
		}

	}
}

// this will be customized based on fo
void xbar(
		hls::stream<ap_int<fo>> &inpipe,
		// hls::stream<dtype> &rewardpipe,
		// hls::stream<dtype> &rewardpipe1, 
		// hls::stream<dtype> &rewardpipe2,
		// hls::stream<dtype> &rewardpipe3,
		// hls::stream<int> &inIDpipe,
		// hls::stream<int> &outIDpipe1, 
		// hls::stream<int> &outIDpipe2,
		// hls::stream<int> &outIDpipe3
		hls::stream<BpSel_inputObj> &inIDRpipe,
		hls::stream<BpSel_inputObj> &outIDRpipe1, 
		hls::stream<BpSel_inputObj> &outIDRpipe2,
		hls::stream<BpSel_inputObj> &outIDRpipe3
		)
{
	while (1){
		
	}
	ap_int<fo> ind = inpipe.read();
	// dtype V=rewardpipe.read();
	// int worker_id=inIDpipe.read();
	BpSel_inputObj IDRobject=inIDRpipe.read();
	if(ind==1){
		// outIDpipe1.write(worker_id);
		// rewardpipe1.write(V);
		outIDRpipe1.write(IDRobject);
	}	
	if(ind==2){
		// outIDpipe2.write(worker_id);
		// rewardpipe2.write(V);
		outIDRpipe2.write(IDRobject);
	}	
	if(ind==3){
		// outIDpipe3.write(worker_id);
		// rewardpipe3.write(V);
		outIDRpipe3.write(IDRobject);
	}	
}

void collect_out(
		hls::stream<SelTupleOut> &inpipe1,
		hls::stream<SelTupleOut> &inpipe2, 
		hls::stream<SelTupleOut> &inpipe3,
		hls::stream<pkt128> &out
		)
{

while(!inpipe1.empty()){

}
	ap_int<fo> ind = inpipe.read();
	// dtype V=rewardpipe.read();
	// int worker_id=inIDpipe.read();
	BpSel_inputObj IDRobject=inIDRpipe.read();
	if(ind==1){
		// outIDpipe1.write(worker_id);
		// rewardpipe1.write(V);
		outIDRpipe1.write(IDRobject);
	}	
	if(ind==2){
		// outIDpipe2.write(worker_id);
		// rewardpipe2.write(V);
		outIDRpipe2.write(IDRobject);
	}	
	if(ind==3){
		// outIDpipe3.write(worker_id);
		// rewardpipe3.write(V);
		outIDRpipe3.write(IDRobject);
	}	
}

void subT1_pipl(
		// hls::stream<dtype> &Reward_inpipe, //a reward for BackUp comes
		// hls::stream<int> &IDpipe, //a worker ID for memoization of selected indices
		hls::stream<BpSel_inputObj> &inIDRpipe,
		hls::stream<SelTupleOut> &outpipe,
		// hls::stream<pkt128> &out, //=======================TODO: add flush logic=======================
		int flushs)
{
	
	hls::stream<ap_int<1>> lev_retpipe[D];
	#pragma HLS STREAM variable=lev_retpipe depth=1
 	#pragma HLS bind_storage variable=lev_retpipe type=fifo impl=SRL 

 	hls::stream<pipecomm> childindexpipe[D];
	#pragma HLS STREAM variable=childindexpipe depth=1
 	#pragma HLS bind_storage variable=childindexpipe type=fifo impl=SRL 

 	/* //note: combined to IDRpipes
 	hls::stream<int> widpipe[D];
	#pragma HLS STREAM variable=widpipe depth=1
 	#pragma HLS bind_storage variable=widpipe type=fifo impl=SRL 

 	hls::stream<dtype> Vpipe[D];
	#pragma HLS STREAM variable=Vpipe depth=1
 	#pragma HLS bind_storage variable=Vpipe type=fifo impl=SRL 
 	*/
  	hls::stream<BpSel_inputObj> IDRpipes[D];
	#pragma HLS STREAM variable=IDRpipes depth=1
 	#pragma HLS bind_storage variable=IDRpipes type=fifo impl=SRL


 	// Memory bank declarations
	static node lev1[1];
	// static memoized memoizlev1[pw]; //which child of lev1 node did we select
	static node lev2[fo];
	// static memoized memoizlev2[pw]; //which child of lev2 node did we select
	static node lev3[pow(fo,2)];
	// static memoized memoizlev3[pw];
	static node lev4[pow(fo,3)];
	// static memoized memoizlev4[pw];
	static node lev5[pow(fo,4)]; 

	static memoized memoizlevs[D][pw];
	#pragma HLS ARRAY_PARTITION variable=memoizlevs dim=1 complete
	
	//during traversing any above memory bank, 
	//if a leaf is reached, toggle the contrtol signal lev_return so that 
	//following levpipl calls simply carry on without further backup/sel.
	ap_int<1> lev_return=0;
 	pipecomm init_obj;
 	init_obj.depth=1;
 	init_obj.ind=0; //Selection par index always start at index 0 at lev1 (bc it is the only avail)
 	SelTupleOut outobj;

	while(!inIDRpipe.empty()){
		// put dataflow here
		#pragma HLS DATAFLOW
		// dtype V=inIDRpipe.read();
		// id=IDpipe.read();

		BpSel_inputObj IDRobject=inIDRpipe.read();
		
		lev_retpipe[0].write(lev_return);
		childindexpipe[0].write(init_obj);
		// widpipe[0].write(id);
		// Vpipe[0].write(V);
		IDRpipes[0].write(IDRobject);

		// dataflow
		// we need to manually unroll the following dataflow
		// for (i=0;i<D;i++){
			// subT1_lev_stage(childindexpipe[i], childindexpipe[i+1],lev_retpipe[i],lev_retpipe[i+1],
			// V,d,lev1, memoizlev1[pw],id);
		// }
		/* //non-pipelined backup:
		lev1[memoizlev1[id]].ucta+=v;
		lev2[memoizlev2[id]]+=v;
		lev3[memoizlev3[id]]+=v;
		lev4[memoizlev4[id]]+=v;
		lev5[memoizlev5[id]]+=v;*/
		subT1_lev_stage(childindexpipe[0], childindexpipe[1],lev_retpipe[0],lev_retpipe[1],
			IDRpipes[0],IDRpipes[1],lev1, memoizlevs[0]);
		subT1_lev_stage(childindexpipe[1], childindexpipe[2],lev_retpipe[1],lev_retpipe[2],
			IDRpipes[1],IDRpipes[2],lev2, memoizlevs[1]);
		subT1_lev_stage(childindexpipe[2], childindexpipe[3],lev_retpipe[2],lev_retpipe[3],
			IDRpipes[2],IDRpipes[3],lev3, memoizlevs[2]);
		subT1_lev_stage(childindexpipe[3], childindexpipe[4],lev_retpipe[3],lev_retpipe[4],
			IDRpipes[3],IDRpipes[4],lev4, memoizlevs[3]);
		subT1_lev_stage(childindexpipe[4], childindexpipe[5],lev_retpipe[4],lev_retpipe[5],
			IDRpipes[4],IDRpipes[5],lev5, memoizlevs[4]);
		// ========Done: if selection returns at the last level, do expansion logic? not increasing numc=============
		// ========Done: if nothing to expand at max depth, simply return this index and let cpu re-run simu? Yes, extremely rare becasue sparse reward - subtree usually grows balanced=============
		// DONE: identify action_to_return without inserting another pipe
		lev_retpipe[0].write(lev_return)
		pipecomm resultIndDepth=childindexpipe[5].read();
		int ret_depth = resultIndDepth.depth;
		outobj.out_sti=1;
		outobj.out_di=ret_depth;
		memoized leaf_act = memoizlevs[ret_depth][IDRobject.wind];
		outobj.leafind = leaf_act.par_ind;
		outobj.aind = leaf_act.child_ind;
		outpipe.write(outobj);
	}
	
}

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
		)       
{
	pipecomm pipeobj=inpipe.read();
	int parindex=pipeobj.ind;
	int newind; //this will replace pipeobj.ind to pass to next stage
	node parnode=node_array[parindex];//for selection
	int return_depth=pipeobj.depth;

	ap_int<1> ret_signal=returnpipe_in.read();

	IDRobject IDR =IDRpipe_in.read();
	int worker_id = IDR.wind;
	dtype V = IDR.new_rewd;

	if (!ret_signal){
		// ---------------backup---------------
		memoized mobj=memoiz_array[worker_id];
		int mpar=mobj.par_ind;
		int mchd=mobj.child_ind;
		//only update if node has been visited (mchd child numc!=0)
			//(if selection returned early, for the rest of stages we write fo+1 to memoiz_array.)
		if (node_array[mpar].numc!=0 and mpar<fo and mchd<fo){
			node_array[mpar].ucta[mchd]+=V;
		}

		// ---------------select a child---------------
		int max_child=0;
		
		if (parnode.numc<fo or return_depth==D){ //return depth has been incremented D time, reached last pipeline, has to return even tho ret_signal has not been updated to 1 yet.
			//This is a leaf, expand
			if (parnode.numc<fo)parnode.numc+=1;
			
			ret_signal=1;
			// after this stage(reaching the leaf), pipeobj(for selection) should be unchanged. 
			// in the end it is sent to cpu for identifying the index tuple of the node for simulation hash.
			// after this stage(reaching the leaf), memoiz_array content in next levels should not matter because in their node arrays, parnode.numc==0.

			// ========DONE: logic for action_to_return - maybe we dont need a pipe? just return both parent ind and child ind=============
			// int action_to_return=parnode.numc;
			newind=parindex*fo+int(parnode.numc); //last level pipeline need to return both leaf and expanded action
		}
		else{ //non-leaf or last level, selection continues to the next stage
			return_depth+=1;
			Loop_children: for(int i = 0; i < fo; ++i){ 
		    	#pragma HLS pipeline
		        dtype uct=parnode.ucta[i];
		        if(uct>max_uct){
		        	max_uct=uct;
		        	max_child+=1;
		        }
		    }	
		    newind=max_child;	//This is the parindex to be read from pipe in the next stage (tree level)	
		}
		// after selection, update memoization buffer for next-round backup
		mobj.par_ind=parindex;
		mobj.child_ind=max_child; //used to udpate memoization
		memoiz_array[worker_id]=mobj;
	    
	}

	else {newind=parindex*fo+int(parnode.numc);}  //returned at before last level pipeline,need to return both leaf and expanded action
	pipeobj.ind=newind;
	pipeobj.depth=return_depth;

	outpipe.write(pipeobj);
	returnpipe_out.write(ret_signal);
	widpipe_out.write(worker_id);
}

/*
void flush_tree(node<mstps> *tree_out){

}
*/
