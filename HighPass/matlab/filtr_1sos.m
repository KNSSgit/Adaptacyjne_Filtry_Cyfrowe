clear all
close all
fs=48000;
fc=5000;
liczba_bit=20;
[b,a]=cheby2(2,30,2*fc/fs);
[sosl,g] = tf2sos(b,a);
figure(1)
 freqz(b,a);

for i=1:1
    for j=1:6
        sos3(i,j)=fixpoint(sosl(i,j),liczba_bit);
    end
end



probka=1000;
R1=0;
R2=0;
R3=0;
k=1:200;


sos3

m=fixpoint(g,liczba_bit);

hdl_creator(sos3,1,liczba_bit,m,'High_pas_top')

