   clear all
   close all
%% Specyfikacja czasowa:
   fs = 20000;                  % czestotliwosc probkowania
   dt = 1/fs;                   % okres probkowania
   StopTime = 0.02;             % czas trwania sygnalu
   t = (0:dt:StopTime-dt)';     % wekor czasu w sekundach
   
   %% Czysty sinus:
   fc = 50;                     % hertz
   z = 770000.*sin(2*pi*fc*t)+1200000;
   y = 350000.*sin(2*pi*200*t);
   x=z+y;
   
   %% Zaburzony sinus
   
  out=round(x);
  figure(2)
  plot(t,out)
  file=fopen('sinus_rom.txt','w');
  
  for i = 0:399
    fprintf(file, 'rom[%u] = 24''h%X;\n',i,out(i+1));
  end
  
  fclose(file);
  