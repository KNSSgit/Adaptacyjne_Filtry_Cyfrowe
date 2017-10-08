%liczba- liczba jaka chcemy przeksztalcic
%shift- ile bitowa ta liczba ma byc  ogolnie to jest tak napisane ze
%wychodzi 2.shift-2
%wynik_bin w kodzie U2
%wynik_dec liczba po zaokragleniu
%wynik3 wynik liczbowy kt�ry jest przekonwertowanym wynikiem binarnym

function [ wynik_bin,wynik_dec,wynik3 ] = fixpoint( liczba,shift)
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
wynik3=bin2dec(bin);
end

