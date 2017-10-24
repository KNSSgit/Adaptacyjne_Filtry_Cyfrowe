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

  file1=fopen('ekg_rom.txt','w');
  file2=fopen('ekg_zabrudzony_rom.txt', 'w');
  Orig_Sig = Orig_Sig - 890;
  %plot(Orig_Sig)
  
  ekg = Orig_Sig .* 10000;

   fs = 180000;
   dt = 1/fs;
   StopTime = 0.02;
   t = (0:dt:StopTime-dt)';
   fc = 50*650;                     
   sinus = 250000.*sin(2*pi*fc*t);
  
   ekg_zabrudzony = ekg + sinus;
   
    plot(t,ekg,'-r',t,ekg_zabrudzony,'-b')
    bit_len=24;
  
for i=0:(length(ekg)-1)
     bin1=dec2twos(ekg(i+1),bit_len);
     bin2=dec2twos(ekg_zabrudzony(i+1),bit_len);
     
     fprintf(file1, 'rom[%u] = 24''b%s;\n',i,bin1);
     fprintf(file2, 'rom[%u] = 24''b%s;\n',i,bin2);
     
end
  
  
  fclose(file1);
  fclose(file2);