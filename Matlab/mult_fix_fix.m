function wynik=mult_fix_fix(a,b,liczba_bit)
w=a*b;
wynik_bin=w.bin(1:length(w.bin)-(liczba_bit-2));
wynik_dec=twos2dec(wynik_bin);
wynik=fi(wynik_dec/2^(liczba_bit-2),1,liczba_bit,liczba_bit-2);
end