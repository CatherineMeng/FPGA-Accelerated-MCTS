set moduleName subT1_lev_stage_4
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 1
set StallSigGenFlag 1
set isEnableWaveformDebug 1
set C_modelName {subT1_lev_stage.4}
set C_modelType { void 0 }
set C_modelArgList {
	{ childindexpipe_0 int 64 regular {fifo 0 volatile }  }
	{ childindexpipe_1 int 64 regular {fifo 1 volatile }  }
	{ lev_retpipe_0 int 1 regular {fifo 0 volatile }  }
	{ lev_retpipe_1 int 1 regular {fifo 1 volatile }  }
	{ IDRpipes_0 int 64 regular {fifo 0 volatile }  }
	{ IDRpipes_1 int 64 regular {fifo 1 volatile }  }
	{ memoiz_array_par_ind int 32 regular {array 32 { 0 3 } 0 1 }  }
	{ memoiz_array_child_ind int 1 regular {array 32 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "childindexpipe_0", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "childindexpipe_1", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "lev_retpipe_0", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "lev_retpipe_1", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "IDRpipes_0", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "IDRpipes_1", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "memoiz_array_par_ind", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "memoiz_array_child_ind", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 35
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ childindexpipe_0_dout sc_in sc_lv 64 signal 0 } 
	{ childindexpipe_0_empty_n sc_in sc_logic 1 signal 0 } 
	{ childindexpipe_0_read sc_out sc_logic 1 signal 0 } 
	{ childindexpipe_1_din sc_out sc_lv 64 signal 1 } 
	{ childindexpipe_1_full_n sc_in sc_logic 1 signal 1 } 
	{ childindexpipe_1_write sc_out sc_logic 1 signal 1 } 
	{ lev_retpipe_0_dout sc_in sc_lv 1 signal 2 } 
	{ lev_retpipe_0_empty_n sc_in sc_logic 1 signal 2 } 
	{ lev_retpipe_0_read sc_out sc_logic 1 signal 2 } 
	{ lev_retpipe_1_din sc_out sc_lv 1 signal 3 } 
	{ lev_retpipe_1_full_n sc_in sc_logic 1 signal 3 } 
	{ lev_retpipe_1_write sc_out sc_logic 1 signal 3 } 
	{ IDRpipes_0_dout sc_in sc_lv 64 signal 4 } 
	{ IDRpipes_0_empty_n sc_in sc_logic 1 signal 4 } 
	{ IDRpipes_0_read sc_out sc_logic 1 signal 4 } 
	{ IDRpipes_1_din sc_out sc_lv 64 signal 5 } 
	{ IDRpipes_1_full_n sc_in sc_logic 1 signal 5 } 
	{ IDRpipes_1_write sc_out sc_logic 1 signal 5 } 
	{ memoiz_array_par_ind_address0 sc_out sc_lv 5 signal 6 } 
	{ memoiz_array_par_ind_ce0 sc_out sc_logic 1 signal 6 } 
	{ memoiz_array_par_ind_we0 sc_out sc_logic 1 signal 6 } 
	{ memoiz_array_par_ind_d0 sc_out sc_lv 32 signal 6 } 
	{ memoiz_array_child_ind_address0 sc_out sc_lv 5 signal 7 } 
	{ memoiz_array_child_ind_ce0 sc_out sc_logic 1 signal 7 } 
	{ memoiz_array_child_ind_we0 sc_out sc_logic 1 signal 7 } 
	{ memoiz_array_child_ind_d0 sc_out sc_lv 1 signal 7 } 
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
 	{ "name": "childindexpipe_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "childindexpipe_0", "role": "dout" }} , 
 	{ "name": "childindexpipe_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "childindexpipe_0", "role": "empty_n" }} , 
 	{ "name": "childindexpipe_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "childindexpipe_0", "role": "read" }} , 
 	{ "name": "childindexpipe_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "childindexpipe_1", "role": "din" }} , 
 	{ "name": "childindexpipe_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "childindexpipe_1", "role": "full_n" }} , 
 	{ "name": "childindexpipe_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "childindexpipe_1", "role": "write" }} , 
 	{ "name": "lev_retpipe_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lev_retpipe_0", "role": "dout" }} , 
 	{ "name": "lev_retpipe_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lev_retpipe_0", "role": "empty_n" }} , 
 	{ "name": "lev_retpipe_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lev_retpipe_0", "role": "read" }} , 
 	{ "name": "lev_retpipe_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lev_retpipe_1", "role": "din" }} , 
 	{ "name": "lev_retpipe_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lev_retpipe_1", "role": "full_n" }} , 
 	{ "name": "lev_retpipe_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lev_retpipe_1", "role": "write" }} , 
 	{ "name": "IDRpipes_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "IDRpipes_0", "role": "dout" }} , 
 	{ "name": "IDRpipes_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipes_0", "role": "empty_n" }} , 
 	{ "name": "IDRpipes_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipes_0", "role": "read" }} , 
 	{ "name": "IDRpipes_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "IDRpipes_1", "role": "din" }} , 
 	{ "name": "IDRpipes_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipes_1", "role": "full_n" }} , 
 	{ "name": "IDRpipes_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipes_1", "role": "write" }} , 
 	{ "name": "memoiz_array_par_ind_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "memoiz_array_par_ind", "role": "address0" }} , 
 	{ "name": "memoiz_array_par_ind_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "memoiz_array_par_ind", "role": "ce0" }} , 
 	{ "name": "memoiz_array_par_ind_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "memoiz_array_par_ind", "role": "we0" }} , 
 	{ "name": "memoiz_array_par_ind_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "memoiz_array_par_ind", "role": "d0" }} , 
 	{ "name": "memoiz_array_child_ind_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "memoiz_array_child_ind", "role": "address0" }} , 
 	{ "name": "memoiz_array_child_ind_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "memoiz_array_child_ind", "role": "ce0" }} , 
 	{ "name": "memoiz_array_child_ind_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "memoiz_array_child_ind", "role": "we0" }} , 
 	{ "name": "memoiz_array_child_ind_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "memoiz_array_child_ind", "role": "d0" }} , 
 	{ "name": "ap_ext_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_ext_blocking_n", "role": "default" }} , 
 	{ "name": "ap_str_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_str_blocking_n", "role": "default" }} , 
 	{ "name": "ap_int_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_int_blocking_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "subT1_lev_stage_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "childindexpipe_0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "childindexpipe_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "childindexpipe_1", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "childindexpipe_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "lev_retpipe_0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "lev_retpipe_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "lev_retpipe_1", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "lev_retpipe_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IDRpipes_0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "IDRpipes_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IDRpipes_1", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "IDRpipes_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "memoiz_array_par_ind", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "memoiz_array_child_ind", "Type" : "Memory", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	subT1_lev_stage_4 {
		childindexpipe_0 {Type I LastRead 0 FirstWrite -1}
		childindexpipe_1 {Type O LastRead -1 FirstWrite 1}
		lev_retpipe_0 {Type I LastRead 0 FirstWrite -1}
		lev_retpipe_1 {Type O LastRead -1 FirstWrite 1}
		IDRpipes_0 {Type I LastRead 0 FirstWrite -1}
		IDRpipes_1 {Type O LastRead -1 FirstWrite 1}
		memoiz_array_par_ind {Type O LastRead -1 FirstWrite 0}
		memoiz_array_child_ind {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	childindexpipe_0 { ap_fifo {  { childindexpipe_0_dout fifo_data 0 64 }  { childindexpipe_0_empty_n fifo_status 0 1 }  { childindexpipe_0_read fifo_update 1 1 } } }
	childindexpipe_1 { ap_fifo {  { childindexpipe_1_din fifo_data 1 64 }  { childindexpipe_1_full_n fifo_status 0 1 }  { childindexpipe_1_write fifo_update 1 1 } } }
	lev_retpipe_0 { ap_fifo {  { lev_retpipe_0_dout fifo_data 0 1 }  { lev_retpipe_0_empty_n fifo_status 0 1 }  { lev_retpipe_0_read fifo_update 1 1 } } }
	lev_retpipe_1 { ap_fifo {  { lev_retpipe_1_din fifo_data 1 1 }  { lev_retpipe_1_full_n fifo_status 0 1 }  { lev_retpipe_1_write fifo_update 1 1 } } }
	IDRpipes_0 { ap_fifo {  { IDRpipes_0_dout fifo_data 0 64 }  { IDRpipes_0_empty_n fifo_status 0 1 }  { IDRpipes_0_read fifo_update 1 1 } } }
	IDRpipes_1 { ap_fifo {  { IDRpipes_1_din fifo_data 1 64 }  { IDRpipes_1_full_n fifo_status 0 1 }  { IDRpipes_1_write fifo_update 1 1 } } }
	memoiz_array_par_ind { ap_memory {  { memoiz_array_par_ind_address0 mem_address 1 5 }  { memoiz_array_par_ind_ce0 mem_ce 1 1 }  { memoiz_array_par_ind_we0 mem_we 1 1 }  { memoiz_array_par_ind_d0 mem_din 1 32 } } }
	memoiz_array_child_ind { ap_memory {  { memoiz_array_child_ind_address0 mem_address 1 5 }  { memoiz_array_child_ind_ce0 mem_ce 1 1 }  { memoiz_array_child_ind_we0 mem_we 1 1 }  { memoiz_array_child_ind_d0 mem_din 1 1 } } }
}
