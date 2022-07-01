#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_gmem0 "../tv/cdatafile/c.top.autotvin_gmem0.dat"
#define AUTOTB_TVOUT_gmem0 "../tv/cdatafile/c.top.autotvout_gmem0.dat"
// wrapc file define:
#define AUTOTB_TVIN_X_V_data_V "../tv/cdatafile/c.top.autotvin_X_V_data_V.dat"
#define AUTOTB_TVOUT_X_V_data_V "../tv/cdatafile/c.top.autotvout_X_V_data_V.dat"
#define AUTOTB_TVIN_X_V_keep_V "../tv/cdatafile/c.top.autotvin_X_V_keep_V.dat"
#define AUTOTB_TVOUT_X_V_keep_V "../tv/cdatafile/c.top.autotvout_X_V_keep_V.dat"
#define AUTOTB_TVIN_X_V_last_V "../tv/cdatafile/c.top.autotvin_X_V_last_V.dat"
#define AUTOTB_TVOUT_X_V_last_V "../tv/cdatafile/c.top.autotvout_X_V_last_V.dat"
#define WRAPC_STREAM_SIZE_IN_X_V_data_V "../tv/stream_size/stream_size_in_X_V_data_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_X_V_data_V "../tv/stream_size/stream_ingress_status_X_V_data_V.dat"
#define WRAPC_STREAM_SIZE_IN_X_V_keep_V "../tv/stream_size/stream_size_in_X_V_keep_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_X_V_keep_V "../tv/stream_size/stream_ingress_status_X_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_IN_X_V_last_V "../tv/stream_size/stream_size_in_X_V_last_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_X_V_last_V "../tv/stream_size/stream_ingress_status_X_V_last_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_ids_V_data_V "../tv/cdatafile/c.top.autotvin_ids_V_data_V.dat"
#define AUTOTB_TVOUT_ids_V_data_V "../tv/cdatafile/c.top.autotvout_ids_V_data_V.dat"
#define AUTOTB_TVIN_ids_V_keep_V "../tv/cdatafile/c.top.autotvin_ids_V_keep_V.dat"
#define AUTOTB_TVOUT_ids_V_keep_V "../tv/cdatafile/c.top.autotvout_ids_V_keep_V.dat"
#define AUTOTB_TVIN_ids_V_last_V "../tv/cdatafile/c.top.autotvin_ids_V_last_V.dat"
#define AUTOTB_TVOUT_ids_V_last_V "../tv/cdatafile/c.top.autotvout_ids_V_last_V.dat"
#define WRAPC_STREAM_SIZE_IN_ids_V_data_V "../tv/stream_size/stream_size_in_ids_V_data_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_ids_V_data_V "../tv/stream_size/stream_ingress_status_ids_V_data_V.dat"
#define WRAPC_STREAM_SIZE_IN_ids_V_keep_V "../tv/stream_size/stream_size_in_ids_V_keep_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_ids_V_keep_V "../tv/stream_size/stream_ingress_status_ids_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_IN_ids_V_last_V "../tv/stream_size/stream_size_in_ids_V_last_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_ids_V_last_V "../tv/stream_size/stream_ingress_status_ids_V_last_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_out_r "../tv/cdatafile/c.top.autotvin_out_r.dat"
#define AUTOTB_TVOUT_out_r "../tv/cdatafile/c.top.autotvout_out_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_adj_list "../tv/cdatafile/c.top.autotvin_adj_list.dat"
#define AUTOTB_TVOUT_adj_list "../tv/cdatafile/c.top.autotvout_adj_list.dat"
// wrapc file define:
#define AUTOTB_TVIN_flushs "../tv/cdatafile/c.top.autotvin_flushs.dat"
#define AUTOTB_TVOUT_flushs "../tv/cdatafile/c.top.autotvout_flushs.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_gmem0 "../tv/rtldatafile/rtl.top.autotvout_gmem0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_X_V_data_V "../tv/rtldatafile/rtl.top.autotvout_X_V_data_V.dat"
#define AUTOTB_TVOUT_PC_X_V_keep_V "../tv/rtldatafile/rtl.top.autotvout_X_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_X_V_last_V "../tv/rtldatafile/rtl.top.autotvout_X_V_last_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_ids_V_data_V "../tv/rtldatafile/rtl.top.autotvout_ids_V_data_V.dat"
#define AUTOTB_TVOUT_PC_ids_V_keep_V "../tv/rtldatafile/rtl.top.autotvout_ids_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_ids_V_last_V "../tv/rtldatafile/rtl.top.autotvout_ids_V_last_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_out_r "../tv/rtldatafile/rtl.top.autotvout_out_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_adj_list "../tv/rtldatafile/rtl.top.autotvout_adj_list.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_flushs "../tv/rtldatafile/rtl.top.autotvout_flushs.dat"


