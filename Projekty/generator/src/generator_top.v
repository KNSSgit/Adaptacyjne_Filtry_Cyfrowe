`timescale 1ns / 1ps


module generator_top
#(parameter n=16,k=24)(
input clk,
input reset_n,
output ac_mclk,
input ac_adc_sdata,
output  ac_dac_sdata,
output ac_bclk,
output ac_lrclk,
inout  scl,
inout sda,
input [3:0] sw
);

reg[23:0] L_bus_in, R_bus_in;
wire[23:0] L_bus_out, R_bus_out;
wire ready;
wire reset;


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

wire [23:0] sinus_out;
wire [23:0] sinus_zabrudzony_out;
wire [23:0] ekg_out;
wire [23:0] ekg_zabrudzony_out;

reg [23:0] wyjscie_do_dac;


gen_sinus gen_sinus_inst(
.data_out(sinus_out),
.clk(clk),
.reset(reset)
);

gen_sinus_zabrudzony gen_sinus_zabrudzony_inst(
.data_out(sinus_zabrudzony_out),
.clk(clk),
.reset(reset)
);

gen_ekg gen_ekg_inst(
.data_out(ekg_out),
.clk(clk),
.reset(reset)
);

gen_ekg_zabrudzony gen_ekg_zabrudzony_inst(
.data_out(ekg_zabrudzony_out),
.clk(clk),
.reset(reset)
);


always @(posedge clk)
    begin
        case(sw)
            4'b0001 : wyjscie_do_dac <= sinus_out;
            4'b0010 : wyjscie_do_dac <= sinus_zabrudzony_out;
            4'b0100 : wyjscie_do_dac <= ekg_out;
            4'b1000 : wyjscie_do_dac <= ekg_zabrudzony_out;
            default : wyjscie_do_dac <= 24'b0;
        endcase
    end


    
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
            L_bus_in <= wyjscie_do_dac;
            R_bus_in <= wyjscie_do_dac;
            end 
        end
        
endmodule