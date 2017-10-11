//////////////////////////////////////////////////////////////////////////////////
// Kolo Naukowe Systemow Scalonych
// 10.2017
// 
// Modul: LUT_sine_wave
// Projekt: Adaptacyjne filtry cyfrowe do kondycjonowania sygnalow biomedycznych 
// Model urzadzenia: Nexys Video Artix 7 (XC7A200T-1SBG484C)
// 
// Wersja: 0.1
//////////////////////////////////////////////////////////////////////////////////


module LUT_sine_wave(
    output reg [23:0] data_out,
    input clk,
    input reset
    );
    
    reg [23:0] rom [0:199];
    reg [7:0] i;

    initial 
        begin
            rom[0] = 24'h7704C0;
            rom[1] = 24'h896601;
            rom[2] = 24'h9B5367;
            rom[3] = 24'hAC5BEF;
            rom[4] = 24'hBC143A;
            rom[5] = 24'hCA1932;
            rom[6] = 24'hD61277;
            rom[7] = 24'hDFB48E;
            rom[8] = 24'hE6C2BF;
            rom[9] = 24'hEB1090;
            rom[10] = 24'hEC82E0;
            rom[11] = 24'hEB1090;
            rom[12] = 24'hE6C2BF;
            rom[13] = 24'hDFB48E;
            rom[14] = 24'hD61277;
            rom[15] = 24'hCA1932;
            rom[16] = 24'hBC143A;
            rom[17] = 24'hAC5BEF;
            rom[18] = 24'h9B5367;
            rom[19] = 24'h896601;
            rom[20] = 24'h7704C0;
            rom[21] = 24'h64A37F;
            rom[22] = 24'h52B619;
            rom[23] = 24'h41AD91;
            rom[24] = 24'h31F546;
            rom[25] = 24'h23F04E;
            rom[26] = 24'h17F709;
            rom[27] = 24'hE54F2;
            rom[28] = 24'h746C1;
            rom[29] = 24'h2F8F0;
            rom[30] = 24'h186A0;
            rom[31] = 24'h2F8F0;
            rom[32] = 24'h746C1;
            rom[33] = 24'hE54F2;
            rom[34] = 24'h17F709;
            rom[35] = 24'h23F04E;
            rom[36] = 24'h31F546;
            rom[37] = 24'h41AD91;
            rom[38] = 24'h52B619;
            rom[39] = 24'h64A37F;
            rom[40] = 24'h7704C0;
            rom[41] = 24'h896601;
            rom[42] = 24'h9B5367;
            rom[43] = 24'hAC5BEF;
            rom[44] = 24'hBC143A;
            rom[45] = 24'hCA1932;
            rom[46] = 24'hD61277;
            rom[47] = 24'hDFB48E;
            rom[48] = 24'hE6C2BF;
            rom[49] = 24'hEB1090;
            rom[50] = 24'hEC82E0;
            rom[51] = 24'hEB1090;
            rom[52] = 24'hE6C2BF;
            rom[53] = 24'hDFB48E;
            rom[54] = 24'hD61277;
            rom[55] = 24'hCA1932;
            rom[56] = 24'hBC143A;
            rom[57] = 24'hAC5BEF;
            rom[58] = 24'h9B5367;
            rom[59] = 24'h896601;
            rom[60] = 24'h7704C0;
            rom[61] = 24'h64A37F;
            rom[62] = 24'h52B619;
            rom[63] = 24'h41AD91;
            rom[64] = 24'h31F546;
            rom[65] = 24'h23F04E;
            rom[66] = 24'h17F709;
            rom[67] = 24'hE54F2;
            rom[68] = 24'h746C1;
            rom[69] = 24'h2F8F0;
            rom[70] = 24'h186A0;
            rom[71] = 24'h2F8F0;
            rom[72] = 24'h746C1;
            rom[73] = 24'hE54F2;
            rom[74] = 24'h17F709;
            rom[75] = 24'h23F04E;
            rom[76] = 24'h31F546;
            rom[77] = 24'h41AD91;
            rom[78] = 24'h52B619;
            rom[79] = 24'h64A37F;
            rom[80] = 24'h7704C0;
            rom[81] = 24'h896601;
            rom[82] = 24'h9B5367;
            rom[83] = 24'hAC5BEF;
            rom[84] = 24'hBC143A;
            rom[85] = 24'hCA1932;
            rom[86] = 24'hD61277;
            rom[87] = 24'hDFB48E;
            rom[88] = 24'hE6C2BF;
            rom[89] = 24'hEB1090;
            rom[90] = 24'hEC82E0;
            rom[91] = 24'hEB1090;
            rom[92] = 24'hE6C2BF;
            rom[93] = 24'hDFB48E;
            rom[94] = 24'hD61277;
            rom[95] = 24'hCA1932;
            rom[96] = 24'hBC143A;
            rom[97] = 24'hAC5BEF;
            rom[98] = 24'h9B5367;
            rom[99] = 24'h896601;
            rom[100] = 24'h7704C0;
            rom[101] = 24'h64A37F;
            rom[102] = 24'h52B619;
            rom[103] = 24'h41AD91;
            rom[104] = 24'h31F546;
            rom[105] = 24'h23F04E;
            rom[106] = 24'h17F709;
            rom[107] = 24'hE54F2;
            rom[108] = 24'h746C1;
            rom[109] = 24'h2F8F0;
            rom[110] = 24'h186A0;
            rom[111] = 24'h2F8F0;
            rom[112] = 24'h746C1;
            rom[113] = 24'hE54F2;
            rom[114] = 24'h17F709;
            rom[115] = 24'h23F04E;
            rom[116] = 24'h31F546;
            rom[117] = 24'h41AD91;
            rom[118] = 24'h52B619;
            rom[119] = 24'h64A37F;
            rom[120] = 24'h7704C0;
            rom[121] = 24'h896601;
            rom[122] = 24'h9B5367;
            rom[123] = 24'hAC5BEF;
            rom[124] = 24'hBC143A;
            rom[125] = 24'hCA1932;
            rom[126] = 24'hD61277;
            rom[127] = 24'hDFB48E;
            rom[128] = 24'hE6C2BF;
            rom[129] = 24'hEB1090;
            rom[130] = 24'hEC82E0;
            rom[131] = 24'hEB1090;
            rom[132] = 24'hE6C2BF;
            rom[133] = 24'hDFB48E;
            rom[134] = 24'hD61277;
            rom[135] = 24'hCA1932;
            rom[136] = 24'hBC143A;
            rom[137] = 24'hAC5BEF;
            rom[138] = 24'h9B5367;
            rom[139] = 24'h896601;
            rom[140] = 24'h7704C0;
            rom[141] = 24'h64A37F;
            rom[142] = 24'h52B619;
            rom[143] = 24'h41AD91;
            rom[144] = 24'h31F546;
            rom[145] = 24'h23F04E;
            rom[146] = 24'h17F709;
            rom[147] = 24'hE54F2;
            rom[148] = 24'h746C1;
            rom[149] = 24'h2F8F0;
            rom[150] = 24'h186A0;
            rom[151] = 24'h2F8F0;
            rom[152] = 24'h746C1;
            rom[153] = 24'hE54F2;
            rom[154] = 24'h17F709;
            rom[155] = 24'h23F04E;
            rom[156] = 24'h31F546;
            rom[157] = 24'h41AD91;
            rom[158] = 24'h52B619;
            rom[159] = 24'h64A37F;
            rom[160] = 24'h7704C0;
            rom[161] = 24'h896601;
            rom[162] = 24'h9B5367;
            rom[163] = 24'hAC5BEF;
            rom[164] = 24'hBC143A;
            rom[165] = 24'hCA1932;
            rom[166] = 24'hD61277;
            rom[167] = 24'hDFB48E;
            rom[168] = 24'hE6C2BF;
            rom[169] = 24'hEB1090;
            rom[170] = 24'hEC82E0;
            rom[171] = 24'hEB1090;
            rom[172] = 24'hE6C2BF;
            rom[173] = 24'hDFB48E;
            rom[174] = 24'hD61277;
            rom[175] = 24'hCA1932;
            rom[176] = 24'hBC143A;
            rom[177] = 24'hAC5BEF;
            rom[178] = 24'h9B5367;
            rom[179] = 24'h896601;
            rom[180] = 24'h7704C0;
            rom[181] = 24'h64A37F;
            rom[182] = 24'h52B619;
            rom[183] = 24'h41AD91;
            rom[184] = 24'h31F546;
            rom[185] = 24'h23F04E;
            rom[186] = 24'h17F709;
            rom[187] = 24'hE54F2;
            rom[188] = 24'h746C1;
            rom[189] = 24'h2F8F0;
            rom[190] = 24'h186A0;
            rom[191] = 24'h2F8F0;
            rom[192] = 24'h746C1;
            rom[193] = 24'hE54F2;
            rom[194] = 24'h17F709;
            rom[195] = 24'h23F04E;
            rom[196] = 24'h31F546;
            rom[197] = 24'h41AD91;
            rom[198] = 24'h52B619;
            rom[199] = 24'h64A37F;
        end
        
        always @(posedge(clk))
            begin
                if(reset)
                    begin
                        data_out <= 24'b0;
                        i <= 8'b0;
                    end
                else
                    begin
                        data_out <= rom[i];
                        if(i == 199) i <= 0;
                        else i <= i + 1;
                    end
            end
            
endmodule
