`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Ko³o Naukowe Systemów Scalonych
// 10.2017
// 
// Module: filtr_notch
// Project: Adaptacyjne filtry cyfrowe do kondycjonowania sygna³ów biomedycznych 
// Target Device: Nexys Video Artix 7 (XC7A200T-1SBG484C)
// 
// Version: 0.01
//////////////////////////////////////////////////////////////////////////////////


module filtr_sos 
    #(parameter COEF_SIZE = 32, 
                DATA_SIZE = 24,
                B0 = 32'b00000000000000000000000000000000000,
                B1 = 32'b00000000000000000000000000000000000,
                B2 = 32'b00000000000000000000000000000000000,
                A1 = 32'b00000000000000000000000000000000000,
                A2 = 32'b00000000000000000000000000000000000)(
    input clock,
    input reset,
    input [DATA_SIZE-1:0] data_in,
    output [DATA_SIZE-1:0] data_out
);



endmodule
