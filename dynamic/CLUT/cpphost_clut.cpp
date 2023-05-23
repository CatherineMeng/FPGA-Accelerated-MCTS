#define CL_HPP_CL_1_2_DEFAULT_BUILD
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
#define CL_USE_DEPRECATED_OPENCL_1_2_APIS

#define ACTS 8 //action space(fanout)
#define MAX_STEPs 8000 //max tree size: max-steps
#define PA 32 //number of parallel workers

#include <vector>
#include <unistd.h>
#include <iostream>
#include <fstream>
#include <CL/cl2.hpp>
#include "dyna_mcts.h"

// Forward declaration of utility functions included at the end of this file
std::vector<cl::Device> get_xilinx_devices();
char *read_binary_file(const std::string &xclbin_file_name, unsigned &nb);

// HBM Pseudo-channel(PC) requirements
// #define MAX_HBM_PC_COUNT 16
// #define PC_NAME(n) n | XCL_MEM_TOPOLOGY
// const int pc[MAX_HBM_PC_COUNT] = {
//     PC_NAME(0),  PC_NAME(1),  PC_NAME(2),  PC_NAME(3),  PC_NAME(4),  PC_NAME(5),  PC_NAME(6),  PC_NAME(7),
//     PC_NAME(8),  PC_NAME(9),  PC_NAME(10), PC_NAME(11), PC_NAME(12), PC_NAME(13), PC_NAME(14), PC_NAME(15)};

template <typename T1>
struct aligned_allocator
{
  using value_type = T1;
  T1* allocate(std::size_t num)
  {
    void* ptr = nullptr;
    if (posix_memalign(&ptr,4096,num*sizeof(T1)))
      throw std::bad_alloc();
    return reinterpret_cast<T1*>(ptr);
  }
  void deallocate(T1* p, std::size_t num)
  {
    free(p);
  }
};

// ------------------------------------------------------------------------------------
// Main program
// ------------------------------------------------------------------------------------
int main(int argc, char **argv)
{
    // ------------------------------------------------------------------------------------
    // Step 1: Initialize the OpenCL environment
    // ------------------------------------------------------------------------------------
    cl_int err;
    std::string binaryFile = (argc != 2) ? "top.xclbin" : argv[1];
    unsigned fileBufSize;
    std::vector<cl::Device> devices = get_xilinx_devices();
    devices.resize(1);
    cl::Device device = devices[0];
    cl::Context context(device, NULL, NULL, NULL, &err);
    char *fileBuf = read_binary_file(binaryFile, fileBufSize);
    cl::Program::Binaries bins{{fileBuf, fileBufSize}};
    cl::Program program(context, devices, bins, NULL, &err);
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE, &err);
    cl::Kernel kernel(program, "top", &err);

    // -------------------------------------------
    // Create buffers and initialize test values
    // -------------------------------------------

    std::vector<int, aligned_allocator<int>> out_l; //utility/reward

    out_l.resize(16+8);
    
    int i;
    std::cout << "Start initiating data." << std::endl;
    for (i=0;i<16+8;i++){
        out_l[i]=100;
    }
    
    cl_mem_ext_ptr_t out_l_ext;


    out_l_ext.obj = out_l.data();
    out_l_ext.param = 0;
    out_l_ext.flags = 0;
    // |XCL_MEM_TOPOLOGY;


    // Create the buffers and allocate memory
    cl::Buffer out_l_buf(context, CL_MEM_USE_HOST_PTR|CL_MEM_WRITE_ONLY|CL_MEM_EXT_PTR_XILINX, sizeof(int) * PA, &out_l_ext, &err);
    // unsigned dtype best_UCT_leaf=0;

    // ------------------
    // Run the kernel
    // ------------------
    kernel.setArg(0, out_l_buf);
    printf("setArg finished\n");

    q.enqueueTask(kernel);
    std::cout << "HI there1." << std::endl;
    q.finish();
    
    q.enqueueMigrateMemObjects({out_l_buf}, CL_MIGRATE_MEM_OBJECT_HOST);
    std::cout << "HI there2." << std::endl;

    q.finish();
    printf("q.finish\n");

    // checking output
    for (i=0;i<16+8;i++){
        std::cout <<out_l[i]<< std::endl;
    }
}

// ------------------------------------------------------------------------------------
// Utility functions
// ------------------------------------------------------------------------------------
std::vector<cl::Device> get_xilinx_devices()
{
    size_t i;
    cl_int err;
    std::vector<cl::Platform> platforms;
    err = cl::Platform::get(&platforms);
    cl::Platform platform;
    for (i = 0; i < platforms.size(); i++)
    {
        platform = platforms[i];
        std::string platformName = platform.getInfo<CL_PLATFORM_NAME>(&err);
        if (platformName == "Xilinx")
        {
            std::cout << "INFO: Found Xilinx Platform" << std::endl;
            break;
        }
    }
    if (i == platforms.size())
    {
        std::cout << "ERROR: Failed to find Xilinx platform" << std::endl;
        exit(EXIT_FAILURE);
    }

    //Getting ACCELERATOR Devices and selecting 1st such device
    std::vector<cl::Device> devices;
    err = platform.getDevices(CL_DEVICE_TYPE_ACCELERATOR, &devices);
    return devices;
}

char *read_binary_file(const std::string &xclbin_file_name, unsigned &nb)
{
    if (access(xclbin_file_name.c_str(), R_OK) != 0)
    {
        printf("ERROR: %s xclbin not available please build\n", xclbin_file_name.c_str());
        exit(EXIT_FAILURE);
    }
    //Loading XCL Bin into char buffer
    std::cout << "INFO: Loading '" << xclbin_file_name << "'\n";
    std::ifstream bin_file(xclbin_file_name.c_str(), std::ifstream::binary);
    bin_file.seekg(0, bin_file.end);
    nb = bin_file.tellg();
    bin_file.seekg(0, bin_file.beg);
    char *buf = new char[nb];
    bin_file.read(buf, nb);
    return buf;
}