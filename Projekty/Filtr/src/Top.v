`timescale 1ns / 1ps

module Top
#(parameter n=16,k=24)(
input clk,
input reset_n,
input [2:0] enable,
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
wire[23:0] out_1,out_2,out_3;
reg [23:0] out_1_n,out_2_n,out_3_n;
wire ready;
wire reset;
wire filter_end_1,filter_end_2,filter_end_3;

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
        .data_out(out_1),
        .filter_end(filter_end_1)
    );
    
        HighPass_top filtr_HighPass (
        .data_in(out_1_n),
        .reset(reset),
        .clk(clk),
        .sample_trig(filter_end_1),
        .data_out(out_2),
        .filter_end(filter_end_2)
    );
    
        LowPass_top filtr_LowPass (
        .data_in(out_2_n),
        .reset(reset),
        .clk(clk),
        .sample_trig(filter_end_2),
        .data_out(out_3),
        .filter_end(filter_end_3)
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
	    if(enable==0) begin
            L_bus_in<=R_bus_out;
            R_bus_in<=R_bus_out;
            end
         else begin
           L_bus_in <= out_3_n;
           R_bus_in <= out_3_n;
	       if (enable[0]==1) begin
		      out_1_n<=out_1;
		   end
		   else begin
		      out_1_n<=R_bus_out;
		   end
		    
	        if (enable[1]==1) begin
                    out_2_n<=out_2;
                 end
                 else begin
                    out_2_n<=out_1_n;	
                 end	      
	        if (enable[2]==1) begin
                    out_3_n<=out_3;
                end  
                else begin
                    out_3_n<=out_2_n;                       
                end       		     
		   end   

	    end 
	end


endmodule
