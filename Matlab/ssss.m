clear all
close all
fs=2000;
fc1=40;
fc2=70;

[b,a]=ellip(4,1,100,[2*fc1/(fs), 2*fc2/(fs)],'bandpass');
rzad=4;
liczba_bit=20;
figure(2)
freqz(b,a);
[sos,g]=tf2sos(b,a);
g_prim=g^(1/2);

N=1000; % 100 test samples
%x=randn(N,1); % generate random samples
x=ones(1,N)*100;

y=zeros(N,1); % allocate output array
d=zeros(3,1); % clear delay line

for i=1:rzad/2
    for j=1:6
        sos3(i,j)=fixpoint(sos(i,j),liczba_bit);
    end
end


m=fixpoint(g_prim,liczba_bit);
m
hdl_creator(sos3,rzad/2,liczba_bit,m,'BandPass_top')

