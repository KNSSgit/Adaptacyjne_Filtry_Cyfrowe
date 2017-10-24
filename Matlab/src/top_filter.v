`timescale 1ns/1ps

module High_pas_top
 	#(parameter COEF_SIZE=20,
	  parameter DATA_SIZE=24)
	(input [DATA_SIZE-1:0] data_in,
	  input reset,
	  input clk,
	  input sample_trig,
	  output filter_end,
	  output [DATA_SIZE-1:0] data_out
 	 );

wire [DATA_SIZE-1:0] data_connection_1;
wire filter_done_first;

filter_sos
	 #(.COEF_SIZE(COEF_SIZE),
 	   .DATA_SIZE(DATA_SIZE),
 	  .B0(20'd262144),
	  .B1(20'd635259),
	  .B2(20'd262144),
	  .A1(20'd642809),
	  .A2(20'd161170),
	  .GAIN(20'd76281))
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
	  .B1(20'd545159),
	  .B2(20'd262144),
	  .A1(20'd562108),
	  .A2(20'd235500),
	  .GAIN(20'd76281))
	sos_stage_2 (
 	 .data_in(data_connection_1),
	 .reset(reset),
	 .clk(clk),
	 .data_out(data_out),
	 .sample_trig(filter_done_first),
	 .filter_done(filter_end)
	);
endmodule