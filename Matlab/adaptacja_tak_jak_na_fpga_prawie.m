clear all
close all


fs = 360;               %czestotliwosc probkowania
time = 30;              %czas dzialania                                    !!!!!!!!!!czas dzialania
n=40;  
k=40;
%% Wczytanie EKG
    fid = fopen('100.dat','r');
    f = fread(fid,2*360*time,'ubit12');
    Orig_Sig = f(1:2:length(f));

%% Generacja zaklocenia:
   dt = 1/fs;                       % okres probkowania
   t = (0:dt:time-dt)';             % w sekundach
        
   freq = 48;                          % czestotliwosc zaklocenia          !!!!!!!!!!czestotliwosc zaklocenia
   noise = 50.*cos(2*pi*freq*t);        % zaklocenie

%% Ustawienia filtracji
    fin = 55;                        %czestotliwosc startowa                !!!!!!!!!!czestotliwosc startowa
    w = 2*pi*fin/fs;
    N = length(noise);
    a = stal_przec(2*cos(w),n); 
    a_test = a;
    u = stal_przec(0.000000001,n)                 %wielkosc kroku  (ma³a ma byæ)!!!    jest przemno¿ona przez 2                  !!!!!!!!!!wielkosc kroku
    r = stal_przec(0.98,n);                         %szerokosc notcha                   !!!!!!!!!!szerokosc notcha

%% Znieksztalcony EKG
    signal = Orig_Sig + noise-900;
    sig = signal*30000;
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
   x=filter_sig;       %% nie chce mi siê zmieniaæ wszystkich x (wiadomo o co chodzi)


    x1 = stal_przec2(0,k+n,n-2);
    y1 = LB(0,k,0);
    
    R2=stal_przec(r^2,n);      % r^2
    R3=stal_przec(r/500000,n);        % docelowo r/10000 jeszcze siê zastanawiam
   
    r1_reg=stal_przec2(0,k+n,n-2); % 26+18 bitowe zero
    r2_reg=stal_przec2(0,k+n,n-2); % 26+18 bitowe zero
    
    for i = 1:N 
        r3_reg=r1_reg+stal_przec2(x(i),k+n,n-2); %pierwszy takt
             r3_reg=LB(r3_reg,k,0) ;    % ucinamy R3_reg do 24 bitów ca³kowitych
		z2_reg=r*a;
            z2_reg=LB(z2_reg,2,n-2);       %ustawiamy odpowiedni¹ iloœæ bitów
		z1_reg=a*u2(x(i),k);
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		
		z6_reg=z2_reg*r3_reg;					%drugi takt
           
        z3_reg=R2*r3_reg ;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		
        r1_reg = r2_reg+z6_reg - z1_reg ;   	%trzeci takt
        z4_reg=R3*y1;
		z5_reg=u*r3_reg;
		a_prev(i)=a;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        a=a_prev(i)+z5_reg*(x1-z4_reg) ;           %czwarty takt
            a=LB(a,2,n-2);
        r2_reg=stal_przec2(x(i),k+n,n-2)-z3_reg;               
        x1=x(i)/500000;
            x1=LB(x1,k+2,n-2) ;
        y1=r3_reg;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       % y(i)=r3_reg; % tylko do sprawdzania
        aa(i)=a;
    end

 a=double(a);
 r=double(r);
 a_test=double(a_test)  ;

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



