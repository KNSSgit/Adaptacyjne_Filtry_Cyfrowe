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

sos stage1(
    .audio_in(audio_in),
    .reset(reset),
    .clk(clk),
    .b0(16'd16384),
    .b1(16'd32767),
    .b2(16'd16384),
    .a1(16'd6054),
    .a2(16'd3208),
    .audio_out(audio_out),
    .sample_trig(sample_trig),
    .gain(16'd6412)
    );
  
/* sos stage2(
        .audio_in(audio_in_2),
        .reset(reset),
        .lr_clk(lr_clk),
        .b0(16'd16384),
        .b1(16'd49513),
        .b2(16'd16384),
        .a1(16'd50888),
        .a2(16'd10143),
        .audio_out(audio_in_3),
        .gain(16'd10389)
        );
      
   
 sos stage3(
               .audio_in(audio_in_3),
               .reset(reset),
               .lr_clk(lr_clk),
                   .b0(16'd16384),
                   .b1(16'd42948),
                   .b2(16'd16384),
                   .a1(16'd43364),
                   .a2(16'd14675),
                   .audio_out(audio_out),
                   .gain(16'd10389)
                   );
               
           */ 
endmodule