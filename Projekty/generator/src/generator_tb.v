`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Kolo Naukowe Systemow Scalonych
// 10.2017
// 
// Modul: generator_tb
// Projekt: Adaptacyjne filtry cyfrowe do kondycjonowania sygnalow biomedycznych 
// Model urzadzenia: Nexys Video Artix 7 (XC7A200T-1SBG484C)
// 
// Wersja: 0.1
//////////////////////////////////////////////////////////////////////////////////


module generator_tb();
    
    reg clk;
    reg reset;
    wire [23:0] data_out;
    
    gen_ekg_60 generator_inst(
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
        
    always #50 clk = !clk;
    
endmodule
