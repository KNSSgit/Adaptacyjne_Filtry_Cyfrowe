%//////////////////////////////////////////////////////////////////////////////////
%// Ko³o Naukowe Systemów Scalonych
%// 10.2017
%// 
%// Project: Adaptacyjne filtry cyfrowe do kondycjonowania sygna³ów biomedycznych 
%//////////////////////////////////////////////////////////////////////////////////

clear all;
close all;

format long

n = 4;      %rz¹d filtru
fs = 2000;    %czêstotliwoœæ próbkowania
f = 50;       %czêstotliwoœæ wyciêcia
f1 = f-3;     %czêstotliwoœæ mniejsza od f dla której ampiltuda spada o 3dB
f2 = f+3;     %czêstotliwoœæ wiêksza od f dla której ampiltuda spada o 3dB

Wn = [2*f1/fs 2*f2/fs];     %unormowana "szerokoœæ" pasma pracy (matlab sam dodaje pi)
ftype = 'stop';             %typ filtru pasmowo zaporowy

[b,a] = butter(n/2,Wn,ftype);   %n/2 bo parametr 2n, b - licznik, a - mianownik transmitancji

[h,Hd] = filtr50;       %u¿yte gui do robienia filtrów

load('filtr50.mat');
[B,A] = sos2tf(SOS,G);

N=2048;         %iloœæ próbek do wykresu
ts=1/fs;        %okres próbkowania

t = ts*(0:N-1);     %wektor czasu 

figure;
freqz(b,a, 2^16)
figure;
freqz(B,A, 2^16)


dataIn = sin(2*pi*f*t);          %sinus o czêstotliwoœci odfiltrowywanej
dataOut = filter(b,a,dataIn);    %po filtracji 
dataOut2 = filter(B,A, dataIn);
figure;
plot(t, dataIn, '-r' ,t, dataOut, '-b', t, dataOut2, '-g' )