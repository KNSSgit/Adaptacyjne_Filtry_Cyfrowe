`timescale 1ns / 1ps

module filtr_tb
#(parameter n=16,k=24)();
reg [23:0] audio_in;
wire [23:0] audio_out;
reg clk_6khz,reset,clk;
reg sample;
filtr f(
.audio_in(audio_in),
.reset(reset),
.clk(clk),
.sample_trig(sample),
.audio_out(audio_out)
);
reg [23:0] data[0:599];

initial $readmemh("G:/Users/Adrian/Documents/GitHub/Adaptacyjne_Filtry_Cyfrowe/HighPass/matlab/sinus.txt",data);

integer i;
always
begin
#166clk_6khz=!clk_6khz;

end

always
begin
#10clk=!clk;

end

initial
begin
clk_6khz=1;
clk=1;
i=0;
reset=1;
#166 reset=0;
end
always@(posedge clk_6khz) begin
         //$display("%d:%h",i,data[i]);
         audio_in=data[i];
         i=i+1;
         if (i>599) i=0;
        sample=1;
        #50
        sample=0;
        
    end

endmodule
