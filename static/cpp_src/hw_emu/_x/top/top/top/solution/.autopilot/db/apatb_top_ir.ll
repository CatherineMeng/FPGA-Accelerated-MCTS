; ModuleID = '/home/myuan/Desktop/MCTS/FPGA-Accelerated-MCTS/cpp_src/hw_emu/_x/top/top/top/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>" = type { %"struct.qdma_axis<20, 0, 0, 0>" }
%"struct.qdma_axis<20, 0, 0, 0>" = type { %"struct.ap_uint<20>", %"struct.ap_uint<3>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_uint<20>" = type { %"struct.ap_int_base<20, false>" }
%"struct.ap_int_base<20, false>" = type { %"struct.ssdm_int<20, false>" }
%"struct.ssdm_int<20, false>" = type { i20 }
%"struct.ap_uint<3>" = type { %"struct.ap_int_base<3, false>" }
%"struct.ap_int_base<3, false>" = type { %"struct.ssdm_int<3, false>" }
%"struct.ssdm_int<3, false>" = type { i3 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>" = type { %"struct.qdma_axis<32, 0, 0, 0>" }
%"struct.qdma_axis<32, 0, 0, 0>" = type { %"struct.ap_uint<32>", %"struct.ap_uint<4>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"struct.ap_uint<4>" = type { %"struct.ap_int_base<4, false>" }
%"struct.ap_int_base<4, false>" = type { %"struct.ssdm_int<4, false>" }
%"struct.ssdm_int<4, false>" = type { i4 }
%struct.SelTupleOut = type { i32, i32, i32, i32 }
%struct.node = type { %"struct.ap_uint<20>", %"struct.ap_uint<3>", [3 x %"struct.ap_uint<20>"], [3 x %"struct.ap_uint<20>"] }

; Function Attrs: noinline
define void @apatb_top_ir(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %X, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %ids, %struct.SelTupleOut* %out, %struct.node* %adj_list, i32 %flushs) local_unnamed_addr #0 {
entry:
  %X_copy.data = alloca i20
  %X_copy.keep = alloca i3
  %X_copy.last = alloca i1
  %ids_copy.data = alloca i32
  %ids_copy.keep = alloca i4
  %ids_copy.last = alloca i1
  %out_copy = alloca %struct.SelTupleOut, align 512
  %adj_list_copy = alloca %struct.node, align 512
  call fastcc void @copy_in(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %X, i20* %X_copy.data, i3* %X_copy.keep, i1* %X_copy.last, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %ids, i32* %ids_copy.data, i4* %ids_copy.keep, i1* %ids_copy.last, %struct.SelTupleOut* %out, %struct.SelTupleOut* nonnull align 512 %out_copy, %struct.node* %adj_list, %struct.node* nonnull align 512 %adj_list_copy)
  call void @apatb_top_hw(i20* %X_copy.data, i3* %X_copy.keep, i1* %X_copy.last, i32* %ids_copy.data, i4* %ids_copy.keep, i1* %ids_copy.last, %struct.SelTupleOut* %out_copy, %struct.node* %adj_list_copy, i32 %flushs)
  call fastcc void @copy_out(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %X, i20* %X_copy.data, i3* %X_copy.keep, i1* %X_copy.last, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %ids, i32* %ids_copy.data, i4* %ids_copy.keep, i1* %ids_copy.last, %struct.SelTupleOut* %out, %struct.SelTupleOut* nonnull align 512 %out_copy, %struct.node* %adj_list, %struct.node* nonnull align 512 %adj_list_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"*, i20* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_last_V, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"*, i32* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V1, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V2, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_last_V3, %struct.SelTupleOut* readonly, %struct.SelTupleOut* noalias align 512, %struct.node* readonly, %struct.node* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>.213"(i20* %_V_data_V, i3* %_V_keep_V, i1* %_V_last_V, %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"(i32* %_V_data_V1, i4* %_V_keep_V2, i1* %_V_last_V3, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %1)
  call fastcc void @onebyonecpy_hls.p0struct.SelTupleOut(%struct.SelTupleOut* align 512 %3, %struct.SelTupleOut* %2)
  call fastcc void @onebyonecpy_hls.p0struct.node(%struct.node* align 512 %5, %struct.node* %4)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", i20* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_last_V) unnamed_addr #2 {
entry:
  %1 = icmp eq %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %0, null
  %2 = or i1 %1, false
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* nonnull align 512 %0, i20* %_V_data_V, i3* %_V_keep_V, i1* %_V_last_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", i20* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i3* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_last_V) unnamed_addr #3 {
entry:
  %1 = alloca %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"
  %2 = alloca i1
  %3 = alloca i20
  %4 = alloca i3
  br label %empty

empty:                                            ; preds = %push, %entry
  %5 = bitcast i20* %_V_data_V to i8*
  %6 = call i1 @fpga_fifo_not_empty_4(i8* %5)
  br i1 %6, label %push, label %ret

push:                                             ; preds = %empty
  %7 = bitcast i20* %3 to i8*
  %8 = bitcast i20* %_V_data_V to i8*
  call void @fpga_fifo_pop_4(i8* %7, i8* %8)
  %9 = bitcast i20* %3 to i24*
  %10 = load i24, i24* %9
  %11 = trunc i24 %10 to i20
  %12 = getelementptr inbounds %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %13 = bitcast %"struct.ap_uint<20>"* %12 to i20*
  store i20 %11, i20* %13
  %14 = bitcast i3* %4 to i8*
  %15 = bitcast i3* %_V_keep_V to i8*
  call void @fpga_fifo_pop_1(i8* %14, i8* %15)
  %16 = bitcast i3* %4 to i8*
  %17 = load i8, i8* %16
  %18 = trunc i8 %17 to i3
  %19 = getelementptr inbounds %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %20 = bitcast %"struct.ap_uint<3>"* %19 to i3*
  store i3 %18, i3* %20
  %21 = bitcast i1* %2 to i8*
  %22 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %21, i8* %22)
  %23 = bitcast i1* %2 to i8*
  %24 = load i8, i8* %23
  %25 = trunc i8 %24 to i1
  %26 = getelementptr inbounds %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %27 = bitcast %"struct.ap_uint<1>"* %26 to i1*
  store i1 %25, i1* %27
  %28 = bitcast %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %1 to i8*
  %29 = bitcast %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %28, i8* %29)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"(i32* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_last_V, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #2 {
entry:
  %1 = icmp eq %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %0, null
  %2 = or i1 false, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"(i32* %_V_data_V, i4* %_V_keep_V, i1* %_V_last_V, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* nonnull %0)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"(i32* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i4* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_last_V, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %1 = alloca %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"
  %2 = alloca %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %0 to i8*
  %4 = call i1 @fpga_fifo_not_empty_12(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_12(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %2
  store %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>" %7, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %1
  %8 = getelementptr inbounds %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %9 = bitcast %"struct.ap_uint<32>"* %8 to i32*
  %10 = bitcast i32* %9 to i8*
  %11 = bitcast i32* %_V_data_V to i8*
  call void @fpga_fifo_push_4(i8* %10, i8* %11)
  %12 = getelementptr inbounds %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %13 = bitcast %"struct.ap_uint<4>"* %12 to i4*
  %14 = bitcast i4* %13 to i8*
  %15 = bitcast i4* %_V_keep_V to i8*
  call void @fpga_fifo_push_1(i8* %14, i8* %15)
  %16 = getelementptr inbounds %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %17 = bitcast %"struct.ap_uint<1>"* %16 to i1*
  %18 = bitcast i1* %17 to i8*
  %19 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %18, i8* %19)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.SelTupleOut(%struct.SelTupleOut* noalias align 512, %struct.SelTupleOut* noalias readonly) unnamed_addr #4 {
entry:
  %2 = icmp eq %struct.SelTupleOut* %0, null
  %3 = icmp eq %struct.SelTupleOut* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0 = getelementptr %struct.SelTupleOut, %struct.SelTupleOut* %1, i32 0, i32 0
  %.01 = getelementptr %struct.SelTupleOut, %struct.SelTupleOut* %0, i32 0, i32 0
  %5 = load i32, i32* %.0, align 4
  store i32 %5, i32* %.01, align 512
  %.1 = getelementptr %struct.SelTupleOut, %struct.SelTupleOut* %1, i32 0, i32 1
  %.12 = getelementptr %struct.SelTupleOut, %struct.SelTupleOut* %0, i32 0, i32 1
  %6 = load i32, i32* %.1, align 4
  store i32 %6, i32* %.12, align 4
  %.2 = getelementptr %struct.SelTupleOut, %struct.SelTupleOut* %1, i32 0, i32 2
  %.23 = getelementptr %struct.SelTupleOut, %struct.SelTupleOut* %0, i32 0, i32 2
  %7 = load i32, i32* %.2, align 4
  store i32 %7, i32* %.23, align 8
  %.3 = getelementptr %struct.SelTupleOut, %struct.SelTupleOut* %1, i32 0, i32 3
  %.34 = getelementptr %struct.SelTupleOut, %struct.SelTupleOut* %0, i32 0, i32 3
  %8 = load i32, i32* %.3, align 4
  store i32 %8, i32* %.34, align 4
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.node(%struct.node* noalias align 512, %struct.node* noalias readonly) unnamed_addr #4 {
entry:
  %2 = icmp eq %struct.node* %0, null
  %3 = icmp eq %struct.node* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.0.015 = getelementptr %struct.node, %struct.node* %1, i32 0, i32 0, i32 0, i32 0, i32 0
  %.01.0.0.016 = getelementptr %struct.node, %struct.node* %0, i32 0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i20* %.0.0.0.015 to i24*
  %6 = load i24, i24* %5
  %7 = trunc i24 %6 to i20
  store i20 %7, i20* %.01.0.0.016, align 512
  %.1.0.0.021 = getelementptr %struct.node, %struct.node* %1, i32 0, i32 1, i32 0, i32 0, i32 0
  %.12.0.0.022 = getelementptr %struct.node, %struct.node* %0, i32 0, i32 1, i32 0, i32 0, i32 0
  %8 = bitcast i3* %.1.0.0.021 to i8*
  %9 = load i8, i8* %8
  %10 = trunc i8 %9 to i3
  store i3 %10, i3* %.12.0.0.022, align 4
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx40 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.037 = getelementptr %struct.node, %struct.node* %1, i32 0, i32 2, i64 %for.loop.idx40, i32 0, i32 0, i32 0
  %dst.addr.0.0.038 = getelementptr %struct.node, %struct.node* %0, i32 0, i32 2, i64 %for.loop.idx40, i32 0, i32 0, i32 0
  %11 = bitcast i20* %src.addr.0.0.037 to i24*
  %12 = load i24, i24* %11
  %13 = trunc i24 %12 to i20
  store i20 %13, i20* %dst.addr.0.0.038, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx40, 1
  %exitcond41 = icmp ne i64 %for.loop.idx.next, 3
  br i1 %exitcond41, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop
  br label %for.loop6

for.loop6:                                        ; preds = %for.loop6, %copy.split
  %for.loop.idx739 = phi i64 [ 0, %copy.split ], [ %for.loop.idx7.next, %for.loop6 ]
  %src.addr10.0.0.029 = getelementptr %struct.node, %struct.node* %1, i32 0, i32 3, i64 %for.loop.idx739, i32 0, i32 0, i32 0
  %dst.addr9.0.0.030 = getelementptr %struct.node, %struct.node* %0, i32 0, i32 3, i64 %for.loop.idx739, i32 0, i32 0, i32 0
  %14 = bitcast i20* %src.addr10.0.0.029 to i24*
  %15 = load i24, i24* %14
  %16 = trunc i24 %15 to i20
  store i20 %16, i20* %dst.addr9.0.0.030, align 4
  %for.loop.idx7.next = add nuw nsw i64 %for.loop.idx739, 1
  %exitcond = icmp ne i64 %for.loop.idx7.next, 3
  br i1 %exitcond, label %for.loop6, label %ret

ret:                                              ; preds = %for.loop6, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"*, i20* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_last_V, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"*, i32* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V1, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V2, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_last_V3, %struct.SelTupleOut*, %struct.SelTupleOut* noalias readonly align 512, %struct.node*, %struct.node* noalias readonly align 512) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %0, i20* %_V_data_V, i3* %_V_keep_V, i1* %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>.202"(%"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %1, i32* %_V_data_V1, i4* %_V_keep_V2, i1* %_V_last_V3)
  call fastcc void @onebyonecpy_hls.p0struct.SelTupleOut(%struct.SelTupleOut* %2, %struct.SelTupleOut* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0struct.node(%struct.node* %4, %struct.node* align 512 %5)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>.202"(%"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", i32* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i4* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_last_V) unnamed_addr #2 {
entry:
  %1 = icmp eq %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %0, null
  %2 = or i1 %1, false
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>.205"(%"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* nonnull align 512 %0, i32* %_V_data_V, i4* %_V_keep_V, i1* %_V_last_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>.205"(%"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", i32* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i4* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_last_V) unnamed_addr #3 {
entry:
  %1 = alloca %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"
  %2 = alloca i32
  %3 = alloca i4
  %4 = alloca i1
  br label %empty

empty:                                            ; preds = %push, %entry
  %5 = bitcast i32* %_V_data_V to i8*
  %6 = call i1 @fpga_fifo_not_empty_4(i8* %5)
  br i1 %6, label %push, label %ret

push:                                             ; preds = %empty
  %7 = bitcast i32* %2 to i8*
  %8 = bitcast i32* %_V_data_V to i8*
  call void @fpga_fifo_pop_4(i8* %7, i8* %8)
  %9 = load volatile i32, i32* %2
  %10 = getelementptr inbounds %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %11 = bitcast %"struct.ap_uint<32>"* %10 to i32*
  store i32 %9, i32* %11
  %12 = bitcast i4* %3 to i8*
  %13 = bitcast i4* %_V_keep_V to i8*
  call void @fpga_fifo_pop_1(i8* %12, i8* %13)
  %14 = bitcast i4* %3 to i8*
  %15 = load i8, i8* %14
  %16 = trunc i8 %15 to i4
  %17 = getelementptr inbounds %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %18 = bitcast %"struct.ap_uint<4>"* %17 to i4*
  store i4 %16, i4* %18
  %19 = bitcast i1* %4 to i8*
  %20 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %19, i8* %20)
  %21 = bitcast i1* %4 to i8*
  %22 = load i8, i8* %21
  %23 = trunc i8 %22 to i1
  %24 = getelementptr inbounds %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %25 = bitcast %"struct.ap_uint<1>"* %24 to i1*
  store i1 %23, i1* %25
  %26 = bitcast %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %1 to i8*
  %27 = bitcast %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %26, i8* %27)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>.213"(i20* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i3* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_last_V, %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #2 {
entry:
  %1 = icmp eq %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %0, null
  %2 = or i1 false, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>.216"(i20* %_V_data_V, i3* %_V_keep_V, i1* %_V_last_V, %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* nonnull %0)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>.216"(i20* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i3* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_last_V, %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %1 = alloca %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"
  %2 = alloca %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %0 to i8*
  %4 = call i1 @fpga_fifo_not_empty_12(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_12(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %2
  store %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>" %7, %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %1
  %8 = getelementptr inbounds %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %9 = bitcast %"struct.ap_uint<20>"* %8 to i20*
  %10 = bitcast i20* %9 to i8*
  %11 = bitcast i20* %_V_data_V to i8*
  call void @fpga_fifo_push_4(i8* %10, i8* %11)
  %12 = getelementptr inbounds %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %13 = bitcast %"struct.ap_uint<3>"* %12 to i3*
  %14 = bitcast i3* %13 to i8*
  %15 = bitcast i3* %_V_keep_V to i8*
  call void @fpga_fifo_push_1(i8* %14, i8* %15)
  %16 = getelementptr inbounds %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>", %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %17 = bitcast %"struct.ap_uint<1>"* %16 to i1*
  %18 = bitcast i1* %17 to i8*
  %19 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %18, i8* %19)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_top_hw(i20*, i3*, i1*, i32*, i4*, i1*, %struct.SelTupleOut*, %struct.node*, i32)

define void @top_hw_stub_wrapper(i20*, i3*, i1*, i32*, i4*, i1*, %struct.SelTupleOut*, %struct.node*, i32) #6 {
entry:
  %9 = alloca %"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"
  %10 = alloca %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"
  call void @copy_out(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %9, i20* %0, i3* %1, i1* %2, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %10, i32* %3, i4* %4, i1* %5, %struct.SelTupleOut* null, %struct.SelTupleOut* %6, %struct.node* null, %struct.node* %7)
  call void @top_hw_stub(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %9, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %10, %struct.SelTupleOut* %6, %struct.node* %7, i32 %8)
  call void @copy_in(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"* %9, i20* %0, i3* %1, i1* %2, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"* %10, i32* %3, i4* %4, i1* %5, %struct.SelTupleOut* null, %struct.SelTupleOut* %6, %struct.node* null, %struct.node* %7)
  ret void
}

declare void @top_hw_stub(%"class.hls::stream<qdma_axis<20, 0, 0, 0>, 0>"*, %"class.hls::stream<qdma_axis<32, 0, 0, 0>, 0>"*, %struct.SelTupleOut*, %struct.node*, i32)

declare i1 @fpga_fifo_not_empty_12(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare void @fpga_fifo_pop_12(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_12(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
!7 = distinct !{!7, !6}
