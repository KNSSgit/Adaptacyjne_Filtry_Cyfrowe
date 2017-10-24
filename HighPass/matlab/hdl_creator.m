function [  ] = hdl_creator( SOS, rzad,ile_bit,g )
% jako argument podajesz SOS w postaci dziesi?tej ale z shiftem
% rz?d filtru
%ile bitów maj? wspó?czynniki i liczb? g w takiej postaci jak wspó?czynniki
%`
rzad_pom=rzad;
file=fopen('src/top_filter.v','w');
fprintf(file,'`timescale 1ns/1ps\n\n');
fprintf(file,'module top_filter\n ');
fprintf(file,'\t#(parameter COEF_SIZE=%d,\n\t  parameter DATA_SIZE=24)\n',ile_bit);
fprintf(file,'\t(input [DATA_SIZE-1:0] data_in,\n');
fprintf(file,'\t  input reset,\n');
fprintf(file,'\t  input clk,\n');
fprintf(file,'\t  input sample_trig,\n');
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
           fprintf(file,'\t .data_out(data_connection_2)),\n');  
       elseif (i==3)
          fprintf(file,'\t .data_out(data_out),\n'); 
       end
     end
       
         
     
    
    if i==1
        fprintf(file,'\t .sample_trig(sample_trig),\n');
        fprintf(file,'\t .filter_done(filter_done_first)\n');
    end
     if i==2
        fprintf(file,'\t .sample_trig(filter_done_first),\n');
        fprintf(file,'\t .filter_done(filter_done_second)\n');
     end
     if i==3
        fprintf(file,'\t .sample_trig(filter_done_second)\n');
     end
     fprintf(file,'\t);\n');
    
    
     
   
end
      
fprintf(file,'endmodule');
%for i=1:rzad
    



fclose(file);
end

