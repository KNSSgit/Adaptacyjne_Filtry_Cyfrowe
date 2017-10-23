   clear all
   close all
%% Time specifications:
   Fs = 20000;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 0.02;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %% Sine wave:
   Fc = 50;                     % hertz
   z = 770000.*sin(2*pi*Fc*t)+1200000;
   y = 350000.*sin(2*pi*200*t);
   x=z+y;
   % Plot the signal versus time:
   %figure(1);
   %plot(t,x);
   %xlabel('time (in seconds)');
   %title('Signal versus Time');
   %zoom xon;
   
  out=round(x);
  figure(2)
  plot(t,out)
  file=fopen('sinus_rom.txt','w');
  
  for i = 0:399
    fprintf(file, 'rom[%u] = 24''h%X;\n',i,out(i+1));
  end
  
  fclose(file);
  