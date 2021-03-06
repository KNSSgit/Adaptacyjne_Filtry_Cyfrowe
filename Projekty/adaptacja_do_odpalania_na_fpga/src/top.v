`timescale 1ns / 1ps

module top
#(parameter n=35,k=24)(
input  clk,
input  reset_n,
input  ac_adc_sdata,
inout  scl,
inout  sda,
input  sw,
output ac_mclk,
output ac_dac_sdata,
output ac_bclk,
output ac_lrclk
);
reg[23:0] L_bus_in, R_bus_in;
wire[23:0] L_bus_out,R_bus_out;
wire ready;
wire reset;
wire [k-1:0] audio_in_2, audio_in_3;
wire filter_done,filter_done2,filter_done3;
wire clk1_10;
wire [23:0] wejscie;
wire [23:0] wyjscie;
reg  [23:0] wyjscie_do_dac;
reg  [15:0] licznik;
reg  sample;

Audio_Codec_Wrapper audio_codec (           // instancja obs�ugi kodeka audio
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
.clk10(clk1_10),                        // zegar id�cy do filtra !! do poprawy
.reset_n(reset_n));

always @*
    begin
        if(sw)
            begin
            wyjscie_do_dac = wyjscie;
            end
        else
            begin
            wyjscie_do_dac = wejscie;
            end
    end // always

gen_sinus gen(
    .data_out(wejscie),
    .clk(clk1_10),
    .reset(reset));

notch_top notch_inst(
    .data_in(wejscie),
    .data_out(wyjscie),
    .sample(sample),
    .clk(clk1_10),
    .reset(reset));

always @(posedge clk1_10)       // ustawia sygna� sample co 2Khz
    begin
        if(licznik == 16'd5000)
            begin
                licznik <= 16'b0;
                sample <= 1;
            end // begin (if)
        else
            begin
               licznik <= licznik + 16'd1;
               sample <= 0;
            end // else
    end // always

always@(posedge clk)
    begin
        if (clk) 
            if (reset_n ==0) 
            begin
                L_bus_in <=24'd0;
                R_bus_in <= 24'd0;
            end // begin (if)           
            else if (ready == 1)
            begin
                L_bus_in <= wyjscie_do_dac;
                R_bus_in <= wyjscie_do_dac;
            end // else if
    end // always
assign reset= ! reset_n;                        // reset aktywny wysoki
      
endmodule