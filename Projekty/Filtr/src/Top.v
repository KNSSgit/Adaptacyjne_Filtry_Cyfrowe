`timescale 1ns / 1ps

module Top
#(parameter n=16,k=24)(
input clk,
input reset_n,
input enable,
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
wire[23:0] audio_o;
wire ready;
wire reset;
wire filter_done;

Audio_Codec_Wrapper audio_codec (
.L_bus_in(R_bus_in),
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

    Notch_top filtr_notch (
        .data_in(R_bus_out),
        .reset(reset),
        .clk(clk),
        .sample_trig(ready),
        .data_out(audio_o)
        //.filter_done(filter_done)
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
	       if (enable==1) begin
		      L_bus_in <= audio_o;
		      R_bus_in <= audio_o;
		      end
		   else begin
		      L_bus_in<=R_bus_out;
		      R_bus_in<=R_bus_out;
		      end
	    end 
	end


endmodule