clear all
close all
fs=48000;
fc=2000;
liczba_bit=10;
[b,a]=cheby2(2,30,2*fc/fs);
[sosl,g] = tf2sos(b,a);
%figure(1)
 %freqz(b,a);

for i=1:1
    for j=1:6
        [A,sos2(i,j),sos3(i,j)]=fixpoint(sosl(i,j),liczba_bit);
    end
end

bp(1,1:3)=sos2(1,1:3);
ap(1,1:3)=sos2(1,4:6);

probka=1000;
R1=0;
R2=0;
R3=0;
k=1:200;

sos2
sos3

[l,k,m]=fixpoint(g,liczba_bit);

hdl_creator(sos3,1,liczba_bit,m)
m

for i=k
       
    b0_g=bp(1,1)*probka;
    b1_g=bp(1,2)*probka;
    b2_g=bp(1,3)*probka;
    %R3p(i)=R3;
    
    R3=floor(b0_g+R1);
    a1_g=R3*ap(1,2);
    a2_g=R3*ap(1,3);
    Rg=R3*g^(1/3);
    R1=b1_g-a1_g+R2;
    R2=b2_g-a2_g;
end

%figure(2)
%plot(k,R3p)