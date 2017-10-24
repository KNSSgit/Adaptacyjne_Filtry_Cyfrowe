function wynik = fixpoint( liczba,shift)
% Konwersja liczby dziesientnej na binarna stalo przecinkowa
% Uzycie- wynik=fixpoint(liczba,shift)
%
% Funkcja konwertuje liczbe dziesietna na binarna o okteslonym przesunieciu
% (stalo przecinkowa)
%
% liczba- liczba jaka chcemy przeksztalcic
% shift- ile bitowa ta liczba ma byc  ogolnie to jest tak napisane ze wychodzi 2.shift-2
% wynik wynik dziesietny który jest przekonwertowanym wynikiem binarnym
fixp=liczba*2^(shift-2);
rfixp1=round(fixp);
rfixp=abs(rfixp1);
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
wynik_dec=rfixp1/2^(shift-2);
wynik=bin2dec(bin);
end

