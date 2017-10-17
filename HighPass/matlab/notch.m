%//////////////////////////////////////////////////////////////////////////////////
%// Ko�o Naukowe System�w Scalonych
%// 10.2017
%// 
%// Project: Adaptacyjne filtry cyfrowe do kondycjonowania sygna��w biomedycznych 
%//////////////////////////////////////////////////////////////////////////////////

clear all;
close all;

format long
liczba_bit=20;
n = 4;      %rz�d filtru
fs = 2000;    %cz�stotliwo�� pr�bkowania
f = 50;       %cz�stotliwo�� wyci�cia
f1 = f-3;     %cz�stotliwo�� mniejsza od f dla kt�rej ampiltuda spada o 3dB
f2 = f+3;     %cz�stotliwo�� wi�ksza od f dla kt�rej ampiltuda spada o 3dB

Wn = [2*f1/fs 2*f2/fs];     %unormowana "szeroko��" pasma pracy (matlab sam dodaje pi)
ftype = 'stop';             %typ filtru pasmowo zaporowy

[b,a] = butter(n/2,Wn,ftype);   %n/2 bo parametr 2n, b - licznik, a - mianownik transmitancji

[SOS, G] = tf2sos(b,a);     %wytworzenie wsp�czynnik�w do biquada


for i=1:n/2
    for j=1:6
        [A,sos2(i,j),sos3(i,j)]=fixpoint(SOS(i,j),liczba_bit);
    end
end

[l,k,m]=fixpoint(G^(1/2),liczba_bit);

hdl_creator(sos3,n/2,liczba_bit,m)

N=2048;         %ilo�� pr�bek do wykresu
ts=1/fs;        %okres pr�bkowania

t = ts*(0:N-1);     %wektor czasu 

figure;
freqz(b,a, 2^16)

dataIn = sin(2*pi*f*t);          %sinus o cz�stotliwo�ci odfiltrowywanej
dataOut = filter(b,a,dataIn);    %po filtracji 

dataOut2 = filter(SOS(1, 1:3), SOS(1, 4:6), dataIn);
dataOut3 = filter(SOS(2, 1:3), SOS(2, 4:6), dataOut2);  %sprawdzenie matrycy SOS

figure;
plot(t, dataIn, '-r' ,t, dataOut, '-b', t, dataOut3, '-g' )


disp(['Wsp�czynnik b0 filtru pierwszego: ', dec2fixpoint(SOS(1,1), 32)]);
disp(['Wsp�czynnik b1 filtru pierwszego: ', dec2fixpoint(SOS(1,2), 32)]);
disp(['Wsp�czynnik b2 filtru pierwszego: ', dec2fixpoint(SOS(1,3), 32)]);
disp(['Wsp�czynnik a0 filtru pierwszego: ', dec2fixpoint(SOS(1,4), 32)]);
disp(['Wsp�czynnik a1 filtru pierwszego: ', dec2fixpoint(SOS(1,5), 32)]);
disp(['Wsp�czynnik a2 filtru pierwszego: ', dec2fixpoint(SOS(1,6), 32)]);
disp(['Wsp�czynnik b0 filtru drugiego:   ', dec2fixpoint(SOS(2,1), 32)]);
disp(['Wsp�czynnik b1 filtru drugiego:   ', dec2fixpoint(SOS(2,2), 32)]);
disp(['Wsp�czynnik b2 filtru drugiego:   ', dec2fixpoint(SOS(2,3), 32)]);
disp(['Wsp�czynnik a0 filtru drugiego:   ', dec2fixpoint(SOS(2,4), 32)]);
disp(['Wsp�czynnik a1 filtru drugiego:   ', dec2fixpoint(SOS(2,5), 32)]);
disp(['Wsp�czynnik a2 filtru drugiego:   ', dec2fixpoint(SOS(2,6), 32)]);