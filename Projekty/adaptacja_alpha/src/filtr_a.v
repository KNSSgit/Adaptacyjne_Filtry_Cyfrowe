`timescale 1ns / 1ps

module filtr_a
    #(parameter COEF_SIZE = 5, 
      parameter DATA_SIZE = 5,
      parameter signed A = 5'd8,
      parameter signed R = 5'd8,           // tu dajesz r
      parameter signed R2 = 5'd8,          // tu dajesz r^2
      parameter signed R3 = 5'd8,          // tu b�dzie wyskalowanie r narazie nie wa�ne
      parameter signed U = 5'd8)           // u 
    ( input [DATA_SIZE-1:0] data_in,        // dane wchodz� 24 bitowe ale dodajemy do nich 1 bit by wykozystac 2 mnozarki
      output [DATA_SIZE-1:0] data_out,      // wychodz� dane 24 bit
      input sample_trig,
      output reg filter_done,
      input clk,
      input reset
      );
      
    reg signed [DATA_SIZE-1:0] r1_reg,r1_next;    // rejestry przechowuj�ce
    reg signed [COEF_SIZE+DATA_SIZE-1+1:0]  r2_reg,r2_next; 
    reg signed [DATA_SIZE-1:0] r3_reg,r3_next;              
    
    reg signed [COEF_SIZE+DATA_SIZE-1:0] z1_reg,z1_next; 
    reg signed [COEF_SIZE-1:0] z2_reg,z2_next;
    reg signed [COEF_SIZE+DATA_SIZE-1:0] z3_reg, z3_next; 
    //reg signed [COEF_SIZE+DATA_SIZE-1:0] z4_reg,z4_next;    // rejestry przechowuj�ce 
    //reg signed [COEF_SIZE+DATA_SIZE-1:0] z5_reg, z5_next;    // rejestry przechowuj�ce 
    reg signed [COEF_SIZE+DATA_SIZE-1:0] z6_reg,z6_next;    // rejestry przechowuj�ce 
                         
    //reg signed [COEF_SIZE+DATA_SIZE-1:0] x1;                // wyskalowane op�nione wej�cie
    //reg signed [DATA_SIZE-1:0] y1;                           // op�niene wyj�cie
      
    
    
    //reg signed [COEF_SIZE-1:0] a_prev;
    reg signed [COEF_SIZE-1:0] mult1_coef1,mult1_coef2,mult2_coef1,mult2_coef2;      // druty do mno�arek
    wire signed [COEF_SIZE+DATA_SIZE-1:0]  out_mult1,out_mult2;
    wire signed [DATA_SIZE-1:0] data_in_ext;    
    wire signed [DATA_SIZE+COEF_SIZE-1:0] data_in_ext2;   
       
    reg [2:0] state_reg, state_next;
    localparam IDLE = 3'd0;
    localparam S1   = 3'd1;
    localparam S2   = 3'd2;
    localparam S3   = 3'd3;
	localparam S4   = 3'd4;      

    mult#(
    .COEF_SIZE(COEF_SIZE))
     mult1(                 // dwie instancje mnozarek
    .in_1(mult1_coef1),
    .in_2(mult1_coef2),
    .out(out_mult1));
    
    mult#(
     .COEF_SIZE(COEF_SIZE)) 
     mult2(                 // dwie instancje mnozarek
    .in_1(mult2_coef1),
    .in_2(mult2_coef2),
    .out(out_mult2));	
    
    always @(posedge clk)
        begin
            if(reset)
                state_reg <= IDLE;
            else
                state_reg <= state_next;
        end
        
    always@(posedge clk, posedge reset)
         if(reset) begin
             r1_reg <= 0;
             r2_reg <= 0;
             r3_reg <= 0;
             z1_reg <= 0;
             z2_reg <= 0;
             z3_reg <= 0;
             //z4_reg <= 0;
             //z5_reg <= 0;
             z6_reg <= 0;
         end
         else begin
             r1_reg <= r1_next;
             r2_reg <= r2_next;
             r3_reg <= r3_next;
             z1_reg <= z1_next;
             z2_reg <= z2_next;
             z3_reg <= z3_next;
             // z4_reg <= z4_next;
             //z5_reg <= z5_next;
             z6_reg <= z6_next;
    
        end 
           
 always @* begin
        filter_done = 1'b0;
        state_next = state_reg;
        mult1_coef1=0;
        mult1_coef2=0;   
        mult2_coef1=0;
        mult2_coef2=0;      
        r1_next=r1_reg;
        r2_next=r2_reg;
        r3_next=r3_reg;
        z1_next=z1_reg;
        z2_next=z2_reg;
        z3_next=z3_reg;
        //z4_next=z4_reg;
       // z5_next=z5_reg;
        z6_next=z6_reg;
        case(state_reg)
           IDLE:begin
               if(sample_trig)
                 state_next = S1;
               else
                 state_next = IDLE;
            end //(IDLE)
            S1:begin
               state_next = S2;
               filter_done = 1'b1;
               r3_next = (data_in + r1_reg);                        //
               z2_next=(R*A)>>>(COEF_SIZE-2);                               // tu jest niejawne obci?cie pocz?tkowych zer
               z1_next=A*data_in;
            end //(S1)
            S2:begin
               state_next = S3;                                 //
               z6_next=z2_reg*r3_reg;
               z3_next=R2*r3_reg;
            end // (S2)
            S3:begin
               state_next = S4;
               r1_next = (z6_reg - z1_reg + r2_reg)>>>(COEF_SIZE-2);
               //mult1_coef1=y1;                                    // wrzucamy danie do mno??arek
               //mult1_coef2=R;                                    //
               //mult2_coef1=U;                                    //
               //mult2_coef2=r3_reg;                                //
               //z4_next=out_mult1;                               // to jest do adaptacji narazie nie wa?ne 
               //z5_next=out_mult2;                               // to jest do adaptacji narazie nie wa?ne
               //a_prev=A; 
            end // (S3)
            S4:begin
			  	r2_next = data_in_ext2+z3_reg;
               //a=a_prev+z5_reg*(x1-z4_reg)
               state_next = IDLE;
               //y1=r3_reg;
               //x1=data_in;
            end // (S4)
            
            default: r3_next =0;
            
         endcase
                end       
                
 
    assign data_in_ext2=data_in<<(COEF_SIZE-2);
    assign data_out = r3_reg;
endmodule