inline void rev_endian(char* p, size_t nbytes)
{
  std::reverse(p, p+nbytes);
}

template<size_t bit_width>
struct transaction {
  typedef uint64_t depth_t;
  static const size_t wbytes = (bit_width+7)>>3;
  static const size_t dbytes = sizeof(depth_t);
  const depth_t depth;
  const size_t vbytes;
  const size_t tbytes;
  char * const p;
  typedef char (*p_dat)[wbytes];
  p_dat vp;

  void reorder() {
    rev_endian(p, dbytes);
    p_dat vp = (p_dat) (p+dbytes);
    for (depth_t i = 0; i < depth; ++i) {
      rev_endian(vp[i], wbytes);
    }
  }

  transaction(depth_t depth)
    : depth(depth), vbytes(wbytes*depth), tbytes(dbytes+vbytes),
      p(new char[tbytes]) {
    *(depth_t*)p = depth;
    vp = (p_dat) (p+dbytes);
  }

  template<size_t psize>
  void import(char* param, depth_t num, int64_t offset) {
    param -= offset*psize;
    for (depth_t i = 0; i < num; ++i) {
      memcpy(vp[i], param, wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[i], wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num, int64_t skip) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[skip+i], wbytes);
      param += psize;
    }
  }

  ~transaction() { if (p) { delete[] p; } }
};
      

inline const std::string begin_str(int num)
{
  return std::string("[[transaction]] ")
         .append(std::to_string(num))
         .append("\n");
}

inline const std::string end_str()
{
  return std::string("[[/transaction]] \n");
}
      
class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  gmem0_depth = 0;
  X_V_data_V_depth = 0;
  X_V_keep_V_depth = 0;
  X_V_last_V_depth = 0;
  ids_V_data_V_depth = 0;
  ids_V_keep_V_depth = 0;
  ids_V_last_V_depth = 0;
  out_r_depth = 0;
  adj_list_depth = 0;
  flushs_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{gmem0 " << gmem0_depth << "}\n";
  total_list << "{X_V_data_V " << X_V_data_V_depth << "}\n";
  total_list << "{X_V_keep_V " << X_V_keep_V_depth << "}\n";
  total_list << "{X_V_last_V " << X_V_last_V_depth << "}\n";
  total_list << "{ids_V_data_V " << ids_V_data_V_depth << "}\n";
  total_list << "{ids_V_keep_V " << ids_V_keep_V_depth << "}\n";
  total_list << "{ids_V_last_V " << ids_V_last_V_depth << "}\n";
  total_list << "{out_r " << out_r_depth << "}\n";
  total_list << "{adj_list " << adj_list_depth << "}\n";
  total_list << "{flushs " << flushs_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int gmem0_depth;
    int X_V_data_V_depth;
    int X_V_keep_V_depth;
    int X_V_last_V_depth;
    int ids_V_data_V_depth;
    int ids_V_keep_V_depth;
    int ids_V_last_V_depth;
    int out_r_depth;
    int adj_list_depth;
    int flushs_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static bool RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool err = false;
  size_t x_found;

  // search and replace 'X' with '0' from the 3rd char of token
  while ((x_found = AESL_token.find('X', 0)) != string::npos)
    err = true, AESL_token.replace(x_found, 1, "0");
  
  // search and replace 'x' with '0' from the 3rd char of token
  while ((x_found = AESL_token.find('x', 2)) != string::npos)
    err = true, AESL_token.replace(x_found, 1, "0");
  
  return err;}
struct __cosim_s10__ { char data[16]; };
struct __cosim_s20__ { char data[32]; };
extern "C" void top_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, int);

