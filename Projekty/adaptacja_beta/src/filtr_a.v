`timescale 1ns / 1ps

module filtr_a
    #(parameter COEF_SIZE = 35, 
      parameter DATA_SIZE = 24,
      parameter signed A = 35'b0,
      parameter signed R = 24'b0,           // tu dajesz r
      parameter signed R2 = 35'b0,          // tu dajesz r^2
      parameter signed R3 = 35'b0,          // tu bêdzie wyskalowanie r narazie nie wa¿ne
      parameter signed R4 = 35'b0,
      parameter signed U = 35'b0)           // u 
    ( input [DATA_SIZE-1:0] data_in,        // dane wchodz¹ 24 bitowe ale dodajemy do nich 1 bit by wykozystac 2 mnozarki
      output [DATA_SIZE-1:0] data_out,      // wychodz¹ dane 24 bit
      input sample_trig,
      output reg filter_done,
      input clk,
      input reset
      );
      
    reg signed [DATA_SIZE-1:0]              r1_reg, r1_next;             // 24.0  (24.0)
    reg signed [COEF_SIZE+DATA_SIZE-1+2:0]  r2_reg, r2_next;             // 59.32 (27.29)
    reg signed [DATA_SIZE-1:0]              r3_reg, r3_next;             // 24.0  (24.0)                       
    reg signed [COEF_SIZE+DATA_SIZE-1:0]   z1_reg, z1_next;              // 58.32 (26.32)
  //  reg signed [COEF_SIZE-1:0]           z2_reg, z2_next;
    reg signed [COEF_SIZE+DATA_SIZE-1:0]   z3_reg, z3_next;              // 58.32 (26.32)
  //reg signed [COEF_SIZE+COEF_SIZE-1:0]   z4_reg, z4_next;              // 
   // reg signed [COEF_SIZE-1:0]   z5_reg, z5_next;                        // 34.32 (2.32)
   // reg signed [COEF_SIZE+DATA_SIZE-2-1:0] z6_reg, z6_next;            //  
    reg signed [COEF_SIZE-1:0] z7_reg, z7_next;                        // 34.32 (2.32)
    reg signed [COEF_SIZE-1:0] x1_next, x1_reg;                          // 34.32 (2.32)
    reg signed [COEF_SIZE-1:0] y1_next, y1_reg;                          // 34.32 (2.32)
    reg signed [COEF_SIZE-1:0] a_next, a_reg;                            // 34.32 (2.32)
    reg signed [COEF_SIZE-1:0] a_prev_next, a_prev_reg;                  // 34.32 (2.32) 

    reg signed [DATA_SIZE-1:0] mult1_coef1, mult2_coef1;     // druty do mno¿arek
    reg signed [COEF_SIZE-1:0] mult1_coef2, mult2_coef2; 
    wire signed [COEF_SIZE+DATA_SIZE-1:0] out_mult1, out_mult2;
    wire signed [DATA_SIZE+COEF_SIZE-1:0] data_in_ext; 
    reg signed [COEF_SIZE-1:0] mult3_coef1, mult3_coef2;   
    wire signed [COEF_SIZE+COEF_SIZE-1:0] out_mult3; 
   // wire signed [DATA_SIZE+COEF_SIZE-1:0] data_in_ext2;    // w dalszej perspektywie do usuniêcia
       
    reg [2:0] state_reg, state_next;
    localparam IDLE = 3'd0;
    localparam S1   = 3'd1;
    localparam S2   = 3'd2;
    localparam S3   = 3'd3;
	localparam S4   = 3'd4; 
	localparam S5   = 3'd5;
	   

    mult_gen_0 mult1(                 // dwie instancje mnozarek
    .A(mult1_coef1),
    .B(mult1_coef2),
    .P(out_mult1),
    .CLK(clk));
    
    mult_gen_0 mult2(                 // dwie instancje mnozarek
    .A(mult2_coef1),
    .B(mult2_coef2),
    .P(out_mult2),
    .CLK(clk));
    
    mult_gen_1 mult3(                 // dwie instancje mnozarek
        .A(mult3_coef1),
        .B(mult3_coef2),
        .P(out_mult3),
        .CLK(clk));
    
    
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
          //   z2_reg <= 0;
             z3_reg <= 0;
             ///z4_reg <= 0;
          //   z5_reg <= 0;
         //    z6_reg <= 0;
             z7_reg <= 0 ;
             a_reg  <= A;
             y1_reg <= 0;
             x1_reg <= 0;
             a_prev_reg<=A;
             
         end
         else begin
             r1_reg <= r1_next;
             r2_reg <= r2_next;
             r3_reg <= r3_next;
             z1_reg <= z1_next;
         //    z2_reg <= z2_next;
             z3_reg <= z3_next;
             //z4_reg <= z4_next;
          //   z5_reg <= z5_next;
         //    z6_reg <= z6_next;
             z7_reg <= z7_next;
             a_reg  <= a_next;
             y1_reg <= y1_next;
             x1_reg <= x1_next;
             a_prev_reg<=a_prev_next;

             
    
        end 
           
 always @* begin
        filter_done = 1'b0;
        state_next  = state_reg;
        mult1_coef1 = 0;
        mult1_coef2 = 0;   
        mult2_coef1 = 0;
        mult2_coef2 = 0; 
        mult3_coef1 = 0;
        mult3_coef2 = 0;       
        r1_next = r1_reg;
        r2_next = r2_reg;
        r3_next = r3_reg;
        z1_next = z1_reg;
       // z2_next = z2_reg;
        z3_next = z3_reg;
      //  z4_next = z4_reg;
      //  z5_next = z5_reg;
       // z6_next = z6_reg;
        z7_next = z7_reg;
        a_next  = a_reg;
        x1_next = x1_reg;
        y1_next = y1_reg;
        a_prev_next = a_prev_reg;
        
        
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
               r3_next = data_in + r1_reg;                            // niejawne obciêcie
               mult1_coef1=R;			                                // out  z2_reg						 
               mult1_coef2=a_reg;                                       // out  z2_reg	
               mult2_coef1=data_in;                                     // out  z1_reg	
               mult2_coef2=a_reg;                                       // out  z1_reg
            end //(S1)
            S2:begin
               state_next = S3;
               mult1_coef1 = r3_reg;					                // out  z6_reg
               mult1_coef2 = out_mult1>>>(DATA_SIZE-2);                 // out  z6_reg
               mult2_coef1 = r3_reg ;                                   // out  z3_reg
               mult2_coef2 = R2;                                        // out  z3_reg
               z1_next = out_mult2;
            end // (S2)
            S3:begin
               state_next = S4;
               a_prev_next=a_reg;
               r1_next = (out_mult1 + r2_reg - z1_reg)>>>(COEF_SIZE-2);
               z3_next = out_mult2;
               mult1_coef1 = r3_reg;                                // out Y1
               mult1_coef2 = R3;                                    // out Y1
               mult2_coef1 = r3_reg;                                // out z5_reg
               mult2_coef2 = U ;                                    // out z5_reg   
               z7_next = x1_reg-y1_reg;        
            end // (S3)
            S4:begin
               state_next = S5;
			   r2_next = data_in_ext-z3_reg;	
			 //  z4_next = out_mult1;                               // to jest do adaptacji narazie nie wa?ne 
	           mult3_coef1 = out_mult2;                             // out z5_reg
               mult3_coef2 = z7_reg ;                               // out z5_reg 
               mult1_coef1 = data_in;                               // out x1
               mult1_coef2 = R4;                                    // out x1
               mult2_coef1 = r3_reg;                                // out y1
               mult2_coef2 = R3 ;                                   // out y1  
               
            end // (S4)
            S5:begin
               state_next = IDLE;
              // a_next  = a_prev_reg+(out_mult3)>>>(COEF_SIZE-2);
                 a_next  = a_prev_reg+out_mult3[67:33];
              // a_next = a_prev_reg;
               x1_next = out_mult1;                                 // NIEJAWNE PRZYCIÊCIE!!
               y1_next = out_mult2;                                 // NIEJAWNE PRZYCIÊCIE!!
               
            end   
         endcase
                end       
                

    assign data_in_ext=data_in<<(COEF_SIZE-2);
    assign data_out = r3_reg;
endmodule
