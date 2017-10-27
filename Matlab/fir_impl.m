clear all;
close all;
%load('ecg.mat')
%% Time specifications:
   Fs = 2000;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 5;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %% Sine wav1e:
   Fc = 10;         
   Fn=50 ;                          % Czêstotliwoœæ szumu
   x = sin(2*pi*Fc*t);         % sygna³ bez szumu
   noise=50.*cos(2*pi*Fn*t);        % szum
   signal=x+0.3*randn(size(x));


   %%
Tap_number=100;                      % rz¹d filtru fir
fifo=zeros(1,Tap_number);           %rejestry opóŸniaj¹ce
b = zeros(1,Tap_number);            %zmienna przetrzymuj¹ca wspó³czynniki filtru fir
b(1) = 1;
u=0.01;                         % ma³a liczba okreœlaj¹ca zbie¿noœæ algorytmu
delay=2;
czas=1:length(t)-delay;
for i=1:length(t)-delay
% przesówanie rejestrów opóŸniaj¹cych
for k=Tap_number:-1:2
fifo(k) = fifo(k-1);
end
fifo(1) = signal(i+delay);
%filtracja szumu
y=0;
for J = 1:Tap_number
y = y + b(J)*fifo(J);
end

e(i)=signal(i)-y;       % Obliczenie b³êdu

%obliczenie wspó³czynników filtru na nastêpn¹ próbkê 
for J = 1:Tap_number
b(J) = b(J) + u*e(i)*fifo(J);
end
out(i)=y;
%
end

figure
%plot(t,y,'r',t,signal,'b')
%title('zaszumiony sygna³')
%figure(3)
%plot(t,out,'r',t,noise,'b');
%title('wynik algorytmu vs szum szygna³u')
%legend('wynik algorytmu','szum wejœciowy')
%figure(4)
%plot(t,signal-out','b',t,x,'r');
%title('efekt koñcowy')
%legend('sygna³ po filtracji','wejœciowy sygna³ bez szumu')
plot(czas,signal(1:1:length(czas)),czas,out)
figure()
plot(e)
