//////////////////////////////////////////////////////////////////////////////////
// Kolo Naukowe Systemow Scalonych
// 10.2017
// 
// Modul: gen_sinus_zabrudzony
// Projekt: Adaptacyjne filtry cyfrowe do kondycjonowania sygnalow biomedycznych 
// Model urzadzenia: Nexys Video Artix 7 (XC7A200T-1SBG484C)
// 
// Wersja: 0.1
//////////////////////////////////////////////////////////////////////////////////


module gen_sinus_zabrudzony(
    output reg signed [23:0] data_out,
    input clk,
    input reset
    );
    
    reg signed [23:0] rom [0:39];
    reg [8:0] i;
    reg [15:0] counter;//50000 * 40pr�bek = 2 000 000 ; zegar 100mhz => 50hz

    always @(reset)     // fs = 2kHz; f1 = 50Hz; A1 = 6000000; f2 = 250Hz; A2 = 1500000
        begin
        rom[0] = 24'b000000000000000000000000;
        rom[1] = 24'b000111101000000110100011;
        rom[2] = 24'b001100110010110111110110;
        rom[3] = 24'b001110011011111110011011;
        rom[4] = 24'b001101011101000000111000;
        rom[5] = 24'b001100001000110110011101;
        rom[6] = 24'b001100110010110111110110;
        rom[7] = 24'b010000010110001111000011;
        rom[8] = 24'b010101110001001001100011;
        rom[9] = 24'b011010101001110000100110;
        rom[10] = 24'b011100100111000011100000;
        rom[11] = 24'b011010101001110000100110;
        rom[12] = 24'b010101110001001001100011;
        rom[13] = 24'b010000010110001111000011;
        rom[14] = 24'b001100110010110111110110;
        rom[15] = 24'b001100001000110110011101;
        rom[16] = 24'b001101011101000000111000;
        rom[17] = 24'b001110011011111110011011;
        rom[18] = 24'b001100110010110111110110;
        rom[19] = 24'b000111101000000110100011;
        rom[20] = 24'b000000000000000000000000;
        rom[21] = 24'b111000010111111001011101;
        rom[22] = 24'b110011001101001000001010;
        rom[23] = 24'b110001100100000001100101;
        rom[24] = 24'b110010100010111111001000;
        rom[25] = 24'b110011110111001001100011;
        rom[26] = 24'b110011001101001000001010;
        rom[27] = 24'b101111101001110000111101;
        rom[28] = 24'b101010001110110110011101;
        rom[29] = 24'b100101010110001111011010;
        rom[30] = 24'b100011011000111100100000;
        rom[31] = 24'b100101010110001111011010;
        rom[32] = 24'b101010001110110110011101;
        rom[33] = 24'b101111101001110000111101;
        rom[34] = 24'b110011001101001000001010;
        rom[35] = 24'b110011110111001001100011;
        rom[36] = 24'b110010100010111111001000;
        rom[37] = 24'b110001100100000001100101;
        rom[38] = 24'b110011001101001000001010;
        rom[39] = 24'b111000010111111001011101;
        end
        
        always @(posedge(clk))
            begin
                if(reset)
                    begin
                        data_out <= 24'b0;
                        i <= 9'b0;
                        counter <= 16'b0;
                    end
                else
                    begin
                        if(counter == 16'd50000)
                            begin
                                data_out <= rom[i];
                                counter <= 16'b0;
                                if(i == 39) i <= 0;
                                else i <= i + 1;
                            end
                        else counter <= counter + 16'd1;
                    end
            end
            
endmodule