extern "C" void apatb_top_hw(volatile void * __xlx_apatb_param_X_V_data_V, volatile void * __xlx_apatb_param_X_V_keep_V, volatile void * __xlx_apatb_param_X_V_last_V, volatile void * __xlx_apatb_param_ids_V_data_V, volatile void * __xlx_apatb_param_ids_V_keep_V, volatile void * __xlx_apatb_param_ids_V_last_V, volatile void * __xlx_apatb_param_out_r, volatile void * __xlx_apatb_param_adj_list, int __xlx_apatb_param_flushs) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
static AESL_FILE_HANDLER aesl_fh;
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
long __xlx_apatb_param_X_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_X_V_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_X_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_X_stream_buf_final_size; ++i) {
((hls::stream<int>*)__xlx_apatb_param_X_V_data_V)->read();
((hls::stream<char>*)__xlx_apatb_param_X_V_keep_V)->read();
((hls::stream<char>*)__xlx_apatb_param_X_V_last_V)->read();
}
long __xlx_apatb_param_ids_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_ids_V_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_ids_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_ids_stream_buf_final_size; ++i) {
((hls::stream<int>*)__xlx_apatb_param_ids_V_data_V)->read();
((hls::stream<char>*)__xlx_apatb_param_ids_V_keep_V)->read();
((hls::stream<char>*)__xlx_apatb_param_ids_V_last_V)->read();
}
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_r);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<128> > out_r_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token, "out_r");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_r_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "out_r" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
		    int i = 0;
            for (int j = 0, e = 1; j < e; j += 1, ++i) {((long long*)__xlx_apatb_param_out_r)[j*2+0] = out_r_pc_buffer[i].range(63,0).to_int64();
((long long*)__xlx_apatb_param_out_r)[j*2+1] = out_r_pc_buffer[i].range(127,64).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_X_V_data_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_X_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_X_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_X_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_X_V_last_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_X_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_ids_V_data_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_ids_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_ids_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_ids_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_ids_V_last_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_ids_V_last_V);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_adj_list = 0;
// print gmem0 Transactions
{
aesl_fh.write(AUTOTB_TVIN_gmem0, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_adj_list = 0*32;
  if (__xlx_apatb_param_adj_list) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<256> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_adj_list)[j*4+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_adj_list)[j*4+1];
__xlx_tmp_lv.range(191,128) = ((long long*)__xlx_apatb_param_adj_list)[j*4+2];
__xlx_tmp_lv.range(255,192) = ((long long*)__xlx_apatb_param_adj_list)[j*4+3];
aesl_fh.write(AUTOTB_TVIN_gmem0, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
    }
  }
}

  tcl_file.set_num(1, &tcl_file.gmem0_depth);
aesl_fh.write(AUTOTB_TVIN_gmem0, end_str());
}

// data
std::vector<int> __xlx_apatb_param_X_V_data_V_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_X_V_data_V)->empty())
    __xlx_apatb_param_X_V_data_V_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_X_V_data_V)->read());
  for (int i = 0; i < __xlx_apatb_param_X_V_data_V_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_X_V_data_V)->write(__xlx_apatb_param_X_V_data_V_stream_buf[i]);
  }
long __xlx_apatb_param_X_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_X_V_data_V)->size();
// keep
std::vector<char> __xlx_apatb_param_X_V_keep_V_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_X_V_keep_V)->empty())
    __xlx_apatb_param_X_V_keep_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_X_V_keep_V)->read());
  for (int i = 0; i < __xlx_apatb_param_X_V_keep_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_X_V_keep_V)->write(__xlx_apatb_param_X_V_keep_V_stream_buf[i]);
  }
// strb
// user
// last
std::vector<char> __xlx_apatb_param_X_V_last_V_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_X_V_last_V)->empty())
    __xlx_apatb_param_X_V_last_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_X_V_last_V)->read());
  for (int i = 0; i < __xlx_apatb_param_X_V_last_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_X_V_last_V)->write(__xlx_apatb_param_X_V_last_V_stream_buf[i]);
  }
// id
// dest
// data
std::vector<int> __xlx_apatb_param_ids_V_data_V_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_ids_V_data_V)->empty())
    __xlx_apatb_param_ids_V_data_V_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_ids_V_data_V)->read());
  for (int i = 0; i < __xlx_apatb_param_ids_V_data_V_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_ids_V_data_V)->write(__xlx_apatb_param_ids_V_data_V_stream_buf[i]);
  }
long __xlx_apatb_param_ids_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_ids_V_data_V)->size();
// keep
std::vector<char> __xlx_apatb_param_ids_V_keep_V_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_ids_V_keep_V)->empty())
    __xlx_apatb_param_ids_V_keep_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_ids_V_keep_V)->read());
  for (int i = 0; i < __xlx_apatb_param_ids_V_keep_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_ids_V_keep_V)->write(__xlx_apatb_param_ids_V_keep_V_stream_buf[i]);
  }
// strb
// user
// last
std::vector<char> __xlx_apatb_param_ids_V_last_V_stream_buf;
{
  while (!((hls::stream<char>*)__xlx_apatb_param_ids_V_last_V)->empty())
    __xlx_apatb_param_ids_V_last_V_stream_buf.push_back(((hls::stream<char>*)__xlx_apatb_param_ids_V_last_V)->read());
  for (int i = 0; i < __xlx_apatb_param_ids_V_last_V_stream_buf.size(); ++i)
    ((hls::stream<char>*)__xlx_apatb_param_ids_V_last_V)->write(__xlx_apatb_param_ids_V_last_V_stream_buf[i]);
  }
