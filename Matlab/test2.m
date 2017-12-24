   clear all
   close all
%% Specyfikacja czasowa:
   fs = 2000;                  % czestotliwosc probkowania 
   dt = 1/fs;                   % okres probkowania
   StopTime = 20;             % czas trwania sygnalu
   t = (0:dt:StopTime-dt)';     % wekor czasu w sekundach
   p=2;
%% Czysty sinus:
   fc = 50;                     % czestotliwosc sinusa
   sinus = 7000000.*cos(2*pi*fc*t);
   sinus2=0.*sin(2*pi*fc+30*t);
Size_1=24;  
Size_2=35;
%% Ustawienia filtracji
    fin = 40;                        %czestotliwosc startowa                !!!!!!!!!!czestotliwosc startowa
    w = 2*pi*fin/fs;
 
    a = stal_przec(2*cos(w),Size_2,Size_2-p); 
    a_test = a;
    u = stal_przec(10e-10,Size_2,Size_2-p)                 %wielkosc kroku  (ma³a ma byæ)!!!    jest przemno¿ona przez 2                  !!!!!!!!!!wielkosc kroku
    r = stal_przec(0.998,Size_1,Size_1-p);                         %szerokosc notcha                   !!!!!!!!!!szerokosc notcha
    R4=stal_przec(10e-10,Size_2,Size_2-p); 
%% Znieksztalcony EKG1

    sig = sinus+sinus2;
    sig=round(sig);



%% Adaptowanie filtru
   x=sig;       %% nie chce mi siê zmieniaæ wszystkich x (wiadomo o co chodzi)


    x1 = stal_przec(0,Size_2,Size_2-p);                      % 24.0
    y1 = stal_przec(0,Size_2,Size_2-p);                      % 24.0
    
    R2=stal_przec(r^2,Size_2,Size_2-p);              % 2.29  r^2
    R3=stal_przec(r*R4,Size_2,Size_2-p);         % 2.29
   
    r1_reg=stal_przec(0,Size_1,0) ;                   % 24.0
    r2_reg=stal_przec2(0,Size_1+Size_2,Size_2-p);     % 26.29 mo¿e 27.29
    
    for i = 1:length(sig) 
        x_test=x(i);                                  % zmienna tylko do testów
        %pierwszy takt
        r3_reg=r1_reg+stal_przec(x(i),Size_1,0);      % 25.0 ale to ucinamy 
             r3_reg=cut(r3_reg,Size_1,0);           % ucinamy R3_reg do 24 bitów ca³kowitych
             r3_test=r3_reg;
		z2_reg=r*a;                                   % 26.29
            z2_reg=cut(z2_reg,Size_2,Size_2-p);% 2.29
            z2_test=z2_reg*2^33;
		z1_reg=a*stal_przec(x(i),Size_1,0);
            z1_test=z1_reg*2^33;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		%drugi takt
		z6_reg=z2_reg*r3_reg;                        % 26.29				
           z6_test=z6_reg*2^33;
        z3_reg=R2*r3_reg;                              % 26.29
            z3_test=z3_reg*2^33;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		%trzeci takt
        r1_reg = r2_reg+z6_reg - z1_reg;               % 28.29
            r1_reg=cut(r1_reg,Size_1,0);        % 24.0
            r1_test=r1_reg;
        %z4_reg=R3*y1
		z5_reg=u*r3_reg;                               % 26.29
            z5_reg=cut(z5_reg,Size_2,Size_2-p); % 2.29
            z5_test=z5_reg*2^33;
        z7_reg=x1-y1;  % 2.29
            z7_reg=cut(z7_reg,Size_2,Size_2-p);
            z7_test=z7_reg*2^33;
		a_prev(i)=a;
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %czwarty takt
        r2_reg=stal_przec(x(i),Size_2+Size_1,Size_2-p)-z3_reg; 
            r2_test=r2_reg*2^33;
        z8_reg=z5_reg*z7_reg;
            z8_reg=cut(z8_reg,Size_2,Size_2-p);
            z8_test=z8_reg*2^33;
           
        x1=x(i)*R4;
            x1=stal_przec(x1,Size_2,Size_2-p); 
            x1_test=x1*2^33;
        y1=r3_reg*R3;
            y1=stal_przec(y1,Size_2,Size_2-p) ;
            y1_test=y1*2^33;

		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % pi¹ty takt
        a=a_prev(i)+z8_reg; 
            a=stal_przec(a,Size_2,Size_2-p);
            a_ttest=a*2^33;
       % y(i)=r3_reg; % tylko do sprawdzania
        aa(i)=a;
        wy(i)=r3_reg;
      %{  
        r1_test
        r2_test
        r3_test
        z1_test
        z3_test
        z7_test
        a_ttest
        z8_test
        z5_test
        %}
        
    end

 a=double(a);
 r=double(r);
 a_test=double(a_test)  ;


    

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




