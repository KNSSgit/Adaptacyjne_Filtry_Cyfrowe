clear all;
close all;

%% Dane do ustawiania
fs = 2000;
amp_ekg = 3000;
amp_sinusa = 150;
bps_serca = 60;
f_sinusa1 = 50;
f_sinusa2 = 55;     %brak koherentnosci
f_sinusa3 = 60;     %brak koherentnosci

%% Potrzebne do obliczeñ
dt = 1/fs;
czas_trwania = 1;
t = (0:dt:czas_trwania-dt)';

%% Tworzenie sygnalow
ekg_czysty = (ECGwaveGen(bps_serca,(czas_trwania + 1),fs,amp_ekg))';
sinus1_czysty = amp_sinusa.*sin(2*pi*f_sinusa1*t);
sinus2_czysty = amp_sinusa.*sin(2*pi*f_sinusa2*t);
sinus3_czysty = amp_sinusa.*sin(2*pi*f_sinusa3*t);

ekg_szum = awgn(ekg_czysty, -30);

suma_sygnalow1 = round(1000.*(ekg_szum(1:(length(ekg_szum)-1))+sinus1_czysty));
suma_sygnalow2 = round(1000.*(ekg_szum(1:(length(ekg_szum)-1))+sinus2_czysty));
suma_sygnalow3 = round(1000.*(ekg_szum(1:(length(ekg_szum)-1))+sinus3_czysty));

plot(t,suma_sygnalow1,'-r',t,suma_sygnalow2,'-b',t,suma_sygnalow3,'-g')

%% Zapis do pliku
file_rom1 = fopen('sygnaly/ekg_50_rom.txt', 'w');
file_rom2 = fopen('sygnaly/ekg_55_rom.txt', 'w');
file_rom3 = fopen('sygnaly/ekg_60_rom.txt', 'w');

bit_len = 24;

for i = 0:(length(t)-1)
    bin1 = dec2twos(suma_sygnalow1(i+1),bit_len);
    bin2 = dec2twos(suma_sygnalow2(i+1),bit_len);
    bin3 = dec2twos(suma_sygnalow3(i+1),bit_len);
    
    fprintf(file_rom1, 'rom[%u] = 24''b%s;\n',i,bin1);
    fprintf(file_rom2, 'rom[%u] = 24''b%s;\n',i,bin2);
    fprintf(file_rom3, 'rom[%u] = 24''b%s;\n',i,bin3);
end
  
fclose(file_rom1);
fclose(file_rom2);
fclose(file_rom3);