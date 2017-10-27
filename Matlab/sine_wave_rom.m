   clear all
   close all
%% Specyfikacja czasowa:
   fs = 2000;                  % czestotliwosc probkowania
   dt = 1/fs;                   % okres probkowania
   StopTime = 0.02;             % czas trwania sygnalu
   t = (0:dt:StopTime-dt)';     % wekor czasu w sekundach
   
%% Czysty sinus:
   fc = 50;                     % czestotliwosc sinusa
   sinus = 5600000.*sin(2*pi*fc*t);
   
%% Zaburzony sinus
   fz = 200;                    % czestotliwo�� sygnalu
   temp = 2800000.*sin(2*pi*fz*t);
   sinus_zaburzony = sinus + temp;
   
%% Zapis do pliku
   sinus_zaokraglony = round(sinus);
   sinus_zaburzony_zaokraglony = round(sinus_zaburzony);

   plot(t,sinus_zaokraglony,'-r',t,sinus_zaburzony_zaokraglony,'-b')

   file1 = fopen('sygnaly/sinus.txt', 'w');
   file2 = fopen('sygnaly/sinus_zaburzony.txt', 'w');
   file1_rom = fopen('sygnaly/sinus_rom.txt', 'w');
   file2_rom = fopen('sygnaly/sinus_zaburzony_rom.txt', 'w');
  
   bit_len = 24;                %dlugosc biotwa 
   
  for i = 0:(length(t)-1)
    bin1 = dec2twos(sinus_zaokraglony(i+1),bit_len);
    bin2 = dec2twos(sinus_zaburzony_zaokraglony(i+1),bit_len);
    
    fprintf(file1, '%s \n',bin1);
    fprintf(file2, '%s \n',bin2);
    fprintf(file1_rom, 'rom[%u] = 24''b%s;\n',i,bin1);
    fprintf(file2_rom, 'rom[%u] = 24''b%s;\n',i,bin2);
  end
  
  fclose(file1);
  fclose(file2);
  