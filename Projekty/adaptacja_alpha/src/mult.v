`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module mult
    #(parameter COEF_SIZE = 25)
    (
    input [COEF_SIZE-1:0] in_1,
    input [COEF_SIZE-1:0] in_2,
    output [(COEF_SIZE+COEF_SIZE)-1:0] out
    );
    
    assign out=in_1*in_2;
endmodule
