   clear all
   close all
%% Time specifications:
   Fs = 2000;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 0.1;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %% Sine wave:
   Fc = 50;                     % hertz
   x = 1000.*sin(2*pi*Fc*t);
   signal=x;
   % Plot the signal versus time:
   %figure(1);
   %plot(t,x);
   %xlabel('time (in seconds)');
   %title('Signal versus Time');
   %zoom xon;
   bit_len=24;
  % out=round(x);
  % figure(2)
  %plot(t,out)
  file=fopen('sinus.txt','w');
  for i=1:length(signal)
     [bin,dec]=U2(signal(i),bit_len);
     fprintf(file, '%s \n',bin);
  end
  fclose(file);