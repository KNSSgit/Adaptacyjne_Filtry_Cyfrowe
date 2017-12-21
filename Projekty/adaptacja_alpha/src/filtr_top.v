`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module filtr_top#(
    parameter COEF_SIZE = 31, 
    parameter DATA_SIZE = 31)(
input signed [24:0] data_in,
output signed [24:0] data_out,
input  reset,clk,
input  sample,
output filter_done);


filtr_a
  #(.DATA_SIZE(DATA_SIZE),
    .COEF_SIZE(COEF_SIZE),
    .A(31'd1054722904),
    .R(31'd536334041),
    .R2(31'd535797707),
    .R3(31'd536),
    .U(31'd1))
     notch(
.data_in(data_in),
.reset(reset),
.clk(clk),
.sample_trig(sample),
.data_out(data_out),
.filter_done(filter_done)

);

endmodule
