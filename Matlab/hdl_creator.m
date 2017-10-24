function [  ] = hdl_creator( SOS, rzad,ile_bit,g,nazwa_modulu )
% Generacja hdl dla topa filtru
% Uzycie: hdl_creator(SOS,rzad,ile_bit,g,nazwa_modulu)
%
% Funkcja generuje kod w jezyku verilog. Po wyko¿ystaniu funkcji nale¿y
% przekopiowaæ kod do odpowiedniego pliku w projekcie u¿ywaj¹cym filtry IIR
% o okreœlonych wspolczynnikach
% SOS - macie¿ wspo³czynników w notacji ktorej uzywa funkcja fixpoint (wartosci hexadecymalne)
% rzad- rz¹d filtru (ilosc instancji sos)
% ile_bit - okteœlenie ilu bitowe sa wspolcznniki
% g - wspolczynnik normujacy wynik ktory powstaje z macieza sos (w notacji funkcji fixpoint)
% nazwa_modulu - nazwa instancji top w projekcie

rzad_pom=rzad;
file=fopen('src/top_filter.v','w');
fprintf(file,'`timescale 1ns/1ps\n\n');
fprintf(file,'module %s\n ',nazwa_modulu);
fprintf(file,'\t#(parameter COEF_SIZE=%d,\n\t  parameter DATA_SIZE=24)\n',ile_bit);
fprintf(file,'\t(input [DATA_SIZE-1:0] data_in,\n');
fprintf(file,'\t  input reset,\n');
fprintf(file,'\t  input clk,\n');
fprintf(file,'\t  input sample_trig,\n');
fprintf(file,'\t  output filter_end,\n');
fprintf(file,'\t  output [DATA_SIZE-1:0] data_out\n \t );\n\n');

fprintf(file,'wire [DATA_SIZE-1:0] data_connection_1');
if rzad>2
    fprintf(file,', data_connection_2;\n');
else
    fprintf(file,';\n');
end
fprintf(file,'wire filter_done_first');
if rzad>2
    fprintf(file,', filter_done_second;\n\n');
else 
    fprintf(file,';\n\n');
end
for i=1:rzad
    fprintf(file,'filter_sos\n');
    fprintf(file,'\t #(.COEF_SIZE(COEF_SIZE),\n ');
    fprintf(file,'\t   .DATA_SIZE(DATA_SIZE),\n ');
    fprintf(file,'\t  .B0(%d''d%d),\n',ile_bit,SOS(i,1));
    fprintf(file,'\t  .B1(%d''d%d),\n',ile_bit,SOS(i,2));
    fprintf(file,'\t  .B2(%d''d%d),\n',ile_bit,SOS(i,3));
    fprintf(file,'\t  .A1(%d''d%d),\n',ile_bit,SOS(i,5));
    fprintf(file,'\t  .A2(%d''d%d),\n',ile_bit,SOS(i,6));    
    fprintf(file,'\t  .GAIN(%d''d%d))\n',ile_bit,g);
    
    fprintf(file,'\tsos_stage_%d (\n ',i);
    if rzad==1
        fprintf(file,'\t .data_in(data_in),\n');
    end
    if rzad==2
        if i==1
            fprintf(file,'\t .data_in(data_in),\n');
        else
            fprintf(file,'\t .data_in(data_connection_1),\n');
        end
    end
    if rzad==3
        if i==1
            fprintf(file,'\t .data_in(data_in),\n');
        elseif i==2
            fprintf(file,'\t .data_in(data_connection_1),\n');
        else
            fprintf(file,'\t .data_in(data_connection_2),\n');
        end
    end
    fprintf(file,'\t .reset(reset),\n');
    fprintf(file,'\t .clk(clk),\n');

     if rzad==1
        fprintf(file,'\t .data_out(data_out),\n');
     end
     
     if rzad==2
       if i==1
        fprintf(file,'\t .data_out(data_connection_1),\n');
       elseif (i==2)
        fprintf(file,'\t .data_out(data_out),\n');   
           
       end
     end
     
      if rzad==3
       if i==1
        fprintf(file,'\t .data_out(data_connection_1),\n');
       elseif (i==2)
           fprintf(file,'\t .data_out(data_connection_2),\n');  
       elseif (i==3)
          fprintf(file,'\t .data_out(data_out),\n'); 
       end
     end
       
         
     
    
    if i==1
        if rzad==1
           fprintf(file,'\t .sample_trig(sample_trig),\n');
           fprintf(file,'\t .filter_done(filter_end)\n');
       
        else
            fprintf(file,'\t .sample_trig(sample_trig),\n');
            fprintf(file,'\t .filter_done(filter_done_first)\n');
        end
    end

     if i==2
         if rzad==2
             fprintf(file,'\t .sample_trig(filter_done_first),\n');
             fprintf(file,'\t .filter_done(filter_end)\n');
       
         else
             fprintf(file,'\t .sample_trig(filter_done_first),\n');
            fprintf(file,'\t .filter_done(filter_done_second)\n');
         end
     end
     if i==3
        fprintf(file,'\t .sample_trig(filter_done_second),\n');
        fprintf(file,'\t .filter_done(filter_end)\n');
     end
     fprintf(file,'\t);\n');
    
    
     
   
end
      
fprintf(file,'endmodule');
%for i=1:rzad
    



fclose(file);
end

