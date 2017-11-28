clear all
close all


fs = 360;               %czestotliwosc probkowania
time = 10;              %czas dzialania                                    !!!!!!!!!!czas dzialania
liczba_bit=20;  
liczba_bit_wej=24;
%% Wczytanie EKG
    fid = fopen('100.dat','r');
    f = fread(fid,2*360*time,'ubit12');
    Orig_Sig = f(1:2:length(f));

%% Generacja zaklocenia:
   dt = 1/fs;                       % okres probkowania
   t = (0:dt:time-dt)';             % w sekundach
        
   freq = 48;                          % czestotliwosc zaklocenia          !!!!!!!!!!czestotliwosc zaklocenia
   noise = 3.5.*cos(2*pi*freq*t);        % zaklocenie

%% Ustawienia filtracji
    fi = 55;                        %czestotliwosc startowa                !!!!!!!!!!czestotliwosc startowa
    w = 2*pi*fi/fs;
    N = length(noise);
    a = stal_przec(2*cos(w),liczba_bit); 
    a_test = a;
    u = stal_przec(0.00002,liczba_bit)                  %wielkosc kroku  (ma³a ma byæ)!!!    jest przemno¿ona przez 2                  !!!!!!!!!!wielkosc kroku
    r = stal_przec(0.98,liczba_bit);                         %szerokosc notcha                   !!!!!!!!!!szerokosc notcha

%% Znieksztalcony EKG
    signal = Orig_Sig + noise-900;
    sig = signal*50000;
    sig=round(sig);


%% Pierwsza filtracja

rzad = 4;
    fc1 = 45;
    fc2 = 65;
[b1,m1] = ellip(rzad,1,100,[2*fc1/fs, 2*fc2/fs],'bandpass');
freqz(b1,m1)

filter_sig = filter(b1,m1,sig);
filter_sig=round(filter_sig);
%abc = filter(b1,m1,sig);
%figure()
%semilogy(abs(fftshift(fft(abc))))
%% Adaptowanie filtru

    x1 = 0;
    R3 = 0;
    R2 = 0;
    R1 = 0;
    y1 = 0;
    x=filter_sig;       %% nie chce mi siê zmieniaæ wszystkich x (wiadomo o co chodzi)
    a_next = 0;
    r1_reg=0;
    r2_reg=0;
    for i = 1:N 
        r3_reg=r1_reg+x(i) ;               	   %pierwszy takt
		z2_reg=mult_fix_fix(r,a,liczba_bit);
		z1_reg=a*x(i);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		
		z6_reg=z2_reg*r3_reg;					%drugi takt
        z3_reg=r^(2)*r3_reg; 
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		
        r1_reg = r2_reg+z6_reg - z1_reg ;    	%trzeci takt
        %z4_reg=r*y1;
		%z5_reg=u*r3_reg;
		%a_prev(i)=a;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %a=a_prev(i)+z5_reg*(x1-z4_reg)            %czwarty takt
        %r2_reg=x(i)-z3_reg ;                 
        %x1=x(i);
        %y1=r3_reg;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end

%% Filtracja adaptacyjna
    x = signal;
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
    plot(t,sig,'-b',t,y,'-r');
    title('Sygnal');
    legend('Przed filtracja', 'Po filtracji');
    
    
    n = (-((N/2)-1) : N/2);
    figure();
    semilogy(n * fs/N,abs(fftshift(fft(sig))),'-b',n * fs/N,abs(fftshift(fft(y))),'-r');
    title('Widmo');
    legend('Przed filtracja', 'Po filtracji');

function y=stal_przec(v,liczba_bit)
y=fi(v,1,liczba_bit,liczba_bit-2);
end

function wynik=mult_fix_fix(a,b,liczba_bit)
w=a*b;
wynik_bin=w.bin(1:length(w.bin)-(liczba_bit-2));
wynik_dec=twos2dec(wynik_bin);
wynik=fi(wynik_dec/2^(liczba_bit-2),1,liczba_bit,liczba_bit-2);
end

function wynik=mult_fix_u2(a,b,liczba_bit)
w=a*b;
wynik_bin=w.bin(1:length(w.bin)-(liczba_bit-2));
wynik=twos2dec(wynik_bin);
end


function y=u2(v,liczba_bit_wej)
y=fi(v,1,liczba_bit_wej,0);
end



