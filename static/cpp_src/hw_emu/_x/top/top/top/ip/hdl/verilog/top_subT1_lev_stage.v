// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module top_subT1_lev_stage (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        childindexpipe_0_dout,
        childindexpipe_0_empty_n,
        childindexpipe_0_read,
        childindexpipe_1_din,
        childindexpipe_1_full_n,
        childindexpipe_1_write,
        lev_retpipe_0_dout,
        lev_retpipe_0_empty_n,
        lev_retpipe_0_read,
        lev_retpipe_1_din,
        lev_retpipe_1_full_n,
        lev_retpipe_1_write,
        IDRpipes_0_dout,
        IDRpipes_0_empty_n,
        IDRpipes_0_read,
        IDRpipes_1_din,
        IDRpipes_1_full_n,
        IDRpipes_1_write,
        memoiz_array_par_ind_address0,
        memoiz_array_par_ind_ce0,
        memoiz_array_par_ind_we0,
        memoiz_array_par_ind_d0,
        memoiz_array_par_ind_q0,
        memoiz_array_child_ind_address0,
        memoiz_array_child_ind_ce0,
        memoiz_array_child_ind_we0,
        memoiz_array_child_ind_d0,
        memoiz_array_child_ind_q0,
        ap_ext_blocking_n,
        ap_str_blocking_n,
        ap_int_blocking_n
);

parameter    ap_ST_fsm_state1 = 10'd1;
parameter    ap_ST_fsm_state2 = 10'd2;
parameter    ap_ST_fsm_state3 = 10'd4;
parameter    ap_ST_fsm_state4 = 10'd8;
parameter    ap_ST_fsm_state5 = 10'd16;
parameter    ap_ST_fsm_state6 = 10'd32;
parameter    ap_ST_fsm_state7 = 10'd64;
parameter    ap_ST_fsm_state8 = 10'd128;
parameter    ap_ST_fsm_state9 = 10'd256;
parameter    ap_ST_fsm_state10 = 10'd512;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [63:0] childindexpipe_0_dout;
input   childindexpipe_0_empty_n;
output   childindexpipe_0_read;
output  [63:0] childindexpipe_1_din;
input   childindexpipe_1_full_n;
output   childindexpipe_1_write;
input  [0:0] lev_retpipe_0_dout;
input   lev_retpipe_0_empty_n;
output   lev_retpipe_0_read;
output  [0:0] lev_retpipe_1_din;
input   lev_retpipe_1_full_n;
output   lev_retpipe_1_write;
input  [63:0] IDRpipes_0_dout;
input   IDRpipes_0_empty_n;
output   IDRpipes_0_read;
output  [63:0] IDRpipes_1_din;
input   IDRpipes_1_full_n;
output   IDRpipes_1_write;
output  [4:0] memoiz_array_par_ind_address0;
output   memoiz_array_par_ind_ce0;
output   memoiz_array_par_ind_we0;
output  [31:0] memoiz_array_par_ind_d0;
input  [31:0] memoiz_array_par_ind_q0;
output  [4:0] memoiz_array_child_ind_address0;
output   memoiz_array_child_ind_ce0;
output   memoiz_array_child_ind_we0;
output  [0:0] memoiz_array_child_ind_d0;
input  [0:0] memoiz_array_child_ind_q0;
output   ap_ext_blocking_n;
output   ap_str_blocking_n;
output   ap_int_blocking_n;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg childindexpipe_0_read;
reg childindexpipe_1_write;
reg lev_retpipe_0_read;
reg lev_retpipe_1_write;
reg IDRpipes_0_read;
reg IDRpipes_1_write;
reg[4:0] memoiz_array_par_ind_address0;
reg memoiz_array_par_ind_ce0;
reg memoiz_array_par_ind_we0;
reg[4:0] memoiz_array_child_ind_address0;
reg memoiz_array_child_ind_ce0;
reg memoiz_array_child_ind_we0;

