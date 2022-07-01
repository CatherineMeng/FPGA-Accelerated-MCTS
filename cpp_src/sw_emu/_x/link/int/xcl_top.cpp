#include "libspir_types.h"
#include "hls_stream.h"
#include "xcl_top_defines.h"
#include "ap_axi_sdata.h"
#define EXPORT_PIPE_SYMBOLS 1
#include "cpu_pipes.h"
#undef EXPORT_PIPE_SYMBOLS
#include "xcl_half.h"
#include <cstddef>
#include <vector>
#include <complex>
#include <pthread.h>
using namespace std;

extern "C" {

void top(size_t X, size_t ids, size_t out_r, size_t adj_list, unsigned int flushs);

static pthread_mutex_t __xlnx_cl_top_mutex = PTHREAD_MUTEX_INITIALIZER;
void __stub____xlnx_cl_top(char **argv) {
  void **args = (void **)argv;
  size_t X = *((size_t*)args[0+1]);
  size_t ids = *((size_t*)args[1+1]);
  size_t out_r = *((size_t*)args[2+1]);
  size_t adj_list = *((size_t*)args[3+1]);
  unsigned int flushs = *((unsigned int*)args[4+1]);
 pthread_mutex_lock(&__xlnx_cl_top_mutex);
  top(X, ids, out_r, adj_list, flushs);
  pthread_mutex_unlock(&__xlnx_cl_top_mutex);
}

typedef qdma_axis<20, 0, 0, 0> __xlnx_cl_struct_type_0;
__XLNX_DEFINE_STREAM_FUNCS__(top,He4aab64d,__xlnx_cl_struct_type_0) 

typedef qdma_axis<32, 0, 0, 0> __xlnx_cl_struct_type_1;
__XLNX_DEFINE_STREAM_FUNCS__(top,Hecb4be88,__xlnx_cl_struct_type_1) 
}
