// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W_H__
#define __top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 1;
  static const unsigned AddressRange = 9;
  static const unsigned AddressWidth = 4;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W_ram) {
        for (unsigned i = 0; i < 9; i = i + 1) {
            ram[i] = 0;
        }


SC_METHOD(prc_write_0);
  sensitive<<clk.pos();
   }


void prc_write_0()
{
    if (ce0.read() == sc_dt::Log_1) 
    {
            if(address0.read().is_01() && address0.read().to_uint()<AddressRange)
              q0 = ram[address0.read().to_uint()];
            else
              q0 = sc_lv<DataWidth>();
    }
}


}; //endmodule


SC_MODULE(top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W) {


static const unsigned DataWidth = 1;
static const unsigned AddressRange = 9;
static const unsigned AddressWidth = 4;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W_ram* meminst;


SC_CTOR(top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W) {
meminst = new top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W_ram("top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~top_subT1_lev_stage_2_lev3_numc_V_RAM_1P_URAM_1R1W() {
    delete meminst;
}


};//endmodule
#endif
