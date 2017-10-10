`timescale 1ns/1ps

module top_filter
 	 #(parameter n=20,k=24)(
	 input [k-1:0] audio_in,
	 input reset,
	 input clk,
	 input sample_trig,
	 output [k-1:0] audio_out
 	 );

wire [k-1:0] audio_in_2;
wire filter_done_1;

sos stage1 (
 	 .audio_in(audio_in),
	 .reset(reset),
	 .clk(clk),
	 .b0(20'd262144),
	 .b1(20'd530720),
	 .b2(20'd262144),
	 .a1(20'd535557),
	 .a2(20'd257249),
	 .audio_out(audio_out),
	 .sample_trig(sample_trig),
	 .filter_done(filter_done_1),
	 .gain(20'd260917)
 	);

endmodule