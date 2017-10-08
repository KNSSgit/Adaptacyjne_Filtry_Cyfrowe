`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2017 12:17:40
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top
#(parameter n=16,k=24)(
input clk,
input reset_n,
output ac_mclk,
input ac_adc_sdata,
output  ac_dac_sdata,
output ac_bclk,
output ac_lrclk,
inout  scl,
inout sda

);

reg[23:0] L_bus_in, R_bus_in;
wire[23:0] L_bus_out,R_bus_out;
wire ready;
wire reset;

 wire [k-1:0] audio_in_2, audio_in_3;
wire filter_done,filter_done2,filter_done3;

Audio_Codec_Wrapper audio_codec (
.L_bus_in(L_bus_in),
.R_bus_in(R_bus_in),
.L_bus_out( L_bus_out),
.R_bus_out(R_bus_out),
.ready(ready),
.ac_mclk(ac_mclk),
.ac_adc_sdata(ac_adc_sdata),
.ac_dac_sdata( ac_dac_sdata),
.ac_bclk(ac_bclk),
.ac_lrclk(ac_lrclk),
.scl(scl),
.sda(sda),
.clk(clk),
.reset_n(reset_n)


);


   

       

    
  

    
    assign reset= ! reset_n;

    
      always@(posedge clk)
        begin
        if (clk) 
            if (reset_n ==0) 
            begin
            L_bus_in <=24'd0;
            R_bus_in <= 24'd0;
            end            
            else if (ready == 1)
            begin
            L_bus_in <= L_bus_out;
            R_bus_in <= R_bus_out;
            end 
        end
        
endmodule
