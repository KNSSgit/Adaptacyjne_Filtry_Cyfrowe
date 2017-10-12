`timescale 1us / 1ps

module filtr_tb
#(parameter COEF_SIZE = 32, 
  parameter DATA_SIZE = 24)
();


reg [DATA_SIZE-1:0] data_in;
wire [DATA_SIZE-1:0] data_out;

reg clk, clk_2khz;
reg reset;
reg sample;

reg [DATA_SIZE-1:0] data[0:199];

 top_filter f
       (.data_in(data_in),
        .data_out(data_out),
        .sample_trig(sample),
        .clk(clk),
        .reset(reset)
       );



initial $readmemh("G:/Users/Adrian/Documents/GitHub/Adaptacyjne_Filtry_Cyfrowe/HighPass/matlab/sinus.txt",data);

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
