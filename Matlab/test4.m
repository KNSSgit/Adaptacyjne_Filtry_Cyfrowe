   clear all
   close all
%% Specyfikacja czasowa:
   fs = 2000;                  % czestotliwosc probkowania
   dt = 1/fs;                   % okres probkowania
   StopTime = 15;             % czas trwania sygnalu
   t = (0:dt:StopTime-dt)';     % wekor czasu w sekundach
   p=2;
%% Czysty sinus:
   fc = 50;                     % czestotliwosc sinusa
   sinus = 6*10e5.*cos(2*pi*fc*t);
   sinus2=5*10e5.*sin(2*pi*fc+30*t);
Size_1=24;  
Size_2=31;
N=length(sinus);
%% Ustawienia filtracji
    fin = 40;                        %czestotliwosc startowa                !!!!!!!!!!czestotliwosc startowa
    w = 2*pi*fin/fs;
 
    a = 2*cos(w);
    a_test = a;
    u = 10e-10  ;            %wielkosc kroku  (ma³a ma byæ)!!!    jest przemno¿ona przez 2                  !!!!!!!!!!wielkosc kroku
    r = 0.995 ;                       %szerokosc notcha                   !!!!!!!!!!szerokosc notcha
    R4=10e-10;
%% Znieksztalcony EKG1

    sig = sinus+sinus2;
    sig=round(sig);



%% Adaptowanie filtru
    x1 = 0;
    y1 = 0;
    r3_reg = 0;
    r2_reg = 0;
    r1_reg = 0;
    r_3=r*R4;
    
    x=sig;       %% nie chce mi siê zmieniaæ wszystkich x (wiadomo o co chodzi)
    a_next = 0;
    for i = 1:N 
        if (i>7000)
            r=0.998;
        end
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
        x1=x(i)*R4;
        y1=r3_reg;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
        aa(i)=a;
        wy(i)=r3_reg;
        
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
    plot(t,aa);
    figure
    plot(t,wy)
    figure
    plot(fftshift(abs(fft(sig))))
    figure
    plot(fftshift(abs(fft(wy))))



