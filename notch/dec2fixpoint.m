%//////////////////////////////////////////////////////////////////////////////////
%// Ko³o Naukowe Systemów Scalonych
%// 10.2017
%// 
%// Project: Adaptacyjne filtry cyfrowe do kondycjonowania sygna³ów biomedycznych 
%//////////////////////////////////////////////////////////////////////////////////

clear all;
close all;

format long

number = -1.9075016;    %liczba któr¹ chcemy przekszta³ciæ
bits = 32;              %liczba bitów

if number < 0
    integer = -ceil(abs(number));
    fraction = abs(integer) + number;
    
else
    integer = floor(number);
    fraction = number - integer; 
end

convert_fraction = fraction * 2^(bits - 2);
rounded_convert_fraction = round(convert_fraction);

binary_fraction = dec2bin(rounded_convert_fraction, bits - 2);

switch integer
    case -2
        binary_integer = '10';
    case -1
        binary_integer = '11';
    case 1
        binary_integer = '01';
    otherwise
        binary_integer = '00';
end

binary_result = [binary_integer binary_fraction]