(* fsm_encoding = "none" *) reg   [9:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [6:0] lev5_numc_V_address0;
reg    lev5_numc_V_ce0;
wire   [0:0] lev5_numc_V_q0;
reg   [7:0] lev5_ucta_V_address0;
reg    lev5_ucta_V_ce0;
reg    lev5_ucta_V_we0;
wire   [19:0] lev5_ucta_V_q0;
reg    childindexpipe_0_blk_n;
reg    childindexpipe_1_blk_n;
wire    ap_CS_fsm_state10;
reg    lev_retpipe_0_blk_n;
reg    lev_retpipe_1_blk_n;
reg    IDRpipes_0_blk_n;
reg    IDRpipes_1_blk_n;
reg   [63:0] childindexpipe_0_read_reg_347;
wire   [31:0] pipeobj_depth_fu_199_p1;
reg   [31:0] pipeobj_depth_reg_352;
reg   [31:0] pipeobj_ind_reg_357;
reg   [0:0] ret_signal_V_reg_365;
reg   [63:0] IDRpipes_0_read_reg_369;
wire   [4:0] IDR_wind_fu_213_p1;
reg   [4:0] IDR_wind_reg_374;
reg   [19:0] tmp_new_rewd_V_reg_379;
wire    ap_CS_fsm_state2;
reg   [0:0] parnode_numc_V_reg_389;
wire    ap_CS_fsm_state3;
reg   [4:0] memoiz_array_par_ind_addr_reg_395;
reg   [4:0] memoiz_array_child_ind_addr_reg_400;
reg   [0:0] mobj_child_ind_reg_405;
wire    ap_CS_fsm_state4;
wire   [7:0] sub_ln712_fu_257_p2;
reg   [7:0] sub_ln712_reg_410;
wire   [0:0] icmp_ln395_fu_263_p2;
reg   [0:0] icmp_ln395_reg_420;
wire   [0:0] and_ln395_fu_269_p2;
reg   [0:0] and_ln395_reg_425;
wire    ap_CS_fsm_state5;
reg   [7:0] lev5_ucta_V_addr_reg_429;
reg   [19:0] lev5_ucta_V_load_reg_434;
wire    ap_CS_fsm_state6;
wire   [19:0] add_ln712_fu_287_p2;
reg   [19:0] add_ln712_reg_439;
wire    ap_CS_fsm_state7;
wire   [31:0] newind_13_fu_311_p2;
wire    ap_CS_fsm_state8;
wire   [31:0] newind_fu_333_p2;
wire    ap_CS_fsm_state9;
reg   [31:0] newind_15_reg_181;
wire   [63:0] zext_ln379_fu_227_p1;
wire   [63:0] zext_ln390_fu_231_p1;
wire   [63:0] zext_ln395_fu_236_p1;
wire   [63:0] zext_ln712_3_fu_282_p1;
reg    ap_block_state1;
reg    ap_block_state10;
wire   [5:0] trunc_ln712_3_fu_245_p1;
wire   [7:0] tmp_13_cast_fu_249_p3;
wire   [7:0] trunc_ln712_fu_241_p1;
wire   [7:0] zext_ln712_fu_274_p1;
wire   [7:0] add_ln712_3_fu_277_p2;
wire   [29:0] grp_fu_190_p4;
wire   [31:0] and_ln5_fu_291_p3;
wire   [31:0] sub_ln413_fu_299_p2;
wire   [31:0] select_ln413_fu_304_p3;
wire   [31:0] and_ln_fu_317_p3;
wire   [31:0] sub_ln435_fu_325_p2;
wire   [31:0] zext_ln435_fu_330_p1;
reg   [9:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
wire    ap_int_blocking_cur_n;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 10'd1;
end

top_subT1_lev_stage_lev5_numc_V_RAM_1P_URAM_1R1W #(
    .DataWidth( 1 ),
    .AddressRange( 81 ),
    .AddressWidth( 7 ))
lev5_numc_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(lev5_numc_V_address0),
    .ce0(lev5_numc_V_ce0),
    .q0(lev5_numc_V_q0)
);

