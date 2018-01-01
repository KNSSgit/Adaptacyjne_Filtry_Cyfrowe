clear all
close all
fs=2000;   %czestotliwosc probkowania
fc1=20;   %czestotliwosc odciecia pierwszego filtru
fsin=1;  %czestotliwosc sygnalu do wyciecia
rzad=6;
[b1,a1]=butter(rzad,2*fc1/fs,'high');

figure()
freqz(b1,a1);
[sos1,g1] = tf2sos(b1,a1);
g2=g1^(1/3);
title('Pierwszy filtr');

% drugi filtr od 150
fc2=10;  %czestotliwosc odciecia pierwszego filtru
[b2,a2]=butter(rzad,2*fc2/fs,'high');
[sos2,g3] = tf2sos(b2,a2);
g4=g3^(1/3);
figure()
freqz(b2,a2);
title('Drugi filtr');

t=[0:1/fs:20];
sygnal=sin(2*pi*fsin*t);
figure()

plot(sygnal)
title('Wejsciowy sygnal');
y1=zeros(length(t),1); % allocate output array
d=zeros(3,1); % clear delay line

for q=1:3
    for n=1:length(t)
        if (n<15)
                y1(n)=sos1(q,1)*sygnal(n)+d(1);
                d(1)=sos1(q,2)*sygnal(n)-sos1(q,5)*y1(n)+d(2);
                d(2)=sos1(q,3)*sygnal(n)-sos1(q,6)*y1(n);
                y1(n)=y1(n)*g2;
        else
                y1(n)=sos2(q,1)*sygnal(n)+d(1);
                d(1)=sos2(q,2)*sygnal(n)-sos2(q,5)*y1(n)+d(2);
                d(2)=sos2(q,3)*sygnal(n)-sos2(q,6)*y1(n);
                y1(n)=y1(n)*g4;
        end
    end
end
figure()
plot(y1)
title('Wyjscie z dwoch filtrow');

y2=zeros(length(t),1); % nowy wektor wyjsciowy
d=zeros(3,1); % wyczyszczenie rejestrow
for q=1:3    
    for n=1:length(t)    
                y2(n)=sos2(q,1)*sygnal(n)+d(1);
                d(1)=sos2(q,2)*sygnal(n)-sos2(q,5)*y2(n)+d(2);
                d(2)=sos2(q,3)*sygnal(n)-sos2(q,6)*y2(n);
                y2(n)=y2(n)*g4;
    end
end
figure()
plot(y2)
title('Wyjscie z jednego filtra');

