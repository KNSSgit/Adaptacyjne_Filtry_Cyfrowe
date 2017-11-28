function wynik=cut(v,z_przodu,z_tylu)
po_cut=v.bin(1+z_przodu:length(v.bin)-z_tylu);
liczba_dec=twos2dec(po_cut);
wynik=fi(liczba_dec/2^(v.FractionLength-z_tylu),1,v.WordLength-(z_przodu+z_tylu),v.FractionLength-z_tylu);
end