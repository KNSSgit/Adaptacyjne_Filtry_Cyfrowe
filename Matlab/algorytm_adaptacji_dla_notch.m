clear all
clc
close all
Fs = 360;  
%% EKG
fid=fopen('100.dat','r');
time=50;
f=fread(fid,2*360*time,'ubit12');
Orig_Sig=f(1:2:length(f));
%plot(Orig_Sig)


%% Noise:
   dt = 1/Fs;                   % seconds per sample
   StopTime = time;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
  
        
   Fn=50 ;                          % Czêstotliwoœæ szumu
   noise=8.*cos(2*pi*Fn*t);        % szum

%% Filter setting


fs=360; %sampling frequency in Hz
fi=55;%czêstotliwoœæ startowa
w=2*pi*fi/fs;
N=length(noise);
a=2*cos (w); 
a_test=a;
u=0.5; %step size
r=0.8;
nT=0:N;
%% zniekszta³cony EKG
signal=Orig_Sig+noise;
sig=signal/1000;
%% pierwsza filtracja
fc=45;
[b,m]=butter(6,2*fc/fs,'high');
filter_out=filter(b,m,sig);

x=filter_out;
z=filter_out;

%% Adaptive algorithm
x1=0; %Initialisation
x2=0;
y1=0;
y2=0;
a1=0;
for i=1:N 
y(i)=x(i)-a*x1+x2+a*r*y1-r*r*y2;
a1(i)=a+2*u*y(i)*(x1-r*y1);
a=a1(i);
y2=y1; 
y1=y(i);
x2=x1;
x1=x (i);
end

%subplot (2,1,1), plot(x);title ('Single Channel Adaptive Notch Filter with Frequency Drift');
%xlabel('No. of Samples') ;ylabel('Input Sequence');
%subplot (2,1,2), plot(y);ylabel('Output Sequence'); 


%figure

%semilogy(abs(fftshift(fft(y))))
%title('po filtracji')
%figure
%semilogy(abs(fftshift(fft(x))))
%title('przed filtracj¹')

%semilogy(abs(fftshift(fft(z))))
%title('po pierwszej')
%a=a_test
den= [1, -a*r, r^2] ; % Denominator of the response
nume= [1, -a, 1]; % Numerator fo the response
[H,F]=freqz(nume,den,5120,fs); %Compute Frequency response
HdB=20*log10(H);
figure();
plot(F,HdB);
xlabel ('Frequecny in Hz') ;ylabel('Gain in dB');
title ('notch po algorytmnie z 2 pdfa'); 

x=signal;
for i=1:N 
y(i)=x(i)-a*x1+x2+a*r*y1-r*r*y2;
y2=y1; 
y1=y(i);
x2=x1;
x1=x (i);
end

figure()
plot(y);
title('sygna³ po filtracji ')
figure()
semilogy(abs(fftshift(fft(y))))
title('efekt koñcowy')

a=a_test;
den= [1, -a*r, r^2] ; % Denominator of the response
nume= [1, -a, 1]; % Numerator fo the response
[H,F]=freqz(nume,den,5120,fs); %Compute Frequency response
HdB=20*log10(H);
figure();
plot(F,HdB);
xlabel ('Frequecny in Hz') ;ylabel('Gain in dB');
title ('notch startowa wartoœæ'); 