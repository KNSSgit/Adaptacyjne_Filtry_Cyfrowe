clear all
close all
fs=6000;
fc=400;

[b,a]=cheby2(6,80,2*fc/fs);
rzad=6;
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

for i=1:3
    for j=1:6
        sos3(i,j)=fixpoint(sos(i,j),liczba_bit);
    end
end


m=fixpoint(g_prim,liczba_bit);
m
hdl_creator(sos3,rzad/2,liczba_bit,m,'High_pas_top')

%{
for i=1:3
b=sos(i,1:3);
a=sos(i,4:6);

%freqz(bg,a);


for n=1:N
 y(n)=b(1)*x(n)+d(1);
 d(1)=b(2)*x(n)-a(2)*y(n)+d(2);
 d(2)=b(3)*x(n)-a(3)*y(n);
 
end
z=y;
x=y;
end
figure(1)
y=y.*g;
plot(1:N,floor(y))

%}