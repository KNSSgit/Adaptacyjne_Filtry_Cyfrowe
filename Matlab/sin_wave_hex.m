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
   fz = 50;                    % czestotliwoœæ sygnalu
   temp = 2800000.*sin(2*pi*fz*t);
   sinus_zaburzony = sinus + temp;

%% Sygna³ sta³y ujemny
   offset=-10*ones(1,length(t));
%% Zapis do pliku
   sinus_zaokraglony = round(sinus);
   sinus_zaburzony_zaokraglony = round(sinus_zaburzony);
   
   plot(t,sinus_zaokraglony,'-r',t,sinus_zaburzony_zaokraglony,'-b')

   file1 = fopen('sygnaly/sinus.txt', 'w');
   file2 = fopen('sygnaly/sinus_zaburzony.txt', 'w');
   file3 = fopen('sygnaly/offset.txt', 'w');
   bit_len = 24;                %dlugosc biotwa 
   
  for i = 0:(length(t)-1)
    hex1 = ndec2hex(sinus_zaokraglony(i+1),bit_len);
    hex2 = ndec2hex(sinus_zaburzony_zaokraglony(i+1),bit_len);
    hex3 = ndec2hex(offset(i+1),bit_len);
    
    fprintf(file1, '%s \n',hex1);
    fprintf(file2, '%s \n',hex2);
    fprintf(file3, '%s \n',hex3);
  end
  
  fclose(file1);
  fclose(file2);
  fclose(file3);
  function [hexstring]=ndec2hex(x,n)
% x : input decimal number
% n :   number of bits to perform 2's complements
% hexstring : hex representation of two's complement of x 
x=x + (x<0).*2^n; 
hexstring=dec2hex(x, ceil(n/4));
  end