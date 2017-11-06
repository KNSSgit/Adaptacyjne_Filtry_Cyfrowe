 clear all;
 close all;

   fs = 2770;
   dt = 1/fs;
   StopTime = 13*0.02;%0.02
   t = (0:dt:StopTime-dt)';
   fc = 50;
   sinus = 20.*sin(2*pi*fc*t);
   fz = 200;
   temp = sin(2*pi*fz*t);
   sinus_zaburzony = sinus + temp;
   x = awgn(sinus, 5);              %dodanie szumu bialego do sinusa 50hz
   
    fid=fopen('100.dat','r');
    time=10;
    f=fread(fid,2*360*time,'ubit12');
    Orig_Sig=f(1:2:length(f));
    Orig_Sig = Orig_Sig - 900;
    ekg = Orig_Sig .* 1;

   fs = 180000;
   dt = 1/fs;
   StopTime = 0.02;
   t = (0:dt:StopTime-dt)';
   fc = 50*650;                     
   sinus = 25.*sin(2*pi*fc*t) + 25.*sin(2*pi*70*650*t) + 25.*sin(2*pi*100*650*t);
  
   ekg_zabrudzony = ekg + sinus;
   plot(ekg_zabrudzony(1:720))
   title('Sygnal wejsciowy zaklocony')
   
   
   figure
   plot(abs(fft(ekg_zabrudzony)))

    %figure 
%plot(1:length(t),sinus,'-r',1:length(t),sinus_zaburzony,'-g',1:length(t),x,'-b')
%title 'Sygnaly przed filtracja'
%legend('50Hz','50Hz + 200Hz', '50Hz + Bialy szum')

a = lpc(sinus(1:2),1);
b = lpc(sinus_zaburzony(1:2),1);
c = lpc(x(1:5),1);
d = lpc(ekg_zabrudzony(1:30),5);

est_a = filter([0 -a(2:end)],1,sinus);
est_b = filter([0 -b(2:end)],1,sinus_zaburzony);
est_c = filter([0 -c(2:end)],1,x);
est_d = filter([0 -d(2:end)],1,ekg_zabrudzony);

figure
plot(est_d(1:720))
title('Przefiltrowany sygnal wejsciowy')

%figure
%plot(1:length(t),est_a,'-r',1:length(t),est_b,'-g',1:length(t),est_c,'-b')
%title 'Sygnaly po filtracji'
%legend('50Hz','50Hz + 200Hz', '50Hz + Bialy szum')

e = sinus-est_a;
f = sinus_zaburzony-est_b;
g = x-est_c;
h = ekg_zabrudzony - est_d;

figure
plot(h(1:720))
title('Roznica sygnalu wejsciowego z wyjsciowym')

%figure
%plot(1:length(t),e,'-r',1:length(t),f,'-g',1:length(t),g,'-b')
%title 'Roznica sygnalow przed i po filtracji'
%legend('50Hz','50Hz + 200Hz', '50Hz + Bialy szum')

signal = ekg_zabrudzony;
d = est_d; %h

Tap_number=50;                      % rz�d filtru fir
fifo=zeros(1,Tap_number);           %rejestry op�niaj�ce
b = zeros(1,Tap_number);            %zmienna przetrzymuj�ca wsp�czynniki filtru fir
b(1) = 1;
u=0.0000001;                         % ma�a liczba okre�laj�ca zbie�no�� algorytmu


for i=1:length(t)
% przes�wanie rejestr�w op�niaj�cych
for k=Tap_number:-1:2
fifo(k) = fifo(k-1);
end;
fifo(1) = d(i);
%filtracja szumu
y=0;
for J = 1:Tap_number
y = y + b(J)*fifo(J);
end;

e(i)=signal(i)-y;       % Obliczenie b��du

%obliczenie wsp�czynnik�w filtru na nast�pn� pr�bk� 
for J = 1:Tap_number
b(J) = b(J) + u*e(i)*fifo(J);
end;
out(i)=y;
%
end
%figure
%plot(t,y,'r',t,signal,'b')
%title('zaszumiony sygna�')
figure

plot(t,signal-out','b',t,Orig_Sig,'r');
title('efekt ko�cowy')
legend('sygna� po filtracji','wej�ciowy sygna� bez szumu')

figure
plot(abs(fft(signal-out')))
