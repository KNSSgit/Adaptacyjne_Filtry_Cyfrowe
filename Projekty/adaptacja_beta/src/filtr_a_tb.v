`timescale 1ns / 100ps

module filtr_a_tb
    #(parameter COEF_SIZE = 25,
      parameter DATA_SIZE = 24)
    ();
    
    reg [DATA_SIZE-1:0] data_in;
    wire [DATA_SIZE-1:0] data_out;
    wire [7:0] coss;
    reg clk, clk_2khz;
    reg reset;
    reg sample;
    wire filter_done;
    
    reg [DATA_SIZE-1:0] data[0:39];

    initial $readmemh("C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Matlab/sygnaly/sinus.txt",data);

    filtr_top filter_top_inst
        (.data_in(data_in),
        .reset(reset),
        .clk(clk),
        .sample(sample),
        .data_out(data_out),
        .filter_done(filter_done)
        );

    integer i,f; 
    
always
    begin
    #500clk_2khz=!clk_2khz;
    
    end
    
    always
    begin
    #10clk=!clk;
    end
    initial
        begin
            clk_2khz = 1;
            clk = 1;
            i = 0;
            f = 0;
            sample=0;
            reset = 1;
            #500 reset = 0;
            f = 1;
        end
        
    always  @(posedge clk_2khz) 
        begin
            if (f==0)
                data_in=0;
            else begin
            
            //$display("%d:%h",i,data[i]);
            data_in = data[i];
            i = i + 1;
            if (i > 39) i = 0;
            sample = 1;
            #50 sample = 0;
            end
        end

endmodule
