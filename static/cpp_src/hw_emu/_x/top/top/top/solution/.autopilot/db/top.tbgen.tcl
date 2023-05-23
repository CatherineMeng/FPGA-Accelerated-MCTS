set moduleName top
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_chain
set isOneStateSeq 0
set ProfileFlag 1
set StallSigGenFlag 1
set isEnableWaveformDebug 1
set C_modelName {top}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem0 int 256 unused {axi_master 0}  }
	{ X_V_data_V int 24 regular {axi_s 0 volatile  { X Data } }  }
	{ X_V_keep_V int 3 regular {axi_s 0 volatile  { X Keep } }  }
	{ X_V_last_V int 1 regular {axi_s 0 volatile  { X Last } }  }
	{ ids_V_data_V int 32 regular {axi_s 0 volatile  { ids Data } }  }
	{ ids_V_keep_V int 4 regular {axi_s 0 volatile  { ids Keep } }  }
	{ ids_V_last_V int 1 regular {axi_s 0 volatile  { ids Last } }  }
	{ out_r int 128 regular {axi_s 1 volatile  { out_r Data } }  }
	{ adj_list int 64 unused {axi_slave 0}  }
	{ flushs int 32 unused {axi_slave 0}  }
	{ ap_local_deadlock int 1 unused {axi_slave 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "gmem0", "interface" : "axi_master", "bitwidth" : 256, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "adj_list","offset": { "type": "dynamic","port_name": "adj_list","bundle": "control"},}]}]} , 
 	{ "Name" : "X_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "X_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "X_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "ids_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ids_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "ids_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "out_r", "interface" : "axis", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "adj_list", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "flushs", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":35}} , 
 	{ "Name" : "ap_local_deadlock", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 1, "direction" : "WRITEONLY", "offset" : {"out":0}, "offset_end" : {"out":4294967295}} ]}
