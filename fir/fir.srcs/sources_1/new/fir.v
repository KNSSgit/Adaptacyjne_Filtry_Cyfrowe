`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Kolo Naukowe Systemow Scalonych
// 10.2017
// 
// Modul: fir
// Projekt: Adaptacyjne filtry cyfrowe do kondycjonowania sygnalow biomedycznych 
// Model urzadzenia: Nexys Video Artix 7 (XC7A200T-1SBG484C)
// 
// Wersja: 0.1
//////////////////////////////////////////////////////////////////////////////////


module fir 
    #(parameter COEF_SIZE = 20, 
      parameter DATA_SIZE = 24,
      parameter signed COEF1 = 20'b0,
      parameter signed COEF2 = 20'b0,
      parameter signed COEF3 = 20'b0,
      parameter signed COEF4 = 20'b0,
      parameter signed COEF5 = 20'b0,
      parameter signed COEF6 = 20'b0)
    ( input signed [DATA_SIZE-1:0] data_in,
      output signed [DATA_SIZE-1:0] data_out,
      
      input clk,
      input reset
    );
    
    reg signed [DATA_SIZE-1:0] delay [0:5];
    reg signed [DATA_SIZE-1:0] out;
    wire signed [DATA_SIZE+COEF_SIZE-1:0] product [0:5];
    wire signed [DATA_SIZE+COEF_SIZE-1:0] sum;
    
    always @(posedge clk or posedge reset)
        begin
            if(reset)
                begin
                    delay[0] <= 24'b0;
                    delay[1] <= 24'b0;
                    delay[2] <= 24'b0;
                    delay[3] <= 24'b0;
                    delay[4] <= 24'b0;
                    delay[5] <= 24'b0;
                    out <= 24'b0;
                end
            else
                begin
                    delay[0] <= data_in;
                    delay[1] <= delay[0];
                    delay[2] <= delay[1];
                    delay[3] <= delay[2];
                    delay[4] <= delay[3];
                    delay[5] <= delay[4];
                    out <= sum[DATA_SIZE+COEF_SIZE-1:COEF_SIZE];
                end
        end
        
        assign product[0] = delay[0] * COEF1;
        assign product[1] = delay[1] * COEF2;
        assign product[2] = delay[2] * COEF3;
        assign product[3] = delay[3] * COEF4;
        assign product[4] = delay[4] * COEF5;
        assign product[5] = delay[5] * COEF6;
        assign sum = product[0] + product[1] + product[2] + product[3] + product[4] + product[5];
        assign data_out = out;
        
    
endmodule
