`timescale 1ns/1ps

module LowPass_top
 	#(parameter COEF_SIZE=20,
	  parameter DATA_SIZE=24)
	(input [DATA_SIZE-1:0] data_in,
	  input reset,
	  input clk,
	  input sample_trig,
	  output filter_end,
	  output [DATA_SIZE-1:0] data_out
 	 );

wire [DATA_SIZE-1:0] data_connection_1, data_connection_2;
wire filter_done_first, filter_done_second;

filter_sos
	 #(.COEF_SIZE(COEF_SIZE),
 	   .DATA_SIZE(DATA_SIZE),
 	  .B0(20'd262144),
	  .B1(20'd117234),
	  .B2(20'd262144),
	  .A1(20'd640719),
	  .A2(20'd159479),
	  .GAIN(20'd15729))
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
 	  .B0(20'd262144),
	  .B1(20'd707092),
	  .B2(20'd262144),
	  .A1(20'd613089),
	  .A2(20'd187091),
	  .GAIN(20'd15729))
	sos_stage_2 (
 	 .data_in(data_connection_1),
	 .reset(reset),
	 .clk(clk),
	 .data_out(data_connection_2),
	 .sample_trig(filter_done_first),
	 .filter_done(filter_done_second)
	);
filter_sos
	 #(.COEF_SIZE(COEF_SIZE),
 	   .DATA_SIZE(DATA_SIZE),
 	  .B0(20'd262144),
	  .B1(20'd630876),
	  .B2(20'd262144),
	  .A1(20'd567088),
	  .A2(20'd233617),
	  .GAIN(20'd15729))
	sos_stage_3 (
 	 .data_in(data_connection_2),
	 .reset(reset),
	 .clk(clk),
	 .data_out(data_out),
	 .sample_trig(filter_done_second),
	 .filter_done(filter_end)
	);
endmodule