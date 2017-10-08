`timescale 1ns / 1ps

module sos 
    #(parameter n=16,k=24)(
    input   [k-1:0] audio_in,  //tu wcze?niej by?o signed jak si? zacznie pierdoli? to zacz?? od tego!
    input reset,
    input clk,
    input sample_trig,
    input signed [n-1:0] b0,b1,b2,a1,a2,gain,
    output reg filter_done,
    output  signed [k-1:0]  audio_out   //tu wcze?niej by?o signed jak si? zacznie pierdoli? to zacz?? od tego !
    );
    
  //resestry opóznijace///////////////////
      reg signed [n+k-1+4:0] R1_rej,R2_rej,R3_rej;
      reg signed [k-1:0] R4_rej;
      ////////////////////////////////////////
      wire signed [k:0] audio_in_dod;                                       // próba uniezaleznienia sie od mo?liwosci wystapienia ujemnego sygnalu (na razie)
    //  wire signed [43-14-3:0] R3_rej_shift;                              // rejestr R3 bez cz??ci u?amkowej 
      wire signed [n+k-1+4:0] R1,R2,R3;                                   // zmienne ktore obsluguja algorytm
      wire signed [n+k-1+4-(n-2):0] R1_s,R2_s,R3_s,R1_s2,R2_s2,R3_s2;    // rejestry sluzace do sprawdzania wyniku algorytmu z matlabem
      wire signed [n+k-1+4:0] b0_mult,b1_mult,b2_mult,a1_mult,a2_mult;   // "mnozarki" 
      wire signed [n+k-1+4+n:0] R4;                                       // rejestr R3 pomnozony przez liczbe g (normalizacja wyniku)
      
      //// sygna?y potrzebne do automatu stanow///
      reg st1,st2,st3;
      localparam idle=3'd0, S1 = 3'd1,S2 = 3'd2 ,S3 = 3'd3;
      reg [1:0] state_reg, state_next;
      ///////////////////////////////////////////
    
  ////////////////////////ustawienie prze?utników trzymaj?cych wynik pod dodawaniu kolejnych sk?adowych////////////////////
     always@(posedge clk)
        begin
     
            if (reset==1'b1)
                begin
                    R1_rej<=0;
                    R2_rej<=0;
                    R3_rej<=0;
                    R4_rej<=0;
                    
                end
                else if(st1)
                    R3_rej<=R3;  
                 else if(st2) begin
                    R1_rej<=R1;
                    R4_rej<=R4>>(2*n-4);   
                    end  
                else if(st3)begin
                    R2_rej<=R2; 
                    
                    end
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
 //////////////////////////////mno?arki///////////////////////////////////////////////
 assign b0_mult=b0*audio_in_dod;
 assign b1_mult=b1*audio_in_dod;
 assign b2_mult=b2*audio_in_dod;
 
 assign a1_mult=(R3_rej>>(n-2))*a1;
 assign a2_mult=(R3_rej>>(n-2))*a2;

 ////////////////////////dodawanie sk?adników//////////////////////////////////////////
 assign R3=b0_mult+R1_rej;
 assign R1=R2_rej+b1_mult-a1_mult;
 assign R2=b2_mult-a2_mult;
 
////////////////////////operacje normalizacji i wypluwania odpowiedniego wyniku////////
 assign R4=(R3_rej*gain);
 assign audio_out=(R4_rej);
 //assign R3_rej_shift=R3_rej>>14;

 
 /*  do sprawdzenia liczb z matlabem
 
  assign R1_s=R1>>14;
 assign R2_s=R2>>14;
 assign R3_s=R3>>14;
 assign R1_s2=R1_rej>>14;
 assign R2_s2=R2_rej>>14;
 assign R3_s2=R3_rej>>14;
 */
 endmodule