`timescale 1ns / 100ps

module filtr_a_tb
    #(parameter COEF_SIZE = 25,
      parameter DATA_SIZE = 24)
    ();
    
    reg [DATA_SIZE-1:0] data_in;
    wire [DATA_SIZE-1:0] data_out;

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

    integer i; 

    always
        begin
            #250000 clk_2khz = !clk_2khz;
        end

    always
        begin
            #5 clk = !clk;
        end

    initial
        begin
            clk_2khz = 1;
            clk = 1;
            i = 0;
            reset = 1;
            #500 reset = 0;
        end
        
    always  @(posedge clk_2khz) 
        begin
            //$display("%d:%h",i,data[i]);
            data_in = data[i];
            i = i + 1;
            if (i > 39) i = 0;
            sample = 1;
            #50 sample = 0;
        end

endmodule
