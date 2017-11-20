clear all
close all
N=1;

%% Ustawienia filtracji
    fi = 55;    
    fs=2000;%czestotliwosc startowa                !!!!!!!!!!czestotliwosc startowa
    w = 2*pi*fi/fs;
    a = 2*cos(w);
        u = 0.5;                            %wielkosc kroku                      !!!!!!!!!!wielkosc kroku
    r = 0.98; 
    %% Generacja zaklocenia:
   dt = 1/fs;                       % okres probkowania
   t = (0:dt:N-dt)';             % w sekundach
        
   freq = 10;                          % czestotliwosc zaklocenia          !!!!!!!!!!czestotliwosc zaklocenia
   y = 20.*cos(2*pi*freq*t);        % zaklocenie
   y=rand(length(t));
%% wspó³czynniki filtru
rzad = 1;
fc1 = 45;
fc2 = 65;

[b1,m1] = ellip(rzad,1,30,[2*fc1/fs, 2*fc2/fs],'bandpass');
figure()
freqz(b1,m1)

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
    for i = 1:length(t) 
             n=i;
             out_fy(n)=b1(1)*y(n)+d(1);
             d(1)=b1(2)*y(n)-m1(2)*out_fy(n)+d(2);
             d(2)=b1(3)*y(n)-m1(3)*out_fy(n);

        

    end
    
    figure()
    semilogy(abs(fftshift(fft(out_fy))))
    figure()
    plot(t,y,t,out_fy)