// id
// dest
// print out_r Transactions
{
aesl_fh.write(AUTOTB_TVIN_out_r, begin_str(AESL_transaction));
  if (__xlx_apatb_param_out_r) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<128> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_out_r)[j*2+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_out_r)[j*2+1];
aesl_fh.write(AUTOTB_TVIN_out_r, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
    }
  }

  tcl_file.set_num(1, &tcl_file.out_r_depth);
aesl_fh.write(AUTOTB_TVIN_out_r, end_str());
}

// print adj_list Transactions
{
aesl_fh.write(AUTOTB_TVIN_adj_list, begin_str(AESL_transaction));
{
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_adj_list;
aesl_fh.write(AUTOTB_TVIN_adj_list, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.adj_list_depth);
aesl_fh.write(AUTOTB_TVIN_adj_list, end_str());
}

// print flushs Transactions
{
aesl_fh.write(AUTOTB_TVIN_flushs, begin_str(AESL_transaction));
{
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_flushs);
aesl_fh.write(AUTOTB_TVIN_flushs, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
}
  tcl_file.set_num(1, &tcl_file.flushs_depth);
aesl_fh.write(AUTOTB_TVIN_flushs, end_str());
}

CodeState = CALL_C_DUT;
top_hw_stub_wrapper(__xlx_apatb_param_X_V_data_V, __xlx_apatb_param_X_V_keep_V, __xlx_apatb_param_X_V_last_V, __xlx_apatb_param_ids_V_data_V, __xlx_apatb_param_ids_V_keep_V, __xlx_apatb_param_ids_V_last_V, __xlx_apatb_param_out_r, __xlx_apatb_param_adj_list, __xlx_apatb_param_flushs);
CodeState = DUMP_OUTPUTS;
long __xlx_apatb_param_X_stream_buf_final_size = __xlx_apatb_param_X_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_X_V_data_V)->size();
aesl_fh.write(AUTOTB_TVIN_X_V_data_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVIN_X_V_keep_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVIN_X_V_last_V, begin_str(AESL_transaction));
for (int j = 0, e = __xlx_apatb_param_X_stream_buf_final_size; j != e; ++j) {
sc_bv<20> __xlx_tmp_0_lv = ((int*)&__xlx_apatb_param_X_V_data_V_stream_buf[j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_X_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<3> __xlx_tmp_1_lv = ((char*)&__xlx_apatb_param_X_V_keep_V_stream_buf[j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_X_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<1> __xlx_tmp_4_lv = ((char*)&__xlx_apatb_param_X_V_last_V_stream_buf[j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_X_V_last_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_X_stream_buf_final_size, &tcl_file.X_V_data_V_depth);
aesl_fh.write(AUTOTB_TVIN_X_V_data_V, end_str());
tcl_file.set_num(__xlx_apatb_param_X_stream_buf_final_size, &tcl_file.X_V_keep_V_depth);
aesl_fh.write(AUTOTB_TVIN_X_V_keep_V, end_str());
tcl_file.set_num(__xlx_apatb_param_X_stream_buf_final_size, &tcl_file.X_V_last_V_depth);
aesl_fh.write(AUTOTB_TVIN_X_V_last_V, end_str());

// dump stream ingress status to file

// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_data_V, begin_str(AESL_transaction));
if (__xlx_apatb_param_X_stream_buf_final_size > 0) {
  long X_V_data_V_stream_ingress_size = __xlx_apatb_param_X_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", X_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_data_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_X_stream_buf_final_size; j != e; j++) {
    X_V_data_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", X_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_data_V, __xlx_sprintf_buffer.data());
  }
} else {
  long X_V_data_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", X_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_data_V, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_data_V, end_str());
}

// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_keep_V, begin_str(AESL_transaction));
if (__xlx_apatb_param_X_stream_buf_final_size > 0) {
  long X_V_keep_V_stream_ingress_size = __xlx_apatb_param_X_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", X_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_keep_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_X_stream_buf_final_size; j != e; j++) {
    X_V_keep_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", X_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_keep_V, __xlx_sprintf_buffer.data());
  }
} else {
  long X_V_keep_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", X_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_keep_V, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_keep_V, end_str());
}

// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_last_V, begin_str(AESL_transaction));
if (__xlx_apatb_param_X_stream_buf_final_size > 0) {
  long X_V_last_V_stream_ingress_size = __xlx_apatb_param_X_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", X_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_X_stream_buf_final_size; j != e; j++) {
    X_V_last_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", X_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_last_V, __xlx_sprintf_buffer.data());
  }
} else {
  long X_V_last_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", X_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_last_V, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_X_V_last_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_X_V_data_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_X_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_X_V_data_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_X_V_data_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_X_V_keep_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_X_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_X_V_keep_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_X_V_keep_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_X_V_last_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_X_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_X_V_last_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_X_V_last_V, end_str());
}
long __xlx_apatb_param_ids_stream_buf_final_size = __xlx_apatb_param_ids_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_ids_V_data_V)->size();
aesl_fh.write(AUTOTB_TVIN_ids_V_data_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVIN_ids_V_keep_V, begin_str(AESL_transaction));
aesl_fh.write(AUTOTB_TVIN_ids_V_last_V, begin_str(AESL_transaction));
for (int j = 0, e = __xlx_apatb_param_ids_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_0_lv = ((int*)&__xlx_apatb_param_ids_V_data_V_stream_buf[j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_ids_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<4> __xlx_tmp_1_lv = ((char*)&__xlx_apatb_param_ids_V_keep_V_stream_buf[j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_ids_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<1> __xlx_tmp_4_lv = ((char*)&__xlx_apatb_param_ids_V_last_V_stream_buf[j])[0];
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_ids_V_last_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_ids_stream_buf_final_size, &tcl_file.ids_V_data_V_depth);
aesl_fh.write(AUTOTB_TVIN_ids_V_data_V, end_str());
tcl_file.set_num(__xlx_apatb_param_ids_stream_buf_final_size, &tcl_file.ids_V_keep_V_depth);
aesl_fh.write(AUTOTB_TVIN_ids_V_keep_V, end_str());
tcl_file.set_num(__xlx_apatb_param_ids_stream_buf_final_size, &tcl_file.ids_V_last_V_depth);
aesl_fh.write(AUTOTB_TVIN_ids_V_last_V, end_str());

// dump stream ingress status to file

// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_data_V, begin_str(AESL_transaction));
if (__xlx_apatb_param_ids_stream_buf_final_size > 0) {
  long ids_V_data_V_stream_ingress_size = __xlx_apatb_param_ids_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", ids_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_data_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_ids_stream_buf_final_size; j != e; j++) {
    ids_V_data_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", ids_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_data_V, __xlx_sprintf_buffer.data());
  }
} else {
  long ids_V_data_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", ids_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_data_V, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_data_V, end_str());
}

// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_keep_V, begin_str(AESL_transaction));
if (__xlx_apatb_param_ids_stream_buf_final_size > 0) {
  long ids_V_keep_V_stream_ingress_size = __xlx_apatb_param_ids_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", ids_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_keep_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_ids_stream_buf_final_size; j != e; j++) {
    ids_V_keep_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", ids_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_keep_V, __xlx_sprintf_buffer.data());
  }
} else {
  long ids_V_keep_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", ids_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_keep_V, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_keep_V, end_str());
}

// dump stream ingress status to file
{
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_last_V, begin_str(AESL_transaction));
if (__xlx_apatb_param_ids_stream_buf_final_size > 0) {
  long ids_V_last_V_stream_ingress_size = __xlx_apatb_param_ids_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", ids_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_ids_stream_buf_final_size; j != e; j++) {
    ids_V_last_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", ids_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_last_V, __xlx_sprintf_buffer.data());
  }
} else {
  long ids_V_last_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", ids_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_last_V, __xlx_sprintf_buffer.data());
}
aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_ids_V_last_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_ids_V_data_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_ids_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_ids_V_data_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_ids_V_data_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_ids_V_keep_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_ids_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_ids_V_keep_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_ids_V_keep_V, end_str());
}
{
aesl_fh.write(WRAPC_STREAM_SIZE_IN_ids_V_last_V, begin_str(AESL_transaction));
sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_ids_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_ids_V_last_V, __xlx_sprintf_buffer.data());
aesl_fh.write(WRAPC_STREAM_SIZE_IN_ids_V_last_V, end_str());
}
// print out_r Transactions
{
aesl_fh.write(AUTOTB_TVOUT_out_r, begin_str(AESL_transaction));
  if (__xlx_apatb_param_out_r) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<128> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_out_r)[j*2+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_out_r)[j*2+1];
aesl_fh.write(AUTOTB_TVOUT_out_r, __xlx_tmp_lv.to_string(SC_HEX)+string("\n"));
    }
  }

  tcl_file.set_num(1, &tcl_file.out_r_depth);
aesl_fh.write(AUTOTB_TVOUT_out_r, end_str());
}

CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
