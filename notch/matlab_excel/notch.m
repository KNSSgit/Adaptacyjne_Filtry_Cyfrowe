%//////////////////////////////////////////////////////////////////////////////////
%// Kolo Naukowe Systemow Scalonych
%// 10.2017
%// 
%// Projekt: Adaptacyjne filtry cyfrowe do kondycjonowania sygnalow biomedycznych 
%//////////////////////////////////////////////////////////////////////////////////

clear all;
close all;

format long

n = 4;      %rzad filtru
fs = 2000;    %czestotliwosc probkowania
f = 50;       %czestotliwosc wyciecia
f1 = f-3;     %czestotliwosc mniejsza od f dla ktorej ampiltuda spada o 3dB
f2 = f+3;     %czestotliwosc wieksza od f dla ktorej ampiltuda spada o 3dB

Wn = [2*f1/fs 2*f2/fs];     %unormowana "szerokosc" pasma pracy (matlab sam dodaje pi)
ftype = 'stop';             %typ filtru pasmowo zaporowy

[b,a] = butter(n/2,Wn,ftype);   %n/2 bo parametr 2n, b - licznik, a - mianownik transmitancji

[SOS, G] = tf2sos(b,a);     %wytworzenie wspolczynnikow do biquada

G_prim = G^(1/2);

N=2048;         %ilosc probek do wykresu
ts=1/fs;        %okres probkowania

t = ts*(0:N-1);     %wektor czasu 

figure;
freqz(b,a, 2^16)

dataIn = sin(2*pi*f*t);          %sinus o czestotliwosci odfiltrowywanej
dataOut = filter(b,a,dataIn);    %po filtracji 

dataOut2 = filter(SOS(1, 1:3), SOS(1, 4:6), dataIn);
dataOut3 = filter(SOS(2, 1:3), SOS(2, 4:6), dataOut2);  %sprawdzenie matrycy SOS

figure;
plot(t, dataIn, '-r' ,t, dataOut, '-b', t, dataOut3, '-g' )


disp(['Wspolczynnik b0 filtru pierwszego: ', dec2fixpoint(SOS(1,1), 20)]);
disp(['Wspolczynnik b1 filtru pierwszego: ', dec2fixpoint(SOS(1,2), 20)]);
disp(['Wspolczynnik b2 filtru pierwszego: ', dec2fixpoint(SOS(1,3), 20)]);
disp(['Wspolczynnik a0 filtru pierwszego: ', dec2fixpoint(SOS(1,4), 20)]);
disp(['Wspolczynnik a1 filtru pierwszego: ', dec2fixpoint(SOS(1,5), 20)]);
disp(['Wspolczynnik a2 filtru pierwszego: ', dec2fixpoint(SOS(1,6), 20)]);
disp(['Wspolczynnik b0 filtru drugiego:   ', dec2fixpoint(SOS(2,1), 20)]);
disp(['Wspolczynnik b1 filtru drugiego:   ', dec2fixpoint(SOS(2,2), 20)]);
disp(['Wspolczynnik b2 filtru drugiego:   ', dec2fixpoint(SOS(2,3), 20)]);
disp(['Wspolczynnik a0 filtru drugiego:   ', dec2fixpoint(SOS(2,4), 20)]);
disp(['Wspolczynnik a1 filtru drugiego:   ', dec2fixpoint(SOS(2,5), 20)]);
disp(['Wspolczynnik a2 filtru drugiego:   ', dec2fixpoint(SOS(2,6), 20)]);
disp(['Wspolczynnik pierwiastek z G:      ', dec2fixpoint(G_prim, 20)]);
