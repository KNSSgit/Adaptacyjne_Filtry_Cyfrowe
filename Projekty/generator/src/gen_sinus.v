//////////////////////////////////////////////////////////////////////////////////
// Kolo Naukowe Systemow Scalonych
// 10.2017
// 
// Modul: gen_sinus
// Projekt: Adaptacyjne filtry cyfrowe do kondycjonowania sygnalow biomedycznych 
// Model urzadzenia: Nexys Video Artix 7 (XC7A200T-1SBG484C)
// 
// Wersja: 0.1
//////////////////////////////////////////////////////////////////////////////////

module gen_sinus( 
 	 output reg signed [23:0] data_out,
	 input clk,
	 input reset
	 ); 

	 reg signed [23:0] rom[0:39];
	 reg [15:0] i;
	 reg [15:0] counter;//5000 * 40pr�bek = 200 000 ; zegar 10mhz => 50hz

	 always @(reset)     // fs = 2kHz; f1 = 50Hz; A1 = 6000000
		 begin 
			 rom[0] = 24'b000000000000000000000000;
			 rom[1] = 24'b000011100101001001101111;
			 rom[2] = 24'b000111000100101010010110;
			 rom[3] = 24'b001010011001000001100111;
			 rom[4] = 24'b001101011101000000111000;
			 rom[5] = 24'b010000001011110011010001;
			 rom[6] = 24'b010010100001000101010110;
			 rom[7] = 24'b010100011001001011110111;
			 rom[8] = 24'b010101110001001001100011;
			 rom[9] = 24'b010110100110110011110010;
			 rom[10] = 24'b010110111000110110000000;
			 rom[11] = 24'b010110100110110011110010;
			 rom[12] = 24'b010101110001001001100011;
			 rom[13] = 24'b010100011001001011110111;
			 rom[14] = 24'b010010100001000101010110;
			 rom[15] = 24'b010000001011110011010001;
			 rom[16] = 24'b001101011101000000111000;
			 rom[17] = 24'b001010011001000001100111;
			 rom[18] = 24'b000111000100101010010110;
			 rom[19] = 24'b000011100101001001101111;
			 rom[20] = 24'b000000000000000000000000;
			 rom[21] = 24'b111100011010110110010001;
			 rom[22] = 24'b111000111011010101101010;
			 rom[23] = 24'b110101100110111110011001;
			 rom[24] = 24'b110010100010111111001000;
			 rom[25] = 24'b101111110100001100101111;
			 rom[26] = 24'b101101011110111010101010;
			 rom[27] = 24'b101011100110110100001001;
			 rom[28] = 24'b101010001110110110011101;
			 rom[29] = 24'b101001011001001100001110;
			 rom[30] = 24'b101001000111001010000000;
			 rom[31] = 24'b101001011001001100001110;
			 rom[32] = 24'b101010001110110110011101;
			 rom[33] = 24'b101011100110110100001001;
			 rom[34] = 24'b101101011110111010101010;
			 rom[35] = 24'b101111110100001100101111;
			 rom[36] = 24'b110010100010111111001000;
			 rom[37] = 24'b110101100110111110011001;
			 rom[38] = 24'b111000111011010101101010;
			 rom[39] = 24'b111100011010110110010001;
		 end 

	 always @(posedge(clk))
		 begin 
			 if(reset) 
				 begin 
					 data_out <= 24'b0; 
					 i <= 16'b0; 
					 counter <= 16'b0; 
				 end 
			 else 
				 begin 
					 if(counter == 16'd5000) 
						 begin 
							 data_out <= rom[i]; 
							 counter <=16'b0; 
							 if(i == 39) i <= 0; 
							 else i <= i + 1; 
						 end 
					 else counter <= counter + 16'd1; 
				 end 
		 end 

endmodule
