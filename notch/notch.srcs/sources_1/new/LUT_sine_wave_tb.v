`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Kolo Naukowe Systemow Scalonych
// 10.2017
// 
// Modul: LUT_sine_wave_tb
// Projekt: Adaptacyjne filtry cyfrowe do kondycjonowania sygnalow biomedycznych 
// Model urzadzenia: Nexys Video Artix 7 (XC7A200T-1SBG484C)
// 
// Wersja: 0.1
//////////////////////////////////////////////////////////////////////////////////


module LUT_sine_wave_tb();
    
    reg clk;
    reg reset;
    wire [23:0] data_out;
    
    LUT_sine_wave LUT_sine_wave_inst(
        .data_out(data_out),
        .clk(clk),
        .reset(reset)
        );
         
    initial
        begin
            clk = 0;
            reset = 1;
            #100 reset = 0;
        end
        
    always #10 clk = !clk;
    
endmodule
