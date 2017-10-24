%funkcja ma za zadanie zamiane liczby dziesiêtnej na liczbê w notacji U2
%liczba - liczba jaka chcemy zamienic
%shift liczba bitów tej liczby
%wynik_bin wynik w kodzie U2
%wynik_dec wynik przekonwertowany na liczbê dziesiêtn¹ (ale to nie jest
%konwersja ze znakiem)
function [ wynik_bin,wynik_dec ] = U2( liczba,shift)


rfixp=abs(liczba);
bin=dec2bin(rfixp,shift);
enable=1;
if (liczba<0)
      for i=shift-1:-1:1
          if (bin(i)=='1')
              for j=1:i-1
                  if (bin(j)=='1')
                      bin(j)='0';
                  else
                      bin(j)='1';
                  end
                  enable=0;
              end
              if enable==0
                  break
              end
          end
      end
end
wynik_bin=bin;
wynik_dec=bin2dec(bin);
end