function [  ] = hdl_creator( SOS, rzad,ile_bit,g )
% jako argument podajesz SOS w postaci dziesi?tej ale z shiftem
% rz?d filtru
%ile bitów maj? wspó?czynniki i liczb? g w takiej postaci jak wspó?czynniki
%
rzad_pom=rzad;
file=fopen('top_filter.v','w');
fprintf(file,'''timescale 1ns/1ps\n\n');
fprintf(file,'module top_filter\n ');
fprintf(file,'\t #(parameter n=32,k=24)(\n');
fprintf(file,'\t input [k-1:0] audio_in,\n');
fprintf(file,'\t input reset,\n');
fprintf(file,'\t input clk,\n');
fprintf(file,'\t input sample_trig,\n');
fprintf(file,'\t input [k-1:0] audio_out,\n \t );\n\n');

fprintf(file,'wire [k-1:0] audio_in_2');
if rzad>2
    fprintf(file,', audio_in_3;\n');
else
    fprintf(file,';\n');
end
fprintf(file,'wire filter_done_1');
if rzad>2
    fprintf(file,', filter_done_2;\n\n');
else 
    fprintf(file,';\n\n');
end
for i=1:rzad
    fprintf(file,'sos stage%d (\n ',i);
    fprintf(file,'\t .audio_in(audio_in),\n');
    fprintf(file,'\t .reset(reset),\n');
    fprintf(file,'\t .clk(clk),\n');
    fprintf(file,'\t .b0(%d''d%d),\n',ile_bit,SOS(i,1));
    fprintf(file,'\t .b1(%d''d%d),\n',ile_bit,SOS(i,2));
    fprintf(file,'\t .b2(%d''d%d),\n',ile_bit,SOS(i,3));
    fprintf(file,'\t .a1(%d''d%d),\n',ile_bit,SOS(i,5));
    fprintf(file,'\t .a2(%d''d%d),\n',ile_bit,SOS(i,6));
     if rzad==1
        fprintf(file,'\t .audio_out(audio_out),\n');
     end
     
     if rzad==2
       if i==1
        fprintf(file,'\t .audio_out(audio_in_2),\n');
       elseif (i==2)
        fprintf(file,'\t .audio_out(audio_out),\n');   
           
       end
     end
     
      if rzad==3
       if i==1
        fprintf(file,'\t .audio_out(audio_in_2),\n');
       elseif (i==2)
           fprintf(file,'\t .audio_out(audio_in_2),\n');  
       elseif (i==3)
          fprintf(file,'\t .audio_out(audio_out),\n'); 
       end
     end
       
         
     
    
    if i==1
        fprintf(file,'\t .sample_trig(sample_trig),\n');
        fprintf(file,'\t .filter_done(filter_done_1),\n');
    end
     if i==2
        fprintf(file,'\t .sample_trig(filter_done_1),\n');
        fprintf(file,'\t .filter_done(filter_done_2),\n');
     end
     if i==3
        fprintf(file,'\t .sample_trig(filter_done_2),\n');
     end
    
     fprintf(file,'\t .gain(%d''d%d)\n \t);\n\n',ile_bit,g);
    
     
   
end
      
fprintf(file,'endmodule');
%for i=1:rzad
    



fclose(file);
end

