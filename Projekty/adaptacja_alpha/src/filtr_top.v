`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module filtr_top#(
    parameter COEF_SIZE = 5, 
    parameter DATA_SIZE = 5)(
input [DATA_SIZE-1:0] data_in,
output [DATA_SIZE-1:0] data_out,
input  reset,clk,
input  sample,
output filter_done);


filtr_a
  #(.DATA_SIZE(DATA_SIZE),
    .COEF_SIZE(COEF_SIZE),
    .A(5'd8),
    .R(5'd8),
    .R2(5'd8),
    .R3(5'd8),
    .U(5'd8))
     notch(
.data_in(data_in),
.reset(reset),
.clk(clk),
.sample_trig(sample),
.data_out(data_out),
.filter_done(filter_done)

);

endmodule
