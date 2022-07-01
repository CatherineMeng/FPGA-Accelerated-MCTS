set moduleName top_Pipeline_VITIS_LOOP_154_1
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
set C_modelName {top_Pipeline_VITIS_LOOP_154_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ xbarIDRpipe int 52 regular {fifo 0 volatile }  }
	{ IDRpipe1 int 52 regular {fifo 1 volatile }  }
	{ xbarpipe int 3 regular {fifo 0 volatile }  }
	{ IDRpipe2 int 52 regular {fifo 1 volatile }  }
	{ IDRpipe3 int 52 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "xbarIDRpipe", "interface" : "fifo", "bitwidth" : 52, "direction" : "READONLY"} , 
 	{ "Name" : "IDRpipe1", "interface" : "fifo", "bitwidth" : 52, "direction" : "WRITEONLY"} , 
 	{ "Name" : "xbarpipe", "interface" : "fifo", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "IDRpipe2", "interface" : "fifo", "bitwidth" : 52, "direction" : "WRITEONLY"} , 
 	{ "Name" : "IDRpipe3", "interface" : "fifo", "bitwidth" : 52, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ xbarpipe_dout sc_in sc_lv 3 signal 2 } 
	{ xbarpipe_empty_n sc_in sc_logic 1 signal 2 } 
	{ xbarpipe_read sc_out sc_logic 1 signal 2 } 
	{ xbarIDRpipe_dout sc_in sc_lv 52 signal 0 } 
	{ xbarIDRpipe_empty_n sc_in sc_logic 1 signal 0 } 
	{ xbarIDRpipe_read sc_out sc_logic 1 signal 0 } 
	{ IDRpipe1_din sc_out sc_lv 52 signal 1 } 
	{ IDRpipe1_full_n sc_in sc_logic 1 signal 1 } 
	{ IDRpipe1_write sc_out sc_logic 1 signal 1 } 
	{ IDRpipe2_din sc_out sc_lv 52 signal 3 } 
	{ IDRpipe2_full_n sc_in sc_logic 1 signal 3 } 
	{ IDRpipe2_write sc_out sc_logic 1 signal 3 } 
	{ IDRpipe3_din sc_out sc_lv 52 signal 4 } 
	{ IDRpipe3_full_n sc_in sc_logic 1 signal 4 } 
	{ IDRpipe3_write sc_out sc_logic 1 signal 4 } 
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
 	{ "name": "xbarpipe_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "xbarpipe", "role": "dout" }} , 
 	{ "name": "xbarpipe_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xbarpipe", "role": "empty_n" }} , 
 	{ "name": "xbarpipe_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xbarpipe", "role": "read" }} , 
 	{ "name": "xbarIDRpipe_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":52, "type": "signal", "bundle":{"name": "xbarIDRpipe", "role": "dout" }} , 
 	{ "name": "xbarIDRpipe_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xbarIDRpipe", "role": "empty_n" }} , 
 	{ "name": "xbarIDRpipe_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xbarIDRpipe", "role": "read" }} , 
 	{ "name": "IDRpipe1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":52, "type": "signal", "bundle":{"name": "IDRpipe1", "role": "din" }} , 
 	{ "name": "IDRpipe1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipe1", "role": "full_n" }} , 
 	{ "name": "IDRpipe1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipe1", "role": "write" }} , 
 	{ "name": "IDRpipe2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":52, "type": "signal", "bundle":{"name": "IDRpipe2", "role": "din" }} , 
 	{ "name": "IDRpipe2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipe2", "role": "full_n" }} , 
 	{ "name": "IDRpipe2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipe2", "role": "write" }} , 
 	{ "name": "IDRpipe3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":52, "type": "signal", "bundle":{"name": "IDRpipe3", "role": "din" }} , 
 	{ "name": "IDRpipe3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipe3", "role": "full_n" }} , 
 	{ "name": "IDRpipe3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipe3", "role": "write" }} , 
 	{ "name": "ap_ext_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_ext_blocking_n", "role": "default" }} , 
 	{ "name": "ap_str_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_str_blocking_n", "role": "default" }} , 
 	{ "name": "ap_int_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_int_blocking_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "top_Pipeline_VITIS_LOOP_154_1",
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
			{"Name" : "xbarIDRpipe", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "xbarIDRpipe_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IDRpipe1", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "IDRpipe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xbarpipe", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "xbarpipe_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IDRpipe2", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "IDRpipe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IDRpipe3", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "IDRpipe3_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_154_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	top_Pipeline_VITIS_LOOP_154_1 {
		xbarIDRpipe {Type I LastRead 1 FirstWrite -1}
		IDRpipe1 {Type O LastRead -1 FirstWrite 2}
		xbarpipe {Type I LastRead 1 FirstWrite -1}
		IDRpipe2 {Type O LastRead -1 FirstWrite 2}
		IDRpipe3 {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	xbarIDRpipe { ap_fifo {  { xbarIDRpipe_dout fifo_data 0 52 }  { xbarIDRpipe_empty_n fifo_status 0 1 }  { xbarIDRpipe_read fifo_update 1 1 } } }
	IDRpipe1 { ap_fifo {  { IDRpipe1_din fifo_data 1 52 }  { IDRpipe1_full_n fifo_status 0 1 }  { IDRpipe1_write fifo_update 1 1 } } }
	xbarpipe { ap_fifo {  { xbarpipe_dout fifo_data 0 3 }  { xbarpipe_empty_n fifo_status 0 1 }  { xbarpipe_read fifo_update 1 1 } } }
	IDRpipe2 { ap_fifo {  { IDRpipe2_din fifo_data 1 52 }  { IDRpipe2_full_n fifo_status 0 1 }  { IDRpipe2_write fifo_update 1 1 } } }
	IDRpipe3 { ap_fifo {  { IDRpipe3_din fifo_data 1 52 }  { IDRpipe3_full_n fifo_status 0 1 }  { IDRpipe3_write fifo_update 1 1 } } }
}
