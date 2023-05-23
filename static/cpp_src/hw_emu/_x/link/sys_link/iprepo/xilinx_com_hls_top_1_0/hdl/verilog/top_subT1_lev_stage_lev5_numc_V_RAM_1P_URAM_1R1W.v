// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
(* rom_style = "hls_ultra" *) module top_subT1_lev_stage_lev5_numc_V_RAM_1P_URAM_1R1W (
address0, ce0, q0, reset,clk);

parameter DataWidth = 1;
parameter AddressWidth = 7;
parameter AddressRange = 81;

input[AddressWidth-1:0] address0;
input ce0;
output reg[DataWidth-1:0] q0;
input reset;
input clk;

(* ram_style = "hls_ultra" *)reg [DataWidth-1:0] ram[0:AddressRange-1];

initial begin
    $readmemh("./top_subT1_lev_stage_lev5_numc_V_RAM_1P_URAM_1R1W.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 <= ram[address0];
    end
end



endmodule

