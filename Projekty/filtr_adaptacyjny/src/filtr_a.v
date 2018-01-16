`timescale 1ns / 1ps

module filtr_a
    #(parameter COEF_SIZE = 40,             // d�ugo�� bitowa wsp�czynnik�w
      parameter DATA_SIZE = 24,             // d�ugo�� bitowa wej�cia i r
      parameter signed A = 35'b0,           // zmienna a
      parameter signed R = 24'b0,           // wsp�czynnik r
      parameter signed R2 = 35'b0,          // wsp�czynnik r^2
      parameter signed R3 = 35'b0,          // wsp�czynnik r/R4
      parameter signed R4 = 35'b0,          // wsp�czynnik skaluj�cy (�eby u mog�o by� wi�ksze)
      parameter signed U = 35'b0)           // wsp�czynnik u 
    ( input      [DATA_SIZE-1:0] data_in,   // dane wchodz� 24 bitowe ale dodajemy do nich 1 bit by wykozystac 2 mnozarki
      input      sample_trig,               // sygna� okre�laj�cy obecno�� pr�bki
      input      clk,                       // 10 Mhz
      input      reset,                     // Aktywny wysoki
      output reg filter_done,               // raczej zb�dne
      output     [DATA_SIZE-1:0] data_out,   // wychodz� dane 24 bit
      output     [COEF_SIZE-1:0]a_out
      );
      
    reg signed [DATA_SIZE-1:0]             r1_reg, r1_next;             // 24.0  (24.0)
    reg signed [COEF_SIZE+DATA_SIZE-1+2:0] r2_reg, r2_next;             // 59.32 (27.29)
    reg signed [DATA_SIZE-1:0]             r3_reg, r3_next;             // 24.0  (24.0)                       
    reg signed [COEF_SIZE+DATA_SIZE-1:0]   z2_reg, z2_next;
    reg signed [COEF_SIZE+DATA_SIZE-1:0]   z3_reg, z3_next;             // 58.32 (26.32)
    reg signed [COEF_SIZE-1:0]             z7_reg, z7_next;             // 34.32 (2.32)
    reg signed [COEF_SIZE-1:0]             x1_next, x1_reg;             // 34.32 (2.32)
    reg signed [COEF_SIZE-1:0]             y1_next, y1_reg;             // 34.32 (2.32)
    reg signed [COEF_SIZE-1:0]             a_next,      a_reg;          // 34.32 (2.32)
    reg signed [COEF_SIZE-1:0]             a_prev_next, a_prev_reg;     // 34.32 (2.32) 
    reg signed [DATA_SIZE-1:0]             mult1_coef1, mult2_coef1;    // druty do mno�arek
    reg signed [COEF_SIZE-1:0]             mult1_coef2, mult2_coef2;    // druty do mno�arek
    reg signed [COEF_SIZE-1:0]             mult3_coef1, mult3_coef2;    // druty do mno�arek
    wire signed [COEF_SIZE+DATA_SIZE-1:0]  out_mult1,   out_mult2;      // wyj�cie z mno�arki
    wire signed [COEF_SIZE+COEF_SIZE-1:0]  out_mult3;                   // wyj�cie z mno�arki
    wire signed [DATA_SIZE+COEF_SIZE-1:0]  data_in_ext;                 // wej�cie fixpoint
       
    reg [2:0] state_reg, state_next;
    localparam IDLE = 3'd0;
    localparam S1   = 3'd1;
    localparam S2   = 3'd2;
    localparam S3   = 3'd3;
	localparam S4   = 3'd4; 
	localparam S5   = 3'd5;
	   
mult_gen_0 mult1(                 // mnorzarka DATA_SIZE x COEF_SIZE
    .A(mult1_coef1),
    .B(mult1_coef2),
    .P(out_mult1),
    .CLK(clk));
    
mult_gen_0 mult2(                 // mnorzarka DATA_SIZE x COEF_SIZE
    .A(mult2_coef1),
    .B(mult2_coef2),
    .P(out_mult2),
    .CLK(clk));
    
 mult_gen_1 mult3(              // mnorzarka COEF_SIZE x COEF_SIZE
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
        end // always
        
    always@(posedge clk, posedge reset)
         if(reset) begin
             r1_reg <= 0;
             r2_reg <= 0;
             r3_reg <= 0;
             z2_reg <= 0;
             z3_reg <= 0;
             z7_reg <= 0;
             a_reg  <= A;
             y1_reg <= 0;
             x1_reg <= 0;
             a_prev_reg <= A;
             
         end // begin (if)
         else begin
             r1_reg <= r1_next;
             r2_reg <= r2_next;
             r3_reg <= r3_next;
             z2_reg <= z2_next;
             z3_reg <= z3_next;
             z7_reg <= z7_next;
             a_reg  <= a_next;
             y1_reg <= y1_next;
             x1_reg <= x1_next;
             a_prev_reg <= a_prev_next;
        end //else
           
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
        z2_next = z2_reg;
        z3_next = z3_reg;
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
               r3_next = data_in + r1_reg;                            // niejawne obci�cie
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
               z2_next= r2_reg-out_mult2;                               //r2_reg-z1_reg;
            end // (S2)
            S3:begin
               state_next = S4;
               a_prev_next=a_reg;
               r1_next = (out_mult1 + z2_reg)>>>(COEF_SIZE-2);
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
	           mult3_coef1 = out_mult2;                             // out z5_reg
               mult3_coef2 = z7_reg ;                               // out z5_reg 
               mult1_coef1 = data_in;                               // out x1
               mult1_coef2 = R4;                                    // out x1
               mult2_coef1 = r3_reg;                                // out y1
               mult2_coef2 = R3 ;                                   // out y1  
            end // (S4)
            S5:begin
               state_next = IDLE;
               a_next  = a_prev_reg+out_mult3[2*COEF_SIZE-2:COEF_SIZE-2];
               x1_next = out_mult1;                                 // NIEJAWNE PRZYCI�CIE!!
               y1_next = out_mult2;                                 // NIEJAWNE PRZYCI�CIE!!
            end // (S5)  
         endcase
   end  // always     
                
    assign data_in_ext = data_in<<(COEF_SIZE-2);                    // zmiana wej�cia na fixpoint
    assign data_out = r3_reg;                                       // zapis wyj�cia 
    assign a_out = a_reg;
endmodule
