`timescale 1ns/1ps

module top_filter
 	#(parameter COEF_SIZE=10,
	  parameter DATA_SIZE=24)
	(input [DATA_SIZE-1:0] data_in,
	  input reset,
	  input clk,
	  input sample_trig,
	  output [DATA_SIZE-1:0] data_out
 	 );

wire [DATA_SIZE-1:0] data_connection_1;
wire filter_done_first;

filter_sos
	 #(.COEF_SIZE(COEF_SIZE),
 	   .DATA_SIZE(DATA_SIZE),
 	  .B0(10'd256),
	  .B1(10'd546),
	  .B2(10'd256),
	  .A1(10'd536),
	  .A2(10'd233),
	  .GAIN(10'd8))
	sos_stage_1 (
 	 .data_in(data_in),
	 .reset(reset),
	 .clk(clk),
	 .data_out(data_out),
	 .sample_trig(sample_trig),
	 .filter_done(filter_done_first)
	);
endmodule