// Name:	Adrian Oleksiak
// Date:	Wrzesien 2017
// File:    sos.v
// HW:	    Adaptacyjne Filtry 
// Pupr:	top scalajacy filtr (docelowo ma zawierać 3 instancje sos naraqzie do testow jedna)
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module filtr 
    #(parameter n=16,k=24)(
    input [k-1:0] audio_in,
    input reset,
    input clk,
    input sample_trig,
    output [k-1:0] audio_out
    );
    
wire [k-1:0] audio_in_2, audio_in_3;
wire filter_done1,filter_done2,filter_done3;
sos stage1(
    .audio_in(audio_in),
    .reset(reset),
    .clk(clk),
    .b0(16'd16384),
    .b1(16'd38201),
    .b2(16'd16384),
    .a1(16'd35207),
    .a2(16'd14121),
    .audio_out(audio_out),
    .sample_trig(sample_trig),
    .filter_done(filter_done1),
    .gain(16'd524)
    );
  
/* sos stage2(
        .audio_in(audio_in_2),
        .reset(reset),
        .clk(clk),
        .b0(16'd16384),
        .b1(16'd38201),
        .b2(16'd16384),
        .a1(16'd36412),
        .a2(16'd13130),
        .sample_trig(filter_done1),
        .filter_done(filter_done2),
        .audio_out(audio_in_3),
        .gain(16'd851)
        );
      
   
 sos stage3(
               .audio_in(audio_in_3),
               .reset(reset),
               .clk(clk),
                   .b0(16'd16384),
                   .b1(16'd35797),
                   .b2(16'd16384),
                   .a1(16'd34358),
                   .a2(16'd15186),
                   .sample_trig(filter_done2),
                   .filter_done(filter_done3),
                   .audio_out(audio_out),
                   .gain(16'd851)
                   );
               
  */          
endmodule