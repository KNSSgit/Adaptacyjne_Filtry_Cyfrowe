`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Kolo Naukowe Systemow Scalonych
// 10.2017
// 
// Modul: notch_top
// Projekt: Adaptacyjne filtry cyfrowe do kondycjonowania sygnalow biomedycznych 
// Model urzadzenia: Nexys Video Artix 7 (XC7A200T-1SBG484C)
// 
// Wersja: 0.1
//////////////////////////////////////////////////////////////////////////////////


module notch_top 
    #(parameter COEF_SIZE = 20, 
      parameter DATA_SIZE = 24)
    ( input [DATA_SIZE-1:0] data_in,
      output [DATA_SIZE-1:0] data_out,
    
      input sample_trig,
    
      input clk,
      input reset  
    );
    
    wire [DATA_SIZE-1:0] connection;
    wire filter_done_first, filter_done_second;
    
    filter_sos 
        #(.COEF_SIZE(COEF_SIZE),
          .DATA_SIZE(DATA_SIZE),
          .B0(20'b01000000000000000000),
          .B1(20'b10000000001011001100),
          .B2(20'b01000000000000000000),
          .A1(20'b10000000011111000101),
          .A2(20'b00111111101101000101),
          .GAIN(20'b00111111110110111010))
        filter_sos_first 
        (.data_in(data_in),
         .data_out(connection),
         .sample_trig(sample_trig),
         .filter_done(filter_done_first),
         .clk(clk),
         .reset(reset)
        );
    

    filter_sos 
        #(.COEF_SIZE(COEF_SIZE),
          .DATA_SIZE(DATA_SIZE),
          .B0(20'b01000000000000000000),
          .B1(20'b10000000001011001100),
          .B2(20'b001000000000000000000),
          .A1(20'b10000000011011101001),
          .A2(20'b00111111101110100111),
          .GAIN(20'b00111111110110111010))
        filter_sos_second 
        (.data_in(connection),
         .data_out(data_out),
         .sample_trig(filter_done_first),
         .filter_done(filter_done_second),
         .clk(clk),
         .reset(reset)
        );
    
endmodule
