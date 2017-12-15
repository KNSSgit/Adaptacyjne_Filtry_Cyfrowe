// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Thu Dec 14 20:59:16 2017
// Host        : DESKTOP-A13IS9B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/KNSS/Adaptacyjne_Filtry_Cyfrowe/Projekty/Filtr/Filtry.srcs/sources_1/ip/mult_gen_0/mult_gen_0_stub.v
// Design      : mult_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_13,Vivado 2017.3" *)
module mult_gen_0(CLK, A, B, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[24:0],B[24:0],P[49:0]" */;
  input CLK;
  input [24:0]A;
  input [24:0]B;
  output [49:0]P;
endmodule
