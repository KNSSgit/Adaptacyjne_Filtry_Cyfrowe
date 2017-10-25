clear all
close all

fc = 4000;                  %tutaj zmieniac czestotliwosc sinusa(musi byc wielokrotnosc 50Hz
fs = 48000;                %tutaj zmieniac czestotliwosc probkowania
amp = 5600000;            %tutaj zmieniac amplitude sinusa
dt = 1/fs;
StopTime = 0.02;
t = (0:dt:StopTime-dt)';

sinus = amp.*sin(2*pi*fc*t);
sinus_zaokraglony = round(sinus);

bit_len = 24;
probki = fs / 50;
dzielnik = 100000000 / fc;
licznik = (dzielnik * (fc/50)) / probki;
licznik = floor(licznik);

file=fopen('src/gen_sinus.v','w');

fprintf(file,'`timescale 1ns/100ps\n\n');
fprintf(file,'module gen_sinus( \n ');
fprintf(file,'\t output reg signed [%d:0] data_out,\n',bit_len-1);
fprintf(file,'\t input clk,\n');
fprintf(file,'\t input reset\n');
fprintf(file,'\t ); \n\n');

fprintf(file,'\t reg signed [%d:0] rom[0:%d];\n',bit_len-1,probki-1);
fprintf(file,'\t reg [15:0] i;\n');
fprintf(file,'\t reg [15:0] counter;\n\n');

fprintf(file,'\t always @(reset)\n');
fprintf(file,'\t\t begin \n');
%wklejenie wspó³czynników z txt
for i = 0:(length(t)-1)
    bin = dec2twos(sinus_zaokraglony(i+1),bit_len);
    fprintf(file, '\t\t\t rom[%u] = %d''b%s;\n',i,bit_len,bin);
end
%komentarz
fprintf(file,'\t\t end \n\n');

fprintf(file,'\t always @(posedge(clk))\n');
fprintf(file,'\t\t begin \n');
fprintf(file,'\t\t\t if(reset) \n');
fprintf(file,'\t\t\t\t begin \n');
fprintf(file,'\t\t\t\t\t data_out <= %d''b0; \n',bit_len);
fprintf(file,'\t\t\t\t\t i <= 16''b0; \n');
fprintf(file,'\t\t\t\t\t counter <= 16''b0; \n');
fprintf(file,'\t\t\t\t end \n');
fprintf(file,'\t\t\t else \n');
fprintf(file,'\t\t\t\t begin \n');
fprintf(file,'\t\t\t\t\t if(counter == 16''d%d) \n',licznik);
fprintf(file,'\t\t\t\t\t\t begin \n');
fprintf(file,'\t\t\t\t\t\t\t data_out <= rom[i]; \n');
fprintf(file,'\t\t\t\t\t\t\t counter <=16''b0; \n');
fprintf(file,'\t\t\t\t\t\t\t if(i == %d) i <= 0; \n', probki-1);
fprintf(file,'\t\t\t\t\t\t\t else i <= i + 1; \n');
fprintf(file,'\t\t\t\t\t\t end \n');
fprintf(file,'\t\t\t\t\t else counter <= counter + 16''d1; \n');
fprintf(file,'\t\t\t\t end \n');
fprintf(file,'\t\t end \n\n');
fprintf(file,'endmodule\n');

fclose(file);