top_subT1_lev_stage_lev5_ucta_V_RAM_1P_URAM_1R1W #(
    .DataWidth( 20 ),
    .AddressRange( 243 ),
    .AddressWidth( 8 ))
lev5_ucta_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(lev5_ucta_V_address0),
    .ce0(lev5_ucta_V_ce0),
    .we0(lev5_ucta_V_we0),
    .d0(add_ln712_reg_439),
    .q0(lev5_ucta_V_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        newind_15_reg_181 <= newind_fu_333_p2;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        newind_15_reg_181 <= newind_13_fu_311_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        IDR_wind_reg_374 <= IDR_wind_fu_213_p1;
        IDRpipes_0_read_reg_369 <= IDRpipes_0_dout;
        childindexpipe_0_read_reg_347 <= childindexpipe_0_dout;
        pipeobj_depth_reg_352 <= pipeobj_depth_fu_199_p1;
        pipeobj_ind_reg_357 <= {{childindexpipe_0_dout[63:32]}};
        ret_signal_V_reg_365 <= lev_retpipe_0_dout;
        tmp_new_rewd_V_reg_379 <= {{IDRpipes_0_dout[51:32]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        add_ln712_reg_439 <= add_ln712_fu_287_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        and_ln395_reg_425 <= and_ln395_fu_269_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        icmp_ln395_reg_420 <= icmp_ln395_fu_263_p2;
        mobj_child_ind_reg_405 <= memoiz_array_child_ind_q0;
        sub_ln712_reg_410 <= sub_ln712_fu_257_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state5) & (1'd1 == and_ln395_fu_269_p2))) begin
        lev5_ucta_V_addr_reg_429 <= zext_ln712_3_fu_282_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        lev5_ucta_V_load_reg_434 <= lev5_ucta_V_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state3) & (ret_signal_V_reg_365 == 1'd0))) begin
        memoiz_array_child_ind_addr_reg_400 <= zext_ln390_fu_231_p1;
        memoiz_array_par_ind_addr_reg_395 <= zext_ln390_fu_231_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        parnode_numc_V_reg_389 <= lev5_numc_V_q0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        IDRpipes_0_blk_n = IDRpipes_0_empty_n;
    end else begin
        IDRpipes_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((lev_retpipe_0_empty_n == 1'b0) | (childindexpipe_0_empty_n == 1'b0) | (1'b0 == IDRpipes_0_empty_n) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        IDRpipes_0_read = 1'b1;
    end else begin
        IDRpipes_0_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        IDRpipes_1_blk_n = IDRpipes_1_full_n;
    end else begin
        IDRpipes_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((lev_retpipe_1_full_n == 1'b0) | (childindexpipe_1_full_n == 1'b0) | (1'b0 == IDRpipes_1_full_n)) & (1'b1 == ap_CS_fsm_state10))) begin
        IDRpipes_1_write = 1'b1;
    end else begin
        IDRpipes_1_write = 1'b0;
    end
end

always @ (*) begin
    if (((lev_retpipe_1_full_n == 1'b0) | (childindexpipe_1_full_n == 1'b0) | (1'b0 == IDRpipes_1_full_n))) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

always @ (*) begin
    if (((lev_retpipe_0_empty_n == 1'b0) | (childindexpipe_0_empty_n == 1'b0) | (1'b0 == IDRpipes_0_empty_n) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) | (~((lev_retpipe_1_full_n == 1'b0) | (childindexpipe_1_full_n == 1'b0) | (1'b0 == IDRpipes_1_full_n)) & (1'b1 == ap_CS_fsm_state10)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((lev_retpipe_1_full_n == 1'b0) | (childindexpipe_1_full_n == 1'b0) | (1'b0 == IDRpipes_1_full_n)) & (1'b1 == ap_CS_fsm_state10))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        childindexpipe_0_blk_n = childindexpipe_0_empty_n;
    end else begin
        childindexpipe_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((lev_retpipe_0_empty_n == 1'b0) | (childindexpipe_0_empty_n == 1'b0) | (1'b0 == IDRpipes_0_empty_n) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        childindexpipe_0_read = 1'b1;
    end else begin
        childindexpipe_0_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        childindexpipe_1_blk_n = childindexpipe_1_full_n;
    end else begin
        childindexpipe_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((lev_retpipe_1_full_n == 1'b0) | (childindexpipe_1_full_n == 1'b0) | (1'b0 == IDRpipes_1_full_n)) & (1'b1 == ap_CS_fsm_state10))) begin
        childindexpipe_1_write = 1'b1;
    end else begin
        childindexpipe_1_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        lev5_numc_V_address0 = zext_ln395_fu_236_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        lev5_numc_V_address0 = zext_ln379_fu_227_p1;
    end else begin
        lev5_numc_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state2))) begin
        lev5_numc_V_ce0 = 1'b1;
    end else begin
        lev5_numc_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        lev5_ucta_V_address0 = lev5_ucta_V_addr_reg_429;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        lev5_ucta_V_address0 = zext_ln712_3_fu_282_p1;
    end else begin
        lev5_ucta_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state5))) begin
        lev5_ucta_V_ce0 = 1'b1;
    end else begin
        lev5_ucta_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (1'd1 == and_ln395_reg_425))) begin
        lev5_ucta_V_we0 = 1'b1;
    end else begin
        lev5_ucta_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        lev_retpipe_0_blk_n = lev_retpipe_0_empty_n;
    end else begin
        lev_retpipe_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((lev_retpipe_0_empty_n == 1'b0) | (childindexpipe_0_empty_n == 1'b0) | (1'b0 == IDRpipes_0_empty_n) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        lev_retpipe_0_read = 1'b1;
    end else begin
        lev_retpipe_0_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        lev_retpipe_1_blk_n = lev_retpipe_1_full_n;
    end else begin
        lev_retpipe_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((lev_retpipe_1_full_n == 1'b0) | (childindexpipe_1_full_n == 1'b0) | (1'b0 == IDRpipes_1_full_n)) & (1'b1 == ap_CS_fsm_state10))) begin
        lev_retpipe_1_write = 1'b1;
    end else begin
        lev_retpipe_1_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        memoiz_array_child_ind_address0 = memoiz_array_child_ind_addr_reg_400;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        memoiz_array_child_ind_address0 = zext_ln390_fu_231_p1;
    end else begin
        memoiz_array_child_ind_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state3))) begin
        memoiz_array_child_ind_ce0 = 1'b1;
    end else begin
        memoiz_array_child_ind_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        memoiz_array_child_ind_we0 = 1'b1;
    end else begin
        memoiz_array_child_ind_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        memoiz_array_par_ind_address0 = memoiz_array_par_ind_addr_reg_395;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        memoiz_array_par_ind_address0 = zext_ln390_fu_231_p1;
    end else begin
        memoiz_array_par_ind_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state3))) begin
        memoiz_array_par_ind_ce0 = 1'b1;
    end else begin
        memoiz_array_par_ind_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        memoiz_array_par_ind_we0 = 1'b1;
    end else begin
        memoiz_array_par_ind_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((lev_retpipe_0_empty_n == 1'b0) | (childindexpipe_0_empty_n == 1'b0) | (1'b0 == IDRpipes_0_empty_n) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (ret_signal_V_reg_365 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (1'd0 == and_ln395_fu_269_p2))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            if ((~((lev_retpipe_1_full_n == 1'b0) | (childindexpipe_1_full_n == 1'b0) | (1'b0 == IDRpipes_1_full_n)) & (1'b1 == ap_CS_fsm_state10))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign IDR_wind_fu_213_p1 = IDRpipes_0_dout[4:0];

assign IDRpipes_1_din = IDRpipes_0_read_reg_369;

assign add_ln712_3_fu_277_p2 = (sub_ln712_reg_410 + zext_ln712_fu_274_p1);

assign add_ln712_fu_287_p2 = (lev5_ucta_V_load_reg_434 + tmp_new_rewd_V_reg_379);

assign and_ln395_fu_269_p2 = (lev5_numc_V_q0 & icmp_ln395_reg_420);

assign and_ln5_fu_291_p3 = {{grp_fu_190_p4}, {2'd0}};

assign and_ln_fu_317_p3 = {{grp_fu_190_p4}, {2'd0}};

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((lev_retpipe_0_empty_n == 1'b0) | (childindexpipe_0_empty_n == 1'b0) | (1'b0 == IDRpipes_0_empty_n) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state10 = ((lev_retpipe_1_full_n == 1'b0) | (childindexpipe_1_full_n == 1'b0) | (1'b0 == IDRpipes_1_full_n));
end

assign ap_ext_blocking_n = (1'b1 & 1'b1);

assign ap_int_blocking_cur_n = (lev_retpipe_1_blk_n & lev_retpipe_0_blk_n & childindexpipe_1_blk_n & childindexpipe_0_blk_n & IDRpipes_1_blk_n & IDRpipes_0_blk_n);

assign ap_int_blocking_n = (ap_int_blocking_cur_n & 1'b1);

assign ap_str_blocking_n = (1'b1 & 1'b1);

assign childindexpipe_1_din = {{newind_15_reg_181}, {pipeobj_depth_reg_352}};

assign grp_fu_190_p4 = {{childindexpipe_0_read_reg_347[61:32]}};

assign icmp_ln395_fu_263_p2 = (($signed(memoiz_array_par_ind_q0) < $signed(32'd3)) ? 1'b1 : 1'b0);

assign lev_retpipe_1_din = 1'd1;

assign memoiz_array_child_ind_d0 = 1'd0;

assign memoiz_array_par_ind_d0 = pipeobj_ind_reg_357;

assign newind_13_fu_311_p2 = (sub_ln413_fu_299_p2 + select_ln413_fu_304_p3);

assign newind_fu_333_p2 = (sub_ln435_fu_325_p2 + zext_ln435_fu_330_p1);

assign pipeobj_depth_fu_199_p1 = childindexpipe_0_dout[31:0];

assign select_ln413_fu_304_p3 = ((parnode_numc_V_reg_389[0:0] == 1'b1) ? 32'd2 : 32'd1);

assign sub_ln413_fu_299_p2 = (and_ln5_fu_291_p3 - pipeobj_ind_reg_357);

assign sub_ln435_fu_325_p2 = (and_ln_fu_317_p3 - pipeobj_ind_reg_357);

assign sub_ln712_fu_257_p2 = (tmp_13_cast_fu_249_p3 - trunc_ln712_fu_241_p1);

assign tmp_13_cast_fu_249_p3 = {{trunc_ln712_3_fu_245_p1}, {2'd0}};

assign trunc_ln712_3_fu_245_p1 = memoiz_array_par_ind_q0[5:0];

assign trunc_ln712_fu_241_p1 = memoiz_array_par_ind_q0[7:0];

assign zext_ln379_fu_227_p1 = pipeobj_ind_reg_357;

assign zext_ln390_fu_231_p1 = IDR_wind_reg_374;

assign zext_ln395_fu_236_p1 = memoiz_array_par_ind_q0;

assign zext_ln435_fu_330_p1 = parnode_numc_V_reg_389;

assign zext_ln712_3_fu_282_p1 = add_ln712_3_fu_277_p2;

assign zext_ln712_fu_274_p1 = mobj_child_ind_reg_405;

endmodule //top_subT1_lev_stage
