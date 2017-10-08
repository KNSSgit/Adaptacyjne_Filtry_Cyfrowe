   clear all
   close all
   format long
%% Time specifications:
   Fs = 6000;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 1;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   %% Sine wave:
   Fc = 10;                     % hertz
   x = 7000000.*sin(2*pi*Fc*t)+7700000;
   
   %% filter constr

fs=6000;
fc=400;

[b,a]=cheby2(2,20,2*fc/fs);
[sosl,g] = tf2sos(b,a);
figure(1)
 freqz(b,a);

for i=1:1
    for j=1:6
        [A,sos2(i,j),sos3(i,j)]=fixpoint(sosl(i,j),16);
    end
end

bp(1,1:3)=sos2(1,1:3);
ap(1,1:3)=sos2(1,4:6);

probka=1000;
R1=0;
R2=0;
R3=0;
k=1:1:300;

sos2
sos3

[l,f,m]=fixpoint(g,16);

m
%% filter
for i=k
    probka=x(i+1);   
    b0_g=bp(1,1)*probka;
    b1_g=bp(1,2)*probka;
    b2_g=bp(1,3)*probka;
    R3p(i)=R3;
    
    R3=floor(b0_g+R1);
    
    a1_g=R3*ap(1,2);
    a2_g=R3*ap(1,3);
    Rg=R3*g^(1/3);
    R1=floor(b1_g-a1_g+R2);
    
    R2=floor(b2_g-a2_g);
    Rp(4,i)=R3;
    Rp(3,i)=R2;
    Rp(2,i)=R1;
    Rp(1,i)=probka;
end

figure(2)
plot(k,R3p)
