# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 26 \
    name memoiz_array_par_ind \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename memoiz_array_par_ind \
    op interface \
    ports { memoiz_array_par_ind_address0 { O 5 vector } memoiz_array_par_ind_ce0 { O 1 bit } memoiz_array_par_ind_we0 { O 1 bit } memoiz_array_par_ind_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'memoiz_array_par_ind'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 27 \
    name memoiz_array_child_ind \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename memoiz_array_child_ind \
    op interface \
    ports { memoiz_array_child_ind_address0 { O 5 vector } memoiz_array_child_ind_ce0 { O 1 bit } memoiz_array_child_ind_we0 { O 1 bit } memoiz_array_child_ind_d0 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'memoiz_array_child_ind'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name childindexpipe_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_childindexpipe_0 \
    op interface \
    ports { childindexpipe_0_dout { I 64 vector } childindexpipe_0_empty_n { I 1 bit } childindexpipe_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name childindexpipe_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_childindexpipe_1 \
    op interface \
    ports { childindexpipe_1_din { O 64 vector } childindexpipe_1_full_n { I 1 bit } childindexpipe_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name lev_retpipe_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_lev_retpipe_0 \
    op interface \
    ports { lev_retpipe_0_dout { I 1 vector } lev_retpipe_0_empty_n { I 1 bit } lev_retpipe_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name lev_retpipe_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lev_retpipe_1 \
    op interface \
    ports { lev_retpipe_1_din { O 1 vector } lev_retpipe_1_full_n { I 1 bit } lev_retpipe_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name IDRpipes_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_IDRpipes_0 \
    op interface \
    ports { IDRpipes_0_dout { I 64 vector } IDRpipes_0_empty_n { I 1 bit } IDRpipes_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name IDRpipes_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_IDRpipes_1 \
    op interface \
    ports { IDRpipes_1_din { O 64 vector } IDRpipes_1_full_n { I 1 bit } IDRpipes_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


