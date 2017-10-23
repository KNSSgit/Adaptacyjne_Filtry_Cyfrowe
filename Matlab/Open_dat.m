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
  Orig_Sig = -1*(Orig_Sig - 850) + 400;
  plot(Orig_Sig)
  
  out = Orig_Sig .* 10000;

  for i = 0:3599
    fprintf(file, 'rom[%u] = 24''h%X;\n',i,out(i+1));
  end
  
  fclose(file);