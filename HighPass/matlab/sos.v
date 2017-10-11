`timescale 1ns / 1ps

module sos 
    #(parameter n=16,k=24)(
    input   [k-1:0] audio_in,  //tu wcześniej było signed jak się zacznie pierdolić to zacząć od tego!
    input reset,
    input clk,
    input sample_trig,
    input signed [n-1:0] b0,b1,b2,a1,a2,gain,
    output reg filter_done,
    output signed [k-1:0]  audio_out   //tu wcześniej było signed jak się zacznie pierdolić to zacząć od tego !
    );
    
    //resestry opóźnijące
    reg signed [n+k-1:0] R1_reg,R2_reg,R3_reg;
    wire signed [k-1:0] audio_in_dod;        // dodałem żeby ta ujemna amplituda się nie wpieprzała 
    wire signed [k:0] R3_reg_shift;       // rejestr R3 bez części ułamkowej 
    wire signed [n+k-1:0] R1,R2,R3;
    wire signed [k-1+2:0] R1_s,R2_s,R3_s,R1_s2,R2_s2,R3_s2;
    wire signed [n+k-1:0] b0_mult,b1_mult,b2_mult,a1_mult,a2_mult;  // "mnożarki" 
    wire signed [n+k+n-1:0] R4;         // rejestr R3 pomnożony przez liczbę g
  
    reg st1,st2,st3;
    localparam idle=3'd0, S1 = 3'd1,S2 = 3'd2 ,S3 = 3'd3;
    reg [1:0] state_reg, state_next;

    
  ////////////////////////ustawienie przeżutników trzymających wynik pod dodawaniu kolejnych składowych////////////////////
     always@(posedge clk)
        begin
     
            if (reset==1'b1)
                begin
                    R1_reg<=0;
                    R2_reg<=0;
                    R3_reg<=0;
                end
                else if(st1)
                    R3_reg=R3;  
                 else if(st2)
                    R1_reg=R1;     
                else if(st3)
                    R2_reg=R2; 
        
        end
        
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    /////////////////////////////// automat stanów/////////////////////////////////////////////////
  always@(posedge clk)
   begin
    if(reset)
      state_reg <= idle;
    else
      state_reg <= state_next;
    end
    
    always@* begin
    st1=1'b0;
    st2=1'b0;
    st3=1'b0;
    filter_done=1'b0;
    state_next = state_reg; 
    case(state_reg)
        idle:begin
             if(sample_trig == 1) 
                state_next = S1;
            else
                state_next = idle;
            end
        S1:begin
            st1=1'b1;
            state_next=S2;
            end
        S2: begin
            st2=1'b1;
            state_next=S3;
            filter_done=1'b1;
            end
        S3:begin
            st3=1'b1;
            state_next=idle;
            end
     endcase
 end

 /////////////////////
 assign audio_in_dod={1'd0,audio_in};
 //////////////////////////////mnożarki///////////////////////////////////////////////
 assign b0_mult=b0*audio_in_dod;
 assign b1_mult=b1*audio_in_dod;
 assign b2_mult=b2*audio_in_dod;
 
 assign a1_mult=(R3_reg_shift)*a1;
 assign a2_mult=(R3_reg_shift)*a2;

 ////////////////////////dodawanie składników//////////////////////////////////////////
 assign R3=b0_mult+R1_reg;
 assign R1=R2_reg+b1_mult-a1_mult;
 assign R2=b2_mult-a2_mult;
 
////////////////////////operacje normalizacji i wypluwania odpowiedniego wyniku////////
 assign R4=(R3_reg*gain);
 assign audio_out=(R4)>>(28);
 assign R3_reg_shift=R3_reg>>14;
 
 /*  do sprawdzenia części ułamkowych
 */
  assign R1_s=R1>>14;
 assign R2_s=R2>>14;
 assign R3_s=R3>>14;
 assign R1_s2=R1_reg>>14;
 assign R2_s2=R2_reg>>14;
 assign R3_s2=R3_reg>>14;
 
 endmodule
