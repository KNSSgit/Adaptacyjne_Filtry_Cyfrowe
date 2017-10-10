clear all
close all
fs=48000;

format long
liczba_bit=20;
n = 2;      %rz¹d filtru
fs = 2000;    %czêstotliwoœæ próbkowania
f = 50;       %czêstotliwoœæ wyciêcia
f1 = f-3;     %czêstotliwoœæ mniejsza od f dla której ampiltuda spada o 3dB
f2 = f+3;     %czêstotliwoœæ wiêksza od f dla której ampiltuda spada o 3dB

Wn = [2*f1/fs 2*f2/fs];     %unormowana "szerokoœæ" pasma pracy (matlab sam dodaje pi)
ftype = 'stop';             %typ filtru pasmowo zaporowy

[b,a] = butter(n/2,Wn,ftype);   %n/2 bo parametr 2n, b - licznik, a - mianownik transmitancji

[SOS, g] = tf2sos(b,a);     %wytworzenie wspó³czynników do biquada


for i=1:1
    for j=1:6
        [A,sos2(i,j),sos3(i,j)]=fixpoint(SOS(i,j),liczba_bit);
    end
end

bp(1,1:3)=sos2(1,1:3);
ap(1,1:3)=sos2(1,4:6);

for i=1:1
    for j=1:3
        [o,h(i,j),fix_b(i,j)]=fixpoint(bp(i,j),liczba_bit);
    end
end

for i=1:1
    for j=1:3
        [ol,hl(i,j),fix_a(i,j)]=fixpoint(ap(i,j),liczba_bit);
    end
end


probka=1000;
R1=0;
R2=0;
R3=0;
k=200;

[l,n,m]=fixpoint(g,liczba_bit);

%% Time specifications:
   Fs = 2000;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 0.1;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %% Sine wave:
   Fc = 50;                     % hertz
   probka = 770.*sin(2*pi*Fc*t)+780;
   
for i=1:k
       
    b0_g=floor(fix_b(1,1)*probka(i)/2^(liczba_bit));
    b1_g=floor(fix_b(1,2)*probka(i)/2^(liczba_bit));
    b2_g=floor(fix_b(1,3)*probka(i)/2^(liczba_bit));
    
    
    R3=floor((b0_g+R1));
    R3p(i)=R3;
    a1_g=floor(R3*ap(1,2)/2^(liczba_bit));
    a2_g=floor(R3*ap(1,3)/2^(liczba_bit));
    Rg=R3*g^(1/3);
    R1=b1_g-a1_g+R2;
    R2=b2_g-a2_g;
end

figure(2)
plot(1:k,R3p)