// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module top_subT1_pipl_subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupbkb (address0, ce0, d0, we0, q0,  reset,clk);

parameter DataWidth = 32;
parameter AddressWidth = 5;
parameter AddressRange = 32;

input[AddressWidth-1:0] address0;
input ce0;
input[DataWidth-1:0] d0;
input we0;
output reg[DataWidth-1:0] q0;
input reset;
input clk;

reg [DataWidth-1:0] ram[0:AddressRange-1];

initial begin
    $readmemh("./top_subT1_pipl_subT1_pipl_stream_BpSel_inputObj_0_stream_ap_int_1_0_stream_SelTupbkb.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[address0] <= d0; 
        q0 <= ram[address0];
    end
end


endmodule

