clear all
clc
close all
[filename, pathname] = uigetfile('*.dat', 'Open file .dat');% only image Bitmap
if isequal(filename, 0) || isequal(pathname, 0)   
    disp('File input canceled.');  
   ECG_Data = [];  
else
fid=fopen(filename,'r');
end;
time=10;
f=fread(fid,2*360*time,'ubit12');
Orig_Sig=f(1:2:length(f));
plot(Orig_Sig)

  file=fopen('ekg_rom.txt','w');
  Orig_Sig = Orig_Sig - 890;
  plot(Orig_Sig)
  
  out = Orig_Sig .* 30000;

  bit_len=24;
  
for i=0:(length(out)-1)
     [bin,dec]=U2(out(i+1),bit_len);
     fprintf(file, 'rom[%u] = 24''b%s;\n',i,bin);
end
  
  
  fclose(file);