'timescale 1ns/1ps

module top_filter
 	 #(parameter n=32,k=24)(
	 input [k-1:0] audio_in,
	 input reset,
	 input clk,
	 input sample_trig,
	 input [k-1:0] audio_out,
 	 );

wire [k-1:0] audio_in_2;
wire filter_done_1;

sos stage1 (
 	 .audio_in(audio_in),
	 .reset(reset),
	 .clk(clk),
	 .b0(16'd16384),
	 .b1(16'd32768),
	 .b2(16'd16384),
	 .a1(16'd36544),
	 .a2(16'd12858),
	 .audio_out(audio_in_2),
	 .sample_trig(sample_trig),
	 .filter_done(filter_done_1),
	 .gain(16'd5)
 	);

sos stage2 (
 	 .audio_in(audio_in),
	 .reset(reset),
	 .clk(clk),
	 .b0(16'd16384),
	 .b1(16'd32768),
	 .b2(16'd16384),
	 .a1(16'd34594),
	 .a2(16'd14825),
	 .audio_out(audio_out),
	 .sample_trig(filter_done_1),
	 .filter_done(filter_done_2),
	 .gain(16'd5)
 	);

endmodule