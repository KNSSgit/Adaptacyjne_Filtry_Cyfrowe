   clear all
   close all
%% Time specifications:
   Fs = 6000;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 0.1;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %% Sine wave:
   Fc = 10;                     % hertz
   x = 77000.*sin(2*pi*Fc*t)+78000;
   % Plot the signal versus time:
   %figure(1);
   %plot(t,x);
   %xlabel('time (in seconds)');
   %title('Signal versus Time');
   %zoom xon;
   
  out=round(x);
  figure(2)
  plot(t,out)
  file=fopen('G:\Users\Adrian\Documents\GitHub\filtry\sinus.txt','w');
  fprintf(file, '%X \n',out);
  
  fclose(file);