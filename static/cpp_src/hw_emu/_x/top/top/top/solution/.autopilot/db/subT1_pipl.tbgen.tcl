set moduleName subT1_pipl
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
set C_modelName {subT1_pipl}
set C_modelType { void 0 }
set C_modelArgList {
	{ IDRpipe1 int 52 regular {fifo 0 volatile }  }
	{ Wsigpipe1161 int 1 regular {fifo 0 volatile }  }
	{ OutTuppipe1 int 128 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "IDRpipe1", "interface" : "fifo", "bitwidth" : 52, "direction" : "READONLY"} , 
 	{ "Name" : "Wsigpipe1161", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "OutTuppipe1", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ IDRpipe1_dout sc_in sc_lv 52 signal 0 } 
	{ IDRpipe1_empty_n sc_in sc_logic 1 signal 0 } 
	{ IDRpipe1_read sc_out sc_logic 1 signal 0 } 
	{ Wsigpipe1161_dout sc_in sc_lv 1 signal 1 } 
	{ Wsigpipe1161_empty_n sc_in sc_logic 1 signal 1 } 
	{ Wsigpipe1161_read sc_out sc_logic 1 signal 1 } 
	{ OutTuppipe1_din sc_out sc_lv 128 signal 2 } 
	{ OutTuppipe1_full_n sc_in sc_logic 1 signal 2 } 
	{ OutTuppipe1_write sc_out sc_logic 1 signal 2 } 
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
 	{ "name": "IDRpipe1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":52, "type": "signal", "bundle":{"name": "IDRpipe1", "role": "dout" }} , 
 	{ "name": "IDRpipe1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipe1", "role": "empty_n" }} , 
 	{ "name": "IDRpipe1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IDRpipe1", "role": "read" }} , 
 	{ "name": "Wsigpipe1161_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "Wsigpipe1161", "role": "dout" }} , 
 	{ "name": "Wsigpipe1161_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Wsigpipe1161", "role": "empty_n" }} , 
 	{ "name": "Wsigpipe1161_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Wsigpipe1161", "role": "read" }} , 
 	{ "name": "OutTuppipe1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "OutTuppipe1", "role": "din" }} , 
 	{ "name": "OutTuppipe1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutTuppipe1", "role": "full_n" }} , 
 	{ "name": "OutTuppipe1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutTuppipe1", "role": "write" }} , 
 	{ "name": "ap_ext_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_ext_blocking_n", "role": "default" }} , 
 	{ "name": "ap_str_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_str_blocking_n", "role": "default" }} , 
 	{ "name": "ap_int_blocking_n", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_int_blocking_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "16", "19", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41"],
		"CDFG" : "subT1_pipl",
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
			{"Name" : "IDRpipe1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "IDRpipe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Wsigpipe1161", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "Wsigpipe1161_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "OutTuppipe1", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "OutTuppipe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_subT1_lev_stage_4_fu_422", "Port" : "memoiz_array_par_ind", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_subT1_lev_stage_4_fu_422", "Port" : "memoiz_array_child_ind", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_subT1_lev_stage_3_fu_436", "Port" : "memoiz_array_par_ind", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_subT1_lev_stage_3_fu_436", "Port" : "memoiz_array_child_ind", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "lev3_numc_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_subT1_lev_stage_2_fu_450", "Port" : "lev3_numc_V", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "lev3_ucta_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_subT1_lev_stage_2_fu_450", "Port" : "lev3_ucta_V", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_subT1_lev_stage_2_fu_450", "Port" : "memoiz_array_par_ind", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_subT1_lev_stage_2_fu_450", "Port" : "memoiz_array_child_ind", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "lev4_numc_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_subT1_lev_stage_1_fu_468", "Port" : "lev4_numc_V", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "lev4_ucta_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_subT1_lev_stage_1_fu_468", "Port" : "lev4_ucta_V", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_subT1_lev_stage_1_fu_468", "Port" : "memoiz_array_par_ind", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "grp_subT1_lev_stage_1_fu_468", "Port" : "memoiz_array_child_ind", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "lev5_numc_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_subT1_lev_stage_fu_486", "Port" : "lev5_numc_V", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "lev5_ucta_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_subT1_lev_stage_fu_486", "Port" : "lev5_ucta_V", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_subT1_lev_stage_fu_486", "Port" : "memoiz_array_par_ind", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_subT1_lev_stage_fu_486", "Port" : "memoiz_array_child_ind", "Inst_start_state" : "11", "Inst_end_state" : "12"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_304_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state14"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_5_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_1_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_6_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_2_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_7_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_3_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_8_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_4_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_subT1_lev_stage_4_fu_422", "Parent" : "0",
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
			{"Name" : "memoiz_array_child_ind", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_subT1_lev_stage_3_fu_436", "Parent" : "0",
		"CDFG" : "subT1_lev_stage_3",
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
			{"Name" : "memoiz_array_child_ind", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_subT1_lev_stage_2_fu_450", "Parent" : "0", "Child" : ["14", "15"],
		"CDFG" : "subT1_lev_stage_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "8",
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
			{"Name" : "memoiz_array_par_ind", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "memoiz_array_child_ind", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "lev3_numc_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lev3_ucta_V", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_lev_stage_2_fu_450.lev3_numc_V_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_lev_stage_2_fu_450.lev3_ucta_V_U", "Parent" : "13"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_subT1_lev_stage_1_fu_468", "Parent" : "0", "Child" : ["17", "18"],
		"CDFG" : "subT1_lev_stage_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "8",
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
			{"Name" : "memoiz_array_par_ind", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "memoiz_array_child_ind", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "lev4_numc_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lev4_ucta_V", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_lev_stage_1_fu_468.lev4_numc_V_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_lev_stage_1_fu_468.lev4_ucta_V_U", "Parent" : "16"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_subT1_lev_stage_fu_486", "Parent" : "0", "Child" : ["20", "21"],
		"CDFG" : "subT1_lev_stage",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "8",
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
			{"Name" : "memoiz_array_par_ind", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "memoiz_array_child_ind", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "lev5_numc_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lev5_ucta_V", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_lev_stage_fu_486.lev5_numc_V_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_lev_stage_fu_486.lev5_ucta_V_U", "Parent" : "19"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_532_32_1_1_U58", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_532_32_1_1_U59", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lev_retpipe_fifo_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lev_retpipe_6_fifo_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lev_retpipe_7_fifo_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lev_retpipe_8_fifo_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lev_retpipe_9_fifo_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lev_retpipe_10_fifo_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.childindexpipe_fifo_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.childindexpipe_6_fifo_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.childindexpipe_7_fifo_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.childindexpipe_8_fifo_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.childindexpipe_9_fifo_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.childindexpipe_10_fifo_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IDRpipes_fifo_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IDRpipes_6_fifo_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IDRpipes_7_fifo_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IDRpipes_8_fifo_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IDRpipes_9_fifo_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IDRpipes_10_fifo_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	subT1_pipl {
		IDRpipe1 {Type I LastRead 1 FirstWrite -1}
		Wsigpipe1161 {Type I LastRead 1 FirstWrite -1}
		OutTuppipe1 {Type O LastRead -1 FirstWrite 13}
		subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs {Type IO LastRead -1 FirstWrite -1}
		subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_5 {Type IO LastRead -1 FirstWrite -1}
		subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_1 {Type IO LastRead -1 FirstWrite -1}
		subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_6 {Type IO LastRead -1 FirstWrite -1}
		lev3_numc_V {Type I LastRead -1 FirstWrite -1}
		lev3_ucta_V {Type IO LastRead -1 FirstWrite -1}
		subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_2 {Type IO LastRead -1 FirstWrite -1}
		subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_7 {Type IO LastRead -1 FirstWrite -1}
		lev4_numc_V {Type I LastRead -1 FirstWrite -1}
		lev4_ucta_V {Type IO LastRead -1 FirstWrite -1}
		subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_3 {Type IO LastRead -1 FirstWrite -1}
		subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_8 {Type IO LastRead -1 FirstWrite -1}
		lev5_numc_V {Type I LastRead -1 FirstWrite -1}
		lev5_ucta_V {Type IO LastRead -1 FirstWrite -1}
		subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_4 {Type IO LastRead -1 FirstWrite -1}
		subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_9 {Type IO LastRead -1 FirstWrite -1}}
	subT1_lev_stage_4 {
		childindexpipe_0 {Type I LastRead 0 FirstWrite -1}
		childindexpipe_1 {Type O LastRead -1 FirstWrite 1}
		lev_retpipe_0 {Type I LastRead 0 FirstWrite -1}
		lev_retpipe_1 {Type O LastRead -1 FirstWrite 1}
		IDRpipes_0 {Type I LastRead 0 FirstWrite -1}
		IDRpipes_1 {Type O LastRead -1 FirstWrite 1}
		memoiz_array_par_ind {Type O LastRead -1 FirstWrite 0}
		memoiz_array_child_ind {Type O LastRead -1 FirstWrite 0}}
	subT1_lev_stage_3 {
		childindexpipe_0 {Type I LastRead 0 FirstWrite -1}
		childindexpipe_1 {Type O LastRead -1 FirstWrite 1}
		lev_retpipe_0 {Type I LastRead 0 FirstWrite -1}
		lev_retpipe_1 {Type O LastRead -1 FirstWrite 1}
		IDRpipes_0 {Type I LastRead 0 FirstWrite -1}
		IDRpipes_1 {Type O LastRead -1 FirstWrite 1}
		memoiz_array_par_ind {Type O LastRead -1 FirstWrite 0}
		memoiz_array_child_ind {Type O LastRead -1 FirstWrite 0}}
	subT1_lev_stage_2 {
		childindexpipe_0 {Type I LastRead 0 FirstWrite -1}
		childindexpipe_1 {Type O LastRead -1 FirstWrite 8}
		lev_retpipe_0 {Type I LastRead 0 FirstWrite -1}
		lev_retpipe_1 {Type O LastRead -1 FirstWrite 8}
		IDRpipes_0 {Type I LastRead 0 FirstWrite -1}
		IDRpipes_1 {Type O LastRead -1 FirstWrite 8}
		memoiz_array_par_ind {Type IO LastRead 2 FirstWrite 7}
		memoiz_array_child_ind {Type IO LastRead 2 FirstWrite 7}
		lev3_numc_V {Type I LastRead -1 FirstWrite -1}
		lev3_ucta_V {Type IO LastRead -1 FirstWrite -1}}
	subT1_lev_stage_1 {
		childindexpipe_0 {Type I LastRead 0 FirstWrite -1}
		childindexpipe_1 {Type O LastRead -1 FirstWrite 8}
		lev_retpipe_0 {Type I LastRead 0 FirstWrite -1}
		lev_retpipe_1 {Type O LastRead -1 FirstWrite 8}
		IDRpipes_0 {Type I LastRead 0 FirstWrite -1}
		IDRpipes_1 {Type O LastRead -1 FirstWrite 8}
		memoiz_array_par_ind {Type IO LastRead 2 FirstWrite 7}
		memoiz_array_child_ind {Type IO LastRead 2 FirstWrite 7}
		lev4_numc_V {Type I LastRead -1 FirstWrite -1}
		lev4_ucta_V {Type IO LastRead -1 FirstWrite -1}}
	subT1_lev_stage {
		childindexpipe_0 {Type I LastRead 0 FirstWrite -1}
		childindexpipe_1 {Type O LastRead -1 FirstWrite 8}
		lev_retpipe_0 {Type I LastRead 0 FirstWrite -1}
		lev_retpipe_1 {Type O LastRead -1 FirstWrite 8}
		IDRpipes_0 {Type I LastRead 0 FirstWrite -1}
		IDRpipes_1 {Type O LastRead -1 FirstWrite 8}
		memoiz_array_par_ind {Type IO LastRead 2 FirstWrite 7}
		memoiz_array_child_ind {Type IO LastRead 2 FirstWrite 7}
		lev5_numc_V {Type I LastRead -1 FirstWrite -1}
		lev5_ucta_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	IDRpipe1 { ap_fifo {  { IDRpipe1_dout fifo_data 0 52 }  { IDRpipe1_empty_n fifo_status 0 1 }  { IDRpipe1_read fifo_update 1 1 } } }
	Wsigpipe1161 { ap_fifo {  { Wsigpipe1161_dout fifo_data 0 1 }  { Wsigpipe1161_empty_n fifo_status 0 1 }  { Wsigpipe1161_read fifo_update 1 1 } } }
	OutTuppipe1 { ap_fifo {  { OutTuppipe1_din fifo_data 1 128 }  { OutTuppipe1_full_n fifo_status 0 1 }  { OutTuppipe1_write fifo_update 1 1 } } }
}