# RTL Port declarations: 
set portNum 87
set portList { 
	{ ap_local_block sc_out sc_logic 1 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ event_done sc_out sc_logic 1 signal -1 } 
	{ m_axi_gmem0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WDATA sc_out sc_lv 256 signal 0 } 
	{ m_axi_gmem0_WSTRB sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RDATA sc_in sc_lv 256 signal 0 } 
	{ m_axi_gmem0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_BUSER sc_in sc_lv 1 signal 0 } 
	{ X_TDATA sc_in sc_lv 24 signal 1 } 
	{ X_TVALID sc_in sc_logic 1 invld 3 } 
	{ X_TREADY sc_out sc_logic 1 inacc 3 } 
	{ X_TKEEP sc_in sc_lv 3 signal 2 } 
	{ X_TLAST sc_in sc_lv 1 signal 3 } 
	{ ids_TDATA sc_in sc_lv 32 signal 4 } 
	{ ids_TVALID sc_in sc_logic 1 invld 6 } 
	{ ids_TREADY sc_out sc_logic 1 inacc 6 } 
	{ ids_TKEEP sc_in sc_lv 4 signal 5 } 
	{ ids_TLAST sc_in sc_lv 1 signal 6 } 
	{ out_r_TDATA sc_out sc_lv 128 signal 7 } 
	{ out_r_TVALID sc_out sc_logic 1 outvld 7 } 
	{ out_r_TREADY sc_in sc_logic 1 outacc 7 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ event_start sc_out sc_logic 1 signal -1 } 
	{ stall_start_ext sc_out sc_logic 1 signal -1 } 
	{ stall_done_ext sc_out sc_logic 1 signal -1 } 
	{ stall_start_str sc_out sc_logic 1 signal -1 } 
	{ stall_done_str sc_out sc_logic 1 signal -1 } 
	{ stall_start_int sc_out sc_logic 1 signal -1 } 
	{ stall_done_int sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"top","role":"start","value":"0","valid_bit":"0"},{"name":"top","role":"continue","value":"0","valid_bit":"4"},{"name":"top","role":"auto_start","value":"0","valid_bit":"7"},{"name":"adj_list","role":"data","value":"16"},{"name":"flushs","role":"data","value":"28"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"top","role":"start","value":"0","valid_bit":"0"},{"name":"top","role":"done","value":"0","valid_bit":"1"},{"name":"top","role":"idle","value":"0","valid_bit":"2"},{"name":"top","role":"ready","value":"0","valid_bit":"3"},{"name":"top","role":"auto_start","value":"0","valid_bit":"7"},{"name":"ap_local_deadlock","role":"data","value":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_local_block", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_block", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "event_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "event_done", "role": "default" }} , 
 	{ "name": "m_axi_gmem0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "gmem0", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WID" }} , 
 	{ "name": "m_axi_gmem0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "gmem0", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RID" }} , 
 	{ "name": "m_axi_gmem0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BID" }} , 
 	{ "name": "m_axi_gmem0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BUSER" }} , 
 	{ "name": "X_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "X_V_data_V", "role": "default" }} , 
 	{ "name": "X_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "X_V_last_V", "role": "default" }} , 
 	{ "name": "X_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "X_V_last_V", "role": "default" }} , 
 	{ "name": "X_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "X_V_keep_V", "role": "default" }} , 
 	{ "name": "X_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "X_V_last_V", "role": "default" }} , 
 	{ "name": "ids_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ids_V_data_V", "role": "default" }} , 
 	{ "name": "ids_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "ids_V_last_V", "role": "default" }} , 
 	{ "name": "ids_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "ids_V_last_V", "role": "default" }} , 
 	{ "name": "ids_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "ids_V_keep_V", "role": "default" }} , 
 	{ "name": "ids_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ids_V_last_V", "role": "default" }} , 
 	{ "name": "out_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "out_r", "role": "TDATA" }} , 
 	{ "name": "out_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_r", "role": "TVALID" }} , 
 	{ "name": "out_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_r", "role": "TREADY" }} , 
 	{ "name": "event_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "event_start", "role": "default" }} , 
 	{ "name": "stall_start_ext", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_start_ext", "role": "default" }} , 
 	{ "name": "stall_done_ext", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_done_ext", "role": "default" }} , 
 	{ "name": "stall_start_str", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_start_str", "role": "default" }} , 
 	{ "name": "stall_done_str", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_done_str", "role": "default" }} , 
 	{ "name": "stall_start_int", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_start_int", "role": "default" }} , 
 	{ "name": "stall_done_int", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_done_int", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "4", "6", "48", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69"],
		"CDFG" : "top",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
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
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I"},
			{"Name" : "X_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "X_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "X_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "X_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "ids_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "ids_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ids_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "ids_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "out_r", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "48", "SubInstance" : "grp_top_Pipeline_VITIS_LOOP_199_1_fu_351", "Port" : "out_r", "Inst_start_state" : "14", "Inst_end_state" : "15"}]},
			{"Name" : "adj_list", "Type" : "None", "Direction" : "I"},
			{"Name" : "flushs", "Type" : "None", "Direction" : "I"},
			{"Name" : "root_numv_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "root_numv_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "root_numv_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_5", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_1", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_6", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "lev3_numc_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "lev3_numc_V", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "lev3_ucta_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "lev3_ucta_V", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_2", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_7", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "lev4_numc_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "lev4_numc_V", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "lev4_ucta_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "lev4_ucta_V", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_3", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_8", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "lev5_numc_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "lev5_numc_V", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "lev5_ucta_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "lev5_ucta_V", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_4", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_subT1_pipl_fu_312", "Port" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_9", "Inst_start_state" : "12", "Inst_end_state" : "13"}]},
			{"Name" : "ap_local_deadlock", "Type" : "None", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_95_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "16", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state15"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state16"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_top_Pipeline_Loop_children_fu_295", "Parent" : "0", "Child" : ["2", "3"],
		"CDFG" : "top_Pipeline_Loop_children",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "root_numv_0_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "root_numv_1_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "root_numv_2_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "max_child_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop_children", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_top_Pipeline_Loop_children_fu_295.mux_32_20_1_1_U1", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_top_Pipeline_Loop_children_fu_295.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_top_Pipeline_VITIS_LOOP_154_1_fu_303", "Parent" : "0", "Child" : ["5"],
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
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_top_Pipeline_VITIS_LOOP_154_1_fu_303.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312", "Parent" : "0", "Child" : ["7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "22", "25", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47"],
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
					{"ID" : "17", "SubInstance" : "grp_subT1_lev_stage_4_fu_422", "Port" : "memoiz_array_par_ind", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_subT1_lev_stage_4_fu_422", "Port" : "memoiz_array_child_ind", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_subT1_lev_stage_3_fu_436", "Port" : "memoiz_array_par_ind", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_subT1_lev_stage_3_fu_436", "Port" : "memoiz_array_child_ind", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "lev3_numc_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_subT1_lev_stage_2_fu_450", "Port" : "lev3_numc_V", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "lev3_ucta_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_subT1_lev_stage_2_fu_450", "Port" : "lev3_ucta_V", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_subT1_lev_stage_2_fu_450", "Port" : "memoiz_array_par_ind", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_subT1_lev_stage_2_fu_450", "Port" : "memoiz_array_child_ind", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "lev4_numc_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_subT1_lev_stage_1_fu_468", "Port" : "lev4_numc_V", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "lev4_ucta_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_subT1_lev_stage_1_fu_468", "Port" : "lev4_ucta_V", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_subT1_lev_stage_1_fu_468", "Port" : "memoiz_array_par_ind", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_subT1_lev_stage_1_fu_468", "Port" : "memoiz_array_child_ind", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "lev5_numc_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_subT1_lev_stage_fu_486", "Port" : "lev5_numc_V", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "lev5_ucta_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_subT1_lev_stage_fu_486", "Port" : "lev5_ucta_V", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_subT1_lev_stage_fu_486", "Port" : "memoiz_array_par_ind", "Inst_start_state" : "11", "Inst_end_state" : "12"}]},
			{"Name" : "subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_9", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_subT1_lev_stage_fu_486", "Port" : "memoiz_array_child_ind", "Inst_start_state" : "11", "Inst_end_state" : "12"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_304_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state14"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_5_U", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_1_U", "Parent" : "6"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_6_U", "Parent" : "6"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_2_U", "Parent" : "6"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_7_U", "Parent" : "6"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_3_U", "Parent" : "6"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_8_U", "Parent" : "6"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_4_U", "Parent" : "6"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_9_U", "Parent" : "6"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.grp_subT1_lev_stage_4_fu_422", "Parent" : "6",
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
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.grp_subT1_lev_stage_3_fu_436", "Parent" : "6",
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
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.grp_subT1_lev_stage_2_fu_450", "Parent" : "6", "Child" : ["20", "21"],
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
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.grp_subT1_lev_stage_2_fu_450.lev3_numc_V_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.grp_subT1_lev_stage_2_fu_450.lev3_ucta_V_U", "Parent" : "19"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.grp_subT1_lev_stage_1_fu_468", "Parent" : "6", "Child" : ["23", "24"],
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
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.grp_subT1_lev_stage_1_fu_468.lev4_numc_V_U", "Parent" : "22"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.grp_subT1_lev_stage_1_fu_468.lev4_ucta_V_U", "Parent" : "22"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.grp_subT1_lev_stage_fu_486", "Parent" : "6", "Child" : ["26", "27"],
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
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.grp_subT1_lev_stage_fu_486.lev5_numc_V_U", "Parent" : "25"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.grp_subT1_lev_stage_fu_486.lev5_ucta_V_U", "Parent" : "25"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.mux_532_32_1_1_U58", "Parent" : "6"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.mux_532_32_1_1_U59", "Parent" : "6"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.lev_retpipe_fifo_U", "Parent" : "6"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.lev_retpipe_6_fifo_U", "Parent" : "6"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.lev_retpipe_7_fifo_U", "Parent" : "6"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.lev_retpipe_8_fifo_U", "Parent" : "6"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.lev_retpipe_9_fifo_U", "Parent" : "6"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.lev_retpipe_10_fifo_U", "Parent" : "6"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.childindexpipe_fifo_U", "Parent" : "6"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.childindexpipe_6_fifo_U", "Parent" : "6"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.childindexpipe_7_fifo_U", "Parent" : "6"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.childindexpipe_8_fifo_U", "Parent" : "6"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.childindexpipe_9_fifo_U", "Parent" : "6"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.childindexpipe_10_fifo_U", "Parent" : "6"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.IDRpipes_fifo_U", "Parent" : "6"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.IDRpipes_6_fifo_U", "Parent" : "6"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.IDRpipes_7_fifo_U", "Parent" : "6"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.IDRpipes_8_fifo_U", "Parent" : "6"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.IDRpipes_9_fifo_U", "Parent" : "6"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_subT1_pipl_fu_312.IDRpipes_10_fifo_U", "Parent" : "6"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_top_Pipeline_VITIS_LOOP_199_1_fu_351", "Parent" : "0", "Child" : ["49"],
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
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_top_Pipeline_VITIS_LOOP_199_1_fu_351.flow_control_loop_pipe_sequential_init_U", "Parent" : "48"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_32_20_1_1_U88", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.xbarpipe_fifo_U", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.xbarIDRpipe_fifo_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IDRpipe1_fifo_U", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IDRpipe2_fifo_U", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IDRpipe3_fifo_U", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Wsigpipe1_fifo_U", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Wsigpipe2_fifo_U", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Wsigpipe3_fifo_U", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.OutTuppipe1_fifo_U", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.OutTuppipe2_fifo_U", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.OutTuppipe3_fifo_U", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_X_V_data_V_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_X_V_keep_V_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_X_V_last_V_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_ids_V_data_V_U", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_ids_V_keep_V_U", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_ids_V_last_V_U", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_r_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	top {
		gmem0 {Type I LastRead -1 FirstWrite -1}
		X_V_data_V {Type I LastRead 1 FirstWrite -1}
		X_V_keep_V {Type I LastRead 1 FirstWrite -1}
		X_V_last_V {Type I LastRead 1 FirstWrite -1}
		ids_V_data_V {Type I LastRead 1 FirstWrite -1}
		ids_V_keep_V {Type I LastRead 1 FirstWrite -1}
		ids_V_last_V {Type I LastRead 1 FirstWrite -1}
		out_r {Type O LastRead -1 FirstWrite 1}
		adj_list {Type I LastRead -1 FirstWrite -1}
		flushs {Type I LastRead -1 FirstWrite -1}
		root_numv_0 {Type IO LastRead -1 FirstWrite -1}
		root_numv_1 {Type IO LastRead -1 FirstWrite -1}
		root_numv_2 {Type IO LastRead -1 FirstWrite -1}
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
		subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupleOut_0_int_memoizlevs_9 {Type IO LastRead -1 FirstWrite -1}
		ap_local_deadlock {Type O LastRead -1 FirstWrite -1}}
	top_Pipeline_Loop_children {
		root_numv_0_load_1 {Type I LastRead 0 FirstWrite -1}
		root_numv_1_load_1 {Type I LastRead 0 FirstWrite -1}
		root_numv_2_load_1 {Type I LastRead 0 FirstWrite -1}
		max_child_out {Type O LastRead -1 FirstWrite 1}}
	top_Pipeline_VITIS_LOOP_154_1 {
		xbarIDRpipe {Type I LastRead 1 FirstWrite -1}
		IDRpipe1 {Type O LastRead -1 FirstWrite 2}
		xbarpipe {Type I LastRead 1 FirstWrite -1}
		IDRpipe2 {Type O LastRead -1 FirstWrite 2}
		IDRpipe3 {Type O LastRead -1 FirstWrite 2}}
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
		lev5_ucta_V {Type IO LastRead -1 FirstWrite -1}}
	top_Pipeline_VITIS_LOOP_199_1 {
		OutTuppipe1 {Type I LastRead 2 FirstWrite -1}
		OutTuppipe3 {Type I LastRead 2 FirstWrite -1}
		OutTuppipe2 {Type I LastRead 2 FirstWrite -1}
		out_r {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	gmem0 { m_axi {  { m_axi_gmem0_AWVALID VALID 1 1 }  { m_axi_gmem0_AWREADY READY 0 1 }  { m_axi_gmem0_AWADDR ADDR 1 64 }  { m_axi_gmem0_AWID ID 1 1 }  { m_axi_gmem0_AWLEN SIZE 1 8 }  { m_axi_gmem0_AWSIZE BURST 1 3 }  { m_axi_gmem0_AWBURST LOCK 1 2 }  { m_axi_gmem0_AWLOCK CACHE 1 2 }  { m_axi_gmem0_AWCACHE PROT 1 4 }  { m_axi_gmem0_AWPROT QOS 1 3 }  { m_axi_gmem0_AWQOS REGION 1 4 }  { m_axi_gmem0_AWREGION USER 1 4 }  { m_axi_gmem0_AWUSER DATA 1 1 }  { m_axi_gmem0_WVALID VALID 1 1 }  { m_axi_gmem0_WREADY READY 0 1 }  { m_axi_gmem0_WDATA FIFONUM 1 256 }  { m_axi_gmem0_WSTRB STRB 1 32 }  { m_axi_gmem0_WLAST LAST 1 1 }  { m_axi_gmem0_WID ID 1 1 }  { m_axi_gmem0_WUSER DATA 1 1 }  { m_axi_gmem0_ARVALID VALID 1 1 }  { m_axi_gmem0_ARREADY READY 0 1 }  { m_axi_gmem0_ARADDR ADDR 1 64 }  { m_axi_gmem0_ARID ID 1 1 }  { m_axi_gmem0_ARLEN SIZE 1 8 }  { m_axi_gmem0_ARSIZE BURST 1 3 }  { m_axi_gmem0_ARBURST LOCK 1 2 }  { m_axi_gmem0_ARLOCK CACHE 1 2 }  { m_axi_gmem0_ARCACHE PROT 1 4 }  { m_axi_gmem0_ARPROT QOS 1 3 }  { m_axi_gmem0_ARQOS REGION 1 4 }  { m_axi_gmem0_ARREGION USER 1 4 }  { m_axi_gmem0_ARUSER DATA 1 1 }  { m_axi_gmem0_RVALID VALID 0 1 }  { m_axi_gmem0_RREADY READY 1 1 }  { m_axi_gmem0_RDATA FIFONUM 0 256 }  { m_axi_gmem0_RLAST LAST 0 1 }  { m_axi_gmem0_RID ID 0 1 }  { m_axi_gmem0_RUSER DATA 0 1 }  { m_axi_gmem0_RRESP RESP 0 2 }  { m_axi_gmem0_BVALID VALID 0 1 }  { m_axi_gmem0_BREADY READY 1 1 }  { m_axi_gmem0_BRESP RESP 0 2 }  { m_axi_gmem0_BID ID 0 1 }  { m_axi_gmem0_BUSER DATA 0 1 } } }
	X_V_data_V { axis {  { X_TDATA in_data 0 24 } } }
	X_V_keep_V { axis {  { X_TKEEP in_data 0 3 } } }
	X_V_last_V { axis {  { X_TVALID in_vld 0 1 }  { X_TREADY in_acc 1 1 }  { X_TLAST in_data 0 1 } } }
	ids_V_data_V { axis {  { ids_TDATA in_data 0 32 } } }
	ids_V_keep_V { axis {  { ids_TKEEP in_data 0 4 } } }
	ids_V_last_V { axis {  { ids_TVALID in_vld 0 1 }  { ids_TREADY in_acc 1 1 }  { ids_TLAST in_data 0 1 } } }
	out_r { axis {  { out_r_TDATA out_data 1 128 }  { out_r_TVALID out_vld 1 1 }  { out_r_TREADY out_acc 0 1 } } }
}

set busDeadlockParameterList { 
	{ gmem0 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ gmem0 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ gmem0 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
