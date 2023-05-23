set SynModuleInfo {
  {SRCNAME top_Pipeline_Loop_children MODELNAME top_Pipeline_Loop_children RTLNAME top_top_Pipeline_Loop_children
    SUBMODULES {
      {MODELNAME top_mux_32_20_1_1 RTLNAME top_mux_32_20_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME top_flow_control_loop_pipe_sequential_init RTLNAME top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME top_Pipeline_VITIS_LOOP_154_1 MODELNAME top_Pipeline_VITIS_LOOP_154_1 RTLNAME top_top_Pipeline_VITIS_LOOP_154_1}
  {SRCNAME subT1_lev_stage.4 MODELNAME subT1_lev_stage_4 RTLNAME top_subT1_lev_stage_4}
  {SRCNAME subT1_lev_stage.3 MODELNAME subT1_lev_stage_3 RTLNAME top_subT1_lev_stage_3}
  {SRCNAME subT1_lev_stage.2 MODELNAME subT1_lev_stage_2 RTLNAME top_subT1_lev_stage_2
    SUBMODULES {
      {MODELNAME top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W RTLNAME top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W BINDTYPE storage TYPE ram_1p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_subT1_lev_stage_2_lev3_ucta_V_RAM_1P_URAM_1R1W RTLNAME top_subT1_lev_stage_2_lev3_ucta_V_RAM_1P_URAM_1R1W BINDTYPE storage TYPE ram_1p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME subT1_lev_stage.1 MODELNAME subT1_lev_stage_1 RTLNAME top_subT1_lev_stage_1
    SUBMODULES {
      {MODELNAME top_subT1_lev_stage_1_lev4_numc_V_RAM_1P_URAM_1R1W RTLNAME top_subT1_lev_stage_1_lev4_numc_V_RAM_1P_URAM_1R1W BINDTYPE storage TYPE ram_1p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_subT1_lev_stage_1_lev4_ucta_V_RAM_1P_URAM_1R1W RTLNAME top_subT1_lev_stage_1_lev4_ucta_V_RAM_1P_URAM_1R1W BINDTYPE storage TYPE ram_1p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME subT1_lev_stage MODELNAME subT1_lev_stage RTLNAME top_subT1_lev_stage
    SUBMODULES {
      {MODELNAME top_subT1_lev_stage_lev5_numc_V_RAM_1P_URAM_1R1W RTLNAME top_subT1_lev_stage_lev5_numc_V_RAM_1P_URAM_1R1W BINDTYPE storage TYPE ram_1p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_subT1_lev_stage_lev5_ucta_V_RAM_1P_URAM_1R1W RTLNAME top_subT1_lev_stage_lev5_ucta_V_RAM_1P_URAM_1R1W BINDTYPE storage TYPE ram_1p IMPL uram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME subT1_pipl MODELNAME subT1_pipl RTLNAME top_subT1_pipl
    SUBMODULES {
      {MODELNAME top_mux_532_32_1_1 RTLNAME top_mux_532_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME top_subT1_pipl_subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupbkb RTLNAME top_subT1_pipl_subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupbkb BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_subT1_pipl_subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupcud RTLNAME top_subT1_pipl_subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupcud BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME top_fifo_w1_d1_S RTLNAME top_fifo_w1_d1_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME top_fifo_w64_d1_S RTLNAME top_fifo_w64_d1_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
    }
  }
  {SRCNAME top_Pipeline_VITIS_LOOP_199_1 MODELNAME top_Pipeline_VITIS_LOOP_199_1 RTLNAME top_top_Pipeline_VITIS_LOOP_199_1}
  {SRCNAME top MODELNAME top RTLNAME top IS_TOP 1
    SUBMODULES {
      {MODELNAME top_fifo_w3_d1_S RTLNAME top_fifo_w3_d1_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME top_fifo_w52_d1_S RTLNAME top_fifo_w52_d1_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME top_fifo_w52_d32_S RTLNAME top_fifo_w52_d32_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME top_fifo_w1_d1_S_x RTLNAME top_fifo_w1_d1_S_x BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME top_fifo_w128_d32_S RTLNAME top_fifo_w128_d32_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME top_control_s_axi RTLNAME top_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME top_regslice_both RTLNAME top_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME top_regslice_both_U}
    }
  }
}
