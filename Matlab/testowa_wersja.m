clear all
close all


fs = 360;               %czestotliwosc probkowania
time = 200;              %czas dzialania                                    !!!!!!!!!!czas dzialania
    
%% Wczytanie EKG
    fid = fopen('100.dat','r');
    f = fread(fid,2*360*time,'ubit12');
    Orig_Sig = f(1:2:length(f));

%% Generacja zaklocenia:
   dt = 1/fs;                       % okres probkowania
   t = (0:dt:time-dt)';             % w sekundach
        
   freq = 57;                          % czestotliwosc zaklocenia          !!!!!!!!!!czestotliwosc zaklocenia
   noise = 5.*cos(2*pi*freq*t);        % zaklocenie

%% Ustawienia filtracji
    fi = 55;                        %czestotliwosc startowa                !!!!!!!!!!czestotliwosc startowa
    w = 2*pi*fi/fs;
    N = length(noise);
    a = 2*cos(w); 
    a_test = a;
    u = 1;                            %wielkosc kroku                      !!!!!!!!!!wielkosc kroku
    r = 0.98;                       %szerokosc notcha                   !!!!!!!!!!szerokosc notcha

%% Znieksztalcony EKG
    signal = Orig_Sig + noise;
    x = signal/1000;
%% wspó³czynniki filtru
rzad = 1;
fc1 = 45;
fc2 = 65;
[b1,m1] = ellip(rzad,1,50,[2*fc1/fs, 2*fc2/fs],'bandpass');


%% Adaptowanie filtru
    x1 = 0;
    x2 = 0;
    y1 = 0;
    y2 = 0;
    a1 = 0;
    d=[0;0;0];
    d2=[0;0;0];
    y_po_f=0;
    x_po_f=0;
    for i = 1:N 
        y(i) = x(i)-a*x1+x2+a*r*y1-r*r*y2;
             %filtracja wyjœcia
             n=i;
             out_fy(n)=b1(1)*y(n)+d(1);
             d(1)=b1(2)*y(n)-m1(2)*out_fy(n)+d(2);
             d(2)=b1(3)*y(n)-m1(3)*out_fy(n);
             %filtracja wejœcia
             out_fx(n)=b1(1)*x(i)+d2(1);
             d2(1)=b1(2)*x(i)-m1(2)*out_fx(n)+d2(2);
             d2(2)=b1(3)*x(i)-m1(3)*out_fx(n); 
        
        a1(i) = a+2*u*out_fy(i)*(x_po_f-r*y_po_f);
        a = a1(i);
        y2 = y1; 
        y1 = y(i);
        x2 = x1;
        x1 = x(i);
        y_po_f=out_fy(n);
        x_po_f=out_fx(n);
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
    plot(t,signal/1000,'-b',t,y,'-r');
    title('Sygnal');
    legend('Przed filtracja', 'Po filtracji');
    
    
    n = (-((N/2)-1) : N/2);
    figure();
    semilogy(n * fs/N,abs(fftshift(fft(signal/1000))),'-b',n * fs/N,abs(fftshift(fft(y))),'-r');
    title('Widmo');
    legend('Przed filtracja', 'Po filtracji');
