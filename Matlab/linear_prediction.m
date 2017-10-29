 clear all;
 close all;

   fs = 2000;
   dt = 1/fs;
   StopTime = 0.08;
   t = (0:dt:StopTime-dt)';
   fc = 50;
   sinus = sin(2*pi*fc*t);
   fz = 200;
   temp = sin(2*pi*fz*t);
   sinus_zaburzony = sinus + temp;
   x = awgn(sinus, 5);              %dodanie szumu bialego do sinusa 50hz

plot(1:160,sinus,'-r',1:160,sinus_zaburzony,'-g',1:160,x,'-b')
title 'Sygnaly przed filtracja'
legend('50Hz','50Hz + 200Hz', '50Hz + Bialy szum')

a = lpc(sinus,100);
b = lpc(sinus_zaburzony,100);
c = lpc(x,100);


est_a = filter([0 -a(2:end)],1,sinus);
est_b = filter([0 -b(2:end)],1,sinus_zaburzony);
est_c = filter([0 -c(2:end)],1,x);

figure
plot(1:160,est_a,'-r',1:160,est_b,'-g',1:160,est_c,'-b')
title 'Sygnaly po filtracji'
legend('50Hz','50Hz + 200Hz', '50Hz + Bialy szum')

e = sinus-est_a;
f = sinus_zaburzony-est_b;
g = x-est_c;

figure
plot(1:160,e,'-r',1:160,f,'-g',1:160,g,'-b')
title 'Roznica sygnalow przed i po filtracji'
legend('50Hz','50Hz + 200Hz', '50Hz + Bialy szum')
