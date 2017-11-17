clear all
close all


fs = 360;               %czestotliwosc probkowania
time = 20;              %czas dzialania                                    !!!!!!!!!!czas dzialania
    
%% Wczytanie EKG
    fid = fopen('100.dat','r');
    f = fread(fid,2*360*time,'ubit12');
    Orig_Sig = f(1:2:length(f));

%% Generacja zaklocenia:
   dt = 1/fs;                       % okres probkowania
   t = (0:dt:time-dt)';             % w sekundach
        
   freq = 60;                          % czestotliwosc zaklocenia          !!!!!!!!!!czestotliwosc zaklocenia
   noise = 3.5.*cos(2*pi*freq*t);        % zaklocenie

%% Ustawienia filtracji
    fi = 55;                        %czestotliwosc startowa                !!!!!!!!!!czestotliwosc startowa
    w = 2*pi*fi/fs;
    N = length(noise);
    a = 2*cos(w); 
    a_test = a;
    u = 10;                            %wielkosc kroku                      !!!!!!!!!!wielkosc kroku
    r = 0.98;                          %szerokosc notcha                   !!!!!!!!!!szerokosc notcha

%% Znieksztalcony EKG
    signal = Orig_Sig + noise;
    sig = signal/1000;

%{ 
%% Pierwsza filtracja
    fc1 = 45;
    [b1,m1] = butter(6,2*fc1/fs,'high');
    fc2 = 65;
    [b2,m2] = butter(6,2*fc2/fs,'low');
    filter_out = filter(b1,m1,sig);
    filter_out = filter(b2,m2,filter_out);
    x = filter_out;
%} 
%    [b1,m1]=butter(2,2*45/fs,'high');
 %   x = filter(b1,m1,sig);
rzad = 2;
h  = fdesign.bandpass('N,Fp1,Fp2,Ast1,Ap,Ast2', rzad, 45, 65, 200, 1, 200, 2000);
Hd = design(h, 'ellip');

for i = 1:(rzad/2)
    Hd.sosMatrix(i,1:3) = Hd.sosMatrix(i,1:3) * Hd.ScaleValue(i);
end

[b1,m1] = sos2tf(Hd.sosMatrix);
x = filter(b1,m1,sig);
abc = filter(b1,m1,sig);
 
%% Adaptowanie filtru
    x1 = 0;
    x2 = 0;
    y1 = 0;
    y2 = 0;
    a1 = 0;
    for i = 1:N 
        y(i) = x(i)-a*x1+x2+a*r*y1-r*r*y2;
        a1(i) = a+2*u*y(i)*(x1-r*y1);
        a = a1(i);
        y2 = y1; 
        y1 = y(i);
        x2 = x1;
        x1 = x(i);
    end

%% Filtracja adaptacyjna
    x = signal;
    for i = 1:N 
        y(i) = x(i)-a*x1+x2+a*r*y1-r*r*y2;
        y2 = y1; 
        y1 = y(i);
        x2 = x1;
        x1 = x(i);
    end

    
%% Wyswietlanie wykresow
    den_test = [1, -a_test*r, r^2];             %denominator odpowiedzi przed adaptacja
    nume_test = [1, -a_test, 1];                %numeraotr odpowiedzi przed adaptacja
    [H_test,F_test] = freqz(nume_test,den_test,5120,fs); %odpowiedz przed adaptacja
    HdB_test = -abs(20*log10(H_test));

    den = [1, -a*r, r^2];                       %denominator odpowiedzi po adaptacji
    nume = [1, -a, 1];                          %numerator odpowiedzi po adaptacji
    [H,F] = freqz(nume,den,5120,fs);            %odpowiedz po adpatacji
    HdB = -abs(20*log10(H));
    
    figure();
    plot(F_test,HdB_test,'-b',F,HdB,'-r');
    xlabel('Czestotliwosc [Hz]');
    ylabel('Zysk [dB]');
    title('Odpowiedzi impulsowe notcha');
    legend('Przed adaptacja', 'Po adaptacji');
      
    figure();
    plot(t,signal,'-b',t,y,'-r');
    title('Sygnal');
    legend('Przed filtracja', 'Po filtracji');
    
    
    n = (-((N/2)-1) : N/2);
    figure();
    semilogy(n * fs/N,abs(fftshift(fft(signal))),'-b',n * fs/N,abs(fftshift(fft(y))),'-r');
    title('Widmo');
    legend('Przed filtracja', 'Po filtracji');
