clear all
close all
fs=6000;
fc=400;
rzad=2;
[b,a]=cheby2(rzad,80,2*fc/fs);

liczba_bit=20;
figure(2)
freqz(b,a);
[sos,g]=tf2sos(b,a);
g_prim=g^(1/3);

N=1000; % 100 test samples
%x=randn(N,1); % generate random samples
x=ones(1,N)*100;

y=zeros(N,1); % allocate output array
d=zeros(3,1); % clear delay line


for n=1:N                           % tu se filtrujesz mo¿esz zmieniæ tak ¿eby by³ 6 stopnia ten filtr
 y(n)=b(1)*x(n)+d(1);
 d(1)=b(2)*x(n)-a(2)*y(n)+d(2);
 d(2)=b(3)*x(n)-a(3)*y(n);
 
end

figure(1)

plot(1:N,floor(y))
