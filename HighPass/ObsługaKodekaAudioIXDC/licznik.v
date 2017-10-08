`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2017 11:14:12
// Design Name: 
// Module Name: licznik
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


module licznik(
    input clk,
    input reset,
    output reg out
    );
    reg [63:0] licz;
     
     
     always@(posedge clk)
     begin
        if(reset)
            licz=64'd0;
        else
            begin
            licz=licz+1;
            if (licz>64'd5000)
                out=1;
            else
                out=0;
            if(licz==64'd10000)
                licz=0;
            end
     end
     
     
endmodule
