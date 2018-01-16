module notch_top2#(
    parameter COEF_SIZE = 40, 
    parameter DATA_SIZE = 24)(
input  [DATA_SIZE-1:0] data_in,
output [DATA_SIZE-1:0] data_out,
input  reset,clk,
input  sample,
output filter_done,
input [COEF_SIZE-1:0]a);


filtr
  #(.DATA_SIZE(DATA_SIZE),
    .COEF_SIZE(COEF_SIZE),
    .R(24'd4173332),
    .R2(40'd272135999822))
     notch(
.data_in(data_in),
.reset(reset),
.clk(clk),
.sample_trig(sample),
.data_out(data_out),
.a(a),
.filter_done(filter_done));

endmodule