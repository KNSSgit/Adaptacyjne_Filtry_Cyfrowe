//////////////////////////////////////////////////////////////////////////////////
// Kolo Naukowe Systemow Scalonych
// 10.2017
// 
// Modul: filter_sos
// Projekt: Adaptacyjne filtry cyfrowe do kondycjonowania sygnalow biomedycznych 
// Model urzadzenia: Nexys Video Artix 7 (XC7A200T-1SBG484C)
// 
// Wersja: 0.1
//////////////////////////////////////////////////////////////////////////////////


module filter_sos 
    #(parameter COEF_SIZE = 32, 
      parameter DATA_SIZE = 24,
      parameter B0 = 32'b00000000000000000000000000000000,
      parameter B1 = 32'b00000000000000000000000000000000,
      parameter B2 = 32'b00000000000000000000000000000000,
      parameter A1 = 32'b00000000000000000000000000000000,
      parameter A2 = 32'b00000000000000000000000000000000,
      parameter GAIN = 32'b00000000000000000000000000000000)
    ( input [DATA_SIZE-1:0] data_in,
      output [DATA_SIZE-1:0] data_out,
      
      input sample_trig,
      output reg filter_done,
      
      input clk,
      input reset
    );

    reg signed [COEF_SIZE+DATA_SIZE-1+4:0] r1_reg, r2_reg, r3_reg;
    reg signed [DATA_SIZE-1:0] r4_reg;
    
    wire signed [DATA_SIZE:0] data_in_ext;
    
    wire signed [COEF_SIZE+DATA_SIZE-1+4:0] r1, r2, r3;
    wire signed [COEF_SIZE+DATA_SIZE-1+4:0] b0_mult, b1_mult, b2_mult, a1_mult, a2_mult;
    wire signed [COEF_SIZE+DATA_SIZE-1+4+COEF_SIZE:0] r4;
    
    reg st1, st2, st3;
    reg [1:0] state_reg, state_next;
    
    localparam IDLE = 2'd0;
    localparam S1   = 2'd1;
    localparam S2   = 2'd2;
    localparam S3   = 2'd3; 


    always @(posedge clk)
        begin
            if(reset==1'b1)
                begin
                    r1_reg <= 0;
                    r2_reg <= 0;
                    r3_reg <= 0;
                    r4_reg <= 0;
                end
                
            else if(st1)
                r3_reg <= r3;
                
            else if(st2)
                begin
                    r1_reg <= r1;
                    r4_reg <= r4>>(2*COEF_SIZE-4);
                end
                
            else if(st3)
                r2_reg <= r2;
        end
        
        
    always @(posedge clk)
        begin
            if(reset)
                state_reg <= IDLE;
            else
                state_reg <= state_next;
        end
        
        
    always @*
        begin
            st1 = 1'b0;
            st2 = 1'b0;
            st3 = 1'b0;
            filter_done = 1'b0;
            state_next = state_reg;
            
            case(state_reg)
                IDLE:
                    begin
                        if(sample_trig)
                            state_next = S1;
                        else
                            state_next = IDLE;
                    end
                S1:
                    begin
                        st1 = 1'b1;
                        state_next = S2;
                    end
                S2:
                    begin
                        st2 = 1'b1;
                        state_next = S3;
                        filter_done = 1'b1;
                    end
                S3:
                    begin
                        st3 = 1'b1;
                        state_next = IDLE;
                    end
            endcase
        end

    
    assign data_in_ext = {1'b0, data_in};
    
    assign b0_mult = B0 * data_in_ext;
    assign b1_mult = B1 * data_in_ext;
    assign b2_mult = B2 * data_in_ext;
    
    assign a1_mult = A1 * (r3_reg>>(COEF_SIZE-2));
    assign a2_mult = A2 * (r3_reg>>(COEF_SIZE-2));
    
    
    assign r3 = b0_mult + r1_reg;
    assign r1 = b1_mult - a1_mult + r2_reg;
    assign r2 = b2_mult - a2_mult;
    
    
    assign r4 = (r3_reg * GAIN);
    assign data_out = r4_reg;

endmodule
