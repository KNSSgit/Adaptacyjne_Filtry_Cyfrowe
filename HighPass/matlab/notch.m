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
fs = 20000;    %cz�stotliwo�� pr�bkowania
f = 50;       %cz�stotliwo�� wyci�cia
f1 = f-3;     %cz�stotliwo�� mniejsza od f dla kt�rej ampiltuda spada o 3dB
f2 = f+3;     %cz�stotliwo�� wi�ksza od f dla kt�rej ampiltuda spada o 3dB

Wn = [2*f1/fs 2*f2/fs];     %unormowana "szeroko��" pasma pracy (matlab sam dodaje pi)
ftype = 'stop';             %typ filtru pasmowo zaporowy

[b,a] = butter(n/2,Wn,ftype);   %n/2 bo parametr 2n, b - licznik, a - mianownik transmitancji

[SOS, G] = tf2sos(b,a);     %wytworzenie wsp�czynnik�w do biquada


for i=1:n/2
    for j=1:6
        sos3(i,j)=fixpoint(SOS(i,j),liczba_bit);
    end
end

m=fixpoint(G^(1/2),liczba_bit);
hdl_creator(sos3,n/2,liczba_bit,m,'Notch_top')

figure;
freqz(b,a, 2^16)