`timescale 1ns/1ps

module top_filter
 	#(parameter COEF_SIZE=32,
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
 	  .B0(32'd1073741824),
	  .B1(32'd2173828328),
	  .B2(32'd1073742031),
	  .A1(32'd2190775733),
	  .A2(32'd1058930091),
	  .GAIN(32'd1066609849))
	sos_stage_1 (
 	 .data_in(data_in),
	 .reset(reset),
	 .clk(clk),
	 .data_out(data_connection_1),
	 .sample_trig(sample_trig),
	 .filter_done(filter_done_first)
	);
filter_sos
	 #(.COEF_SIZE(COEF_SIZE),
 	   .DATA_SIZE(DATA_SIZE),
 	  .B0(32'd1073741824),
	  .B1(32'd2173828730),
	  .B2(32'd1073741617),
	  .A1(32'd2185151600),
	  .A2(32'd1060120745),
	  .GAIN(32'd1066609849))
	sos_stage_2 (
 	 .data_in(data_connection_1),
	 .reset(reset),
	 .clk(clk),
	 .data_out(data_out),
	 .sample_trig(filter_done_first),
	 .filter_done(filter_done_second)
	);
endmodule