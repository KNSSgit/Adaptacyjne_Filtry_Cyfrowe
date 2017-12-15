`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module filtr_a_tb
#(parameter DATA_SIZE=25,COEF_SIZE=25)();
reg [DATA_SIZE-2:0] data_in;
wire [DATA_SIZE-2:0] data_out;
reg reset,clk;
reg sample;
wire filter_done;

filtr_top f(
.data_in(data_in),
.reset(reset),
.clk(clk),
.sample(sample),
.data_out(data_out),
.filter_done(filter_done)

);

always
begin
#10clk=!clk;

end

initial
begin

clk=1;
reset=1;
sample=1;
#30 reset=0;
sample=1;
data_in=1;
#20 sample=0;
#100sample=1;
#20 sample=0;
#100sample=1;
#20 sample=0;
#100sample=1;
#20 sample=0;
end
endmodule
