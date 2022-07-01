set moduleName top_Pipeline_VITIS_LOOP_199_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 1
set StallSigGenFlag 1
set isEnableWaveformDebug 1
set C_modelName {top_Pipeline_VITIS_LOOP_199_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ OutTuppipe1 int 128 regular {fifo 0 volatile }  }
	{ OutTuppipe3 int 128 regular {fifo 0 volatile }  }
	{ OutTuppipe2 int 128 regular {fifo 0 volatile }  }
	{ out_r int 128 regular {axi_s 1 volatile  { out_r Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "OutTuppipe1", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "OutTuppipe3", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "OutTuppipe2", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "out_r", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out_r_TREADY sc_in sc_logic 1 outacc 3 } 
	{ OutTuppipe1_dout sc_in sc_lv 128 signal 0 } 
	{ OutTuppipe1_empty_n sc_in sc_logic 1 signal 0 } 
	{ OutTuppipe1_read sc_out sc_logic 1 signal 0 } 
	{ OutTuppipe3_dout sc_in sc_lv 128 signal 1 } 
	{ OutTuppipe3_empty_n sc_in sc_logic 1 signal 1 } 
	{ OutTuppipe3_read sc_out sc_logic 1 signal 1 } 
	{ OutTuppipe2_dout sc_in sc_lv 128 signal 2 } 
	{ OutTuppipe2_empty_n sc_in sc_logic 1 signal 2 } 
	{ OutTuppipe2_read sc_out sc_logic 1 signal 2 } 
	{ out_r_TDATA sc_out sc_lv 128 signal 3 } 
	{ out_r_TVALID sc_out sc_logic 1 outvld 3 } 
	{ ap_ext_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_str_blocking_n sc_out sc_logic 1 signal -1 } 
	{ ap_int_blocking_n sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_r", "role": "TREADY" }} , 
 	{ "name": "OutTuppipe1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "OutTuppipe1", "role": "dout" }} , 
 	{ "name": "OutTuppipe1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutTuppipe1", "role": "empty_n" }} , 
 	{ "name": "OutTuppipe1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutTuppipe1", "role": "read" }} , 
 	{ "name": "OutTuppipe3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "OutTuppipe3", "role": "dout" }} , 
 	{ "name": "OutTuppipe3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutTuppipe3", "role": "empty_n" }} , 
 	{ "name": "OutTuppipe3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutTuppipe3", "role": "read" }} , 
 	{ "name": "OutTuppipe2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "OutTuppipe2", "role": "dout" }} , 
 	{ "name": "OutTuppipe2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutTuppipe2", "role": "empty_n" }} , 
 	{ "name": "OutTuppipe2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutTuppipe2", "role": "read" }} , 
 	{ "name": "out_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "out_r", "role": "TDATA" }} , 
 	{ "name": "out_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_r", "role": "TVALID" }} , 
 	{ "name": "ap_ext_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_ext_blocking_n", "role": "default" }} , 
 	{ "name": "ap_str_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_str_blocking_n", "role": "default" }} , 
 	{ "name": "ap_int_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_int_blocking_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "top_Pipeline_VITIS_LOOP_199_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "OutTuppipe1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "OutTuppipe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "OutTuppipe3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "OutTuppipe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "OutTuppipe2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "OutTuppipe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_r", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_r_TDATA_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_199_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	top_Pipeline_VITIS_LOOP_199_1 {
		OutTuppipe1 {Type I LastRead 2 FirstWrite -1}
		OutTuppipe3 {Type I LastRead 2 FirstWrite -1}
		OutTuppipe2 {Type I LastRead 2 FirstWrite -1}
		out_r {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	OutTuppipe1 { ap_fifo {  { OutTuppipe1_dout fifo_data 0 128 }  { OutTuppipe1_empty_n fifo_status 0 1 }  { OutTuppipe1_read fifo_update 1 1 } } }
	OutTuppipe3 { ap_fifo {  { OutTuppipe3_dout fifo_data 0 128 }  { OutTuppipe3_empty_n fifo_status 0 1 }  { OutTuppipe3_read fifo_update 1 1 } } }
	OutTuppipe2 { ap_fifo {  { OutTuppipe2_dout fifo_data 0 128 }  { OutTuppipe2_empty_n fifo_status 0 1 }  { OutTuppipe2_read fifo_update 1 1 } } }
	out_r { axis {  { out_r_TREADY out_acc 0 1 }  { out_r_TDATA out_data 1 128 }  { out_r_TVALID out_vld 1 1 } } }
}
