`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module filtr_top#(
    parameter COEF_SIZE = 25, 
    parameter DATA_SIZE = 25)(
input [DATA_SIZE-2:0] data_in,
output [DATA_SIZE-2:0] data_out,
input  reset,clk,
input  sample,
output filter_done);


filtr_a
  #(.DATA_SIZE(DATA_SIZE),
    .COEF_SIZE(COEF_SIZE),
    .A(25'd8388608),
    .R(25'd8388608),
    .R2(25'd8388608),
    .R3(25'd8388608),
    .U(25'd8388608))
     notch(
.data_in(data_in),
.reset(reset),
.clk(clk),
.sample_trig(sample),
.data_out(data_out),
.filter_done(filter_done)

);

endmodule
