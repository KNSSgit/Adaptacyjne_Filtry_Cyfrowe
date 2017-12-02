clear all
close all


fs = 360;               %czestotliwosc probkowania
time = 30;              %czas dzialania                                    !!!!!!!!!!czas dzialania
    
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
    fin = 55;                        %czestotliwosc startowa                !!!!!!!!!!czestotliwosc startowa
    w = 2*pi*fin/fs;
    N = length(noise);
    a = 2*cos(w); 
    a_test = a;
    u = 0.0000001;                            %wielkosc kroku                      !!!!!!!!!!wielkosc kroku
    r = 0.98;                          %szerokosc notcha                   !!!!!!!!!!szerokosc notcha

%% Znieksztalcony EKG
    signal = Orig_Sig + noise-800;
    sig = signal*5000;
    sig=round(sig);


%% Pierwsza filtracja

rzad = 4;
    fc1 = 45;
    fc2 = 65;
[b1,m1] = ellip(rzad,1,100,[2*fc1/fs, 2*fc2/fs],'bandpass');
freqz(b1,m1)

filter_sig = filter(b1,m1,sig);
%abc = filter(b1,m1,sig);
%figure()
%semilogy(abs(fftshift(fft(abc))))
filter_sig=round(filter_sig);
%% Adaptowanie filtru
    x1 = 0;
    y1 = 0;
    r3_reg = 0;
    r2_reg = 0;
    r1_reg = 0;
    r_3=r/10000;
    
    x=filter_sig;       %% nie chce mi siê zmieniaæ wszystkich x (wiadomo o co chodzi)
    a_next = 0;
    for i = 1:N 
        r3_reg=r1_reg+x(i);                	   %pierwszy takt
		z2_reg=r*a;
		z1_reg=a*x(i);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		
		z6_reg=z2_reg*r3_reg;					%drugi takt
        z3_reg=r^(2)*r3_reg;    
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		
        r1_reg = r2_reg+z6_reg - z1_reg  ;   	%trzeci takt
        z4_reg=r_3*y1;
		z5_reg=u*r3_reg;
		a_prev(i)=a;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        a=a_prev(i)+z5_reg*(x1-z4_reg);            %czwarty takt    % z5_reg jest strasznie ma³e coœ bêdzie trzeba z tym zrobiæ 
        r2_reg=x(i)-z3_reg;                                         % zapewne bêdzie trzeba dzieliæ x1 i z4_reg ¿eby by³y mniejsze
        x1=x(i)/10000;
        y1=r3_reg;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end

%% Filtracja adaptacyjna
    x = sig;
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
