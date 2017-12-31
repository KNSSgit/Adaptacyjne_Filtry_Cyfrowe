`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////



module filtr_top#(
    parameter COEF_SIZE = 40, 
    parameter DATA_SIZE = 24)(
input [DATA_SIZE-1:0] data_in,
output [DATA_SIZE-1:0] data_out,

input  reset,clk,
input  sample,
output filter_done);


filtr_a
  #(.DATA_SIZE(DATA_SIZE),
    .COEF_SIZE(COEF_SIZE),
    .A(40'd545420825091),
    .R(24'd4183818),
    .R2(40'd273505235396),
    .R3(35'd274),
    .R4(35'd275),
    .U (35'd2749))
     notch(
.data_in(data_in),
.reset(reset),
.clk(clk),
.sample_trig(sample),
.data_out(data_out),
.filter_done(filter_done)


);

endmodule
