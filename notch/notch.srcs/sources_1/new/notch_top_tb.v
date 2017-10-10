//////////////////////////////////////////////////////////////////////////////////
// Kolo Naukowe Systemow Scalonych
// 10.2017
// 
// Modul: notch_top_tb
// Projekt: Adaptacyjne filtry cyfrowe do kondycjonowania sygnalow biomedycznych 
// Model urzadzenia: Nexys Video Artix 7 (XC7A200T-1SBG484C)
// 
// Wersja: 0.1
//////////////////////////////////////////////////////////////////////////////////

module notch_top_tb
    #(parameter COEF_SIZE = 32, 
      parameter DATA_SIZE = 24)
    ();
    
    
    reg [DATA_SIZE-1:0] data_in;
    wire [DATA_SIZE-1:0] data_out;
    
    reg clk, clk_6khz;
    reg reset;
    reg sample;
    
    reg [DATA_SIZE-1:0] data[0:599];
    
    initial $readmemh("C:/Users/scieslak/Documents/VHDL_Verilog/Adaptacyjne_Filtry_Cyfrowe/notch/matlab_excel/sinus.txt", data);
    
    notch_top notch_top_inst
        (.data_in(data_in),
         .data_out(data_out),
         .sample_trig(sample),
         .clk(clk),
         .reset(reset)
        );
        
    integer i;
    
    always
        begin
            #166 clk_6khz = !clk_6khz;
        end
    
    always
        begin
            #10 clk = !clk;
        end
        
    initial
        begin
            clk_6khz = 1;
            clk = 1;
            i = 0;
            reset = 1;
            #166 reset = 0;
        end
        
    always @(posedge clk_6khz)
        begin
            data_in = data[i];
            i = i + 1;
            if(i > 599) i = 0;
            sample = 1;
            #50 sample = 0;
        end
         
endmodule
