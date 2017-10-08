%//////////////////////////////////////////////////////////////////////////////////
%// Ko�o Naukowe System�w Scalonych
%// 10.2017
%// 
%// Project: Adaptacyjne filtry cyfrowe do kondycjonowania sygna��w biomedycznych 
%//////////////////////////////////////////////////////////////////////////////////

clear all;
close all;

format long

n = 4;      %rz�d filtru
fs = 2000;    %cz�stotliwo�� pr�bkowania
f = 50;       %cz�stotliwo�� wyci�cia
f1 = f-3;     %cz�stotliwo�� mniejsza od f dla kt�rej ampiltuda spada o 3dB
f2 = f+3;     %cz�stotliwo�� wi�ksza od f dla kt�rej ampiltuda spada o 3dB

Wn = [2*f1/fs 2*f2/fs];     %unormowana "szeroko��" pasma pracy (matlab sam dodaje pi)
ftype = 'stop';             %typ filtru pasmowo zaporowy

[b,a] = butter(n/2,Wn,ftype);   %n/2 bo parametr 2n, b - licznik, a - mianownik transmitancji

[h,Hd] = filtr50;       %u�yte gui do robienia filtr�w

load('filtr50.mat');
[B,A] = sos2tf(SOS,G);

N=2048;         %ilo�� pr�bek do wykresu
ts=1/fs;        %okres pr�bkowania

t = ts*(0:N-1);     %wektor czasu 

figure;
freqz(b,a, 2^16)
figure;
freqz(B,A, 2^16)


dataIn = sin(2*pi*f*t);          %sinus o cz�stotliwo�ci odfiltrowywanej
dataOut = filter(b,a,dataIn);    %po filtracji 
dataOut2 = filter(B,A, dataIn);
figure;
plot(t, dataIn, '-r' ,t, dataOut, '-b', t, dataOut2, '-g' )