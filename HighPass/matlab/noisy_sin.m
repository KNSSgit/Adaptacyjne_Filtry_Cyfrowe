   clear all
   close all
%% Time specifications:
   Fs = 2000;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 0.1;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %% Sine wave:
   Fc = 100;  % hertz
   Fn=50;
   Amp=1000;
   Amp_noise=200;
   Bias=Amp+1000;
   x = Amp.*sin(2*pi*Fc*t)+Bias;
   noise_50hz=Amp_noise.*sin(2*pi*Fn*t);
   x_n=x+noise_50hz;
   % Plot the signal versus time:
% figure(1);
%    plot(t,x);
%    xlabel('time (in seconds)');
%    title('Signal versus Time');
  
  out=round(x_n);
  figure(2)
  plot(t,out)
  file=fopen('sinus.txt','w');
  fprintf(file, '%X \n',out);
  
  fclose(file);