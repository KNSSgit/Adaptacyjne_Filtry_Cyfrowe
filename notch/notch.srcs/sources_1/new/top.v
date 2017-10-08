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


module top #(parameter COEF_SIZE = 32, DATA_SIZE = 24)(
    input clock,
    input reset,
    input [DATA_SIZE-1:0] data_in,
    output [DATA_SIZE-1:0] data_out
);
    
wire [DATA_SIZE-1:0] connection;
    
filtr_sos #(.COEF_SIZE(COEF_SIZE),
            .DATA_SIZE(DATA_SIZE),
            .B0(32'b01000000000000000000000000000000),
            .B1(32'b10000001100100011111110011101000),
            .B2(32'b01000000000000000000000011001111),
            .A1(32'b10000010100101001001010110110011),
            .A2(32'b00111111000111011111110110101011)
            ) sos_pierwszy (
    .clock(clock),
    .reset(reset),
    .data_in(data_in),
    .data_out(connection)
);
    
    
filtr_sos #(.COEF_SIZE(COEF_SIZE),
            .DATA_SIZE(DATA_SIZE),
            .B0(32'b01000000000000000000000000000000),
            .B1(32'b10000001100100011111111001111010),
            .B2(32'b00111111111111111111111100110001),
            .A1(32'b10000010001111101100010001110000),
            .A2(32'b00111111001100000010100010101001)
            ) sos_drugi (
    .clock(clock),
    .reset(reset),
    .data_in(connection),
    .data_out(data_out)
);
    
endmodule
