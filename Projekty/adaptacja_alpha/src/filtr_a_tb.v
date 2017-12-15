`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module filtr_a_tb
#(parameter DATA_SIZE=25,COEF_SIZE=25)();
reg [DATA_SIZE-2:0] data_in;
wire [DATA_SIZE-2:0] data_out;
reg reset,clk;
reg sample;
wire filter_done;
integer i; 
reg [DATA_SIZE-1:0] data[0:199];
reg clk, clk_2khz;

filtr_top f(
.data_in(data_in),
.reset(reset),
.clk(clk),
.sample(sample),
.data_out(data_out),
.filter_done(filter_done)
);

initial $readmemh("C:\KNSS_GIT\Adaptacyjne_Filtry_Cyfrowe\Matlab\sygnaly\sinus.txt",data);
integer i;
always
begin
#500clk_2khz=!clk_2khz;

end

always
begin
#10clk=!clk;

end

initial
begin
clk_2khz=1;
clk=1;
i=0;
reset=1;
#500 reset=0;
end
always@(posedge clk_2khz) begin
         //$display("%d:%h",i,data[i]);
         data_in=data[i];
         i=i+1;
         if (i>199) i=0;
        sample=1;
        #50
        sample=0;
        
    end

endmodule
