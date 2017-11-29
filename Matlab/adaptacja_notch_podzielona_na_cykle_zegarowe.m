clear all
close all


fs = 360;               %czestotliwosc probkowania
time = 15;              %czas dzialania                                    !!!!!!!!!!czas dzialania
    
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
    u = 15;                            %wielkosc kroku                      !!!!!!!!!!wielkosc kroku
    r = 0.98;                          %szerokosc notcha                   !!!!!!!!!!szerokosc notcha

%% Znieksztalcony EKG


%% Pierwsza filtracja

rzad = 4;
    fc1 = 45;
    fc2 = 65;
[b1,m1] = ellip(rzad,1,100,[2*fc1/(fs), 2*fc2/(fs)],'bandpass');
freqz(b1,m1)

filter_sig = filter(b1,m1,sig);
%abc = filter(b1,m1,sig);
%figure()
%semilogy(abs(fftshift(fft(abc))))
%%Przygotowanie danych fixpoint
%for liczba=t
%    x(i)=dec2twos(filter_sig,40);
%end
%    a=fixpoint(a,40);
%    u=fixpoint(2*u,40);
%% Adaptowanie filtru
    we1 = 0;
    R3 = 0;
    R2 = 0;
    R1 = 0;
    wy1 = 0;
    x1 = 0;     % do ko�cowj wiltracji
    x2 = 0;     %
    y1 = 0;     %
    y2 = 0;     %
    x=filter_sig;       %% nie chce mi si� zmienia� wszystkich x (wiadomo o co chodzi)
    a_next = 0;
    for i = 1:N 
        R3=R1+x(i);                 %pierwszy takt
        
                                
        R1=R2+(-a*x(i))+R3*(r*a);   %drugi takt
        
        a_next(i)=a+2*u*R3*(we1-(r*wy1));    %trzeci takt
        R2=x(i)-R3*r^2;
        
        a=a_next(i);                   %czwarty takt

        we1=x(i);
        wy1=R3;
        %filtracja ko�cowa
        y(i) = signal(i)-a*x1+x2+a*r*y1-r*r*y2;
        y2 = y1; 
        y1 = y(i);
        x2 = x1;
        x1 = signal(i);
    end

%% Filtracja adaptacyjna
%{
    x1 = 0;
    x2 = 0;
    y1 = 0;
    y2 = 0;
    for i = 1:N 
        y(i) = x(i)-a*x1+x2+a*r*y1-r*r*y2;
        y2 = y1; 
        y1 = y(i);
        x2 = x1;
        x1 = x(i);
    end
%}
    
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
    title('Sygnal');
    legend('Przed filtracja', 'Po filtracji');
    
    
    n = (-((N/2)-1) : N/2);
    figure();
    title('Widmo');
    legend('Przed filtracja', 'Po filtracji');
