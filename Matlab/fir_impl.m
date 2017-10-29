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
   Fn=50 ;                          % Cz�stotliwo�� szumu
   x = sin(2*pi*Fc*t);         % sygna� bez szumu
   noise=0.5.*cos(2*pi*Fn*t);        % szum
   noise_2=0.5.*randn(size(x));
   signal=x+noise_2;


   %%
Tap_number=30;                      % rz�d filtru fir
fifo=zeros(1,Tap_number);           %rejestry op�niaj�ce
b = ones(1,Tap_number);            %zmienna przetrzymuj�ca wsp�czynniki filtru fir
b(1) = 1;
u=0.0001;                         % ma�a liczba okre�laj�ca zbie�no�� algorytmu
delay=2000;
czas=1:length(t)-delay;

%% Filtracja
for i=1:length(t)-delay
% przes�wanie rejestr�w op�niaj�cych
for k=Tap_number:-1:2
fifo(k) = fifo(k-1);
end
fifo(1) = signal(i+delay);
%filtracja szumu
y=0;
for J = 1:Tap_number
y = y + b(J)*fifo(J);
end
out(i)=y;
e(i)=signal(i)-y;       % Obliczenie b��du

%obliczenie wsp�czynnik�w filtru na nast�pn� pr�bk� 
for J = 1:Tap_number
b(J) = b(J) + u*e(i)*fifo(J);
end

%
end

figure
%plot(t,y,'r',t,signal,'b')
%title('zaszumiony sygna�')
%figure(3)
%plot(t,out,'r',t,noise,'b');
%title('wynik algorytmu vs szum szygna�u')
%legend('wynik algorytmu','szum wej�ciowy')
%figure(4)
%plot(t,signal-out','b',t,x,'r');
%title('efekt ko�cowy')
%legend('sygna� po filtracji','wej�ciowy sygna� bez szumu')
plot(czas,signal(1:1:length(czas)),czas,out)
figure()
plot(e)
