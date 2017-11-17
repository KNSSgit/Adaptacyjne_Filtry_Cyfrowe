clear all;
close all;

format long;

Fs = 2000;  % Sampling Frequency

N      = 2;    % Order
Fpass1 = 45;   % First Passband Frequency
Fpass2 = 65;   % Second Passband Frequency
Apass  = 1;    % Passband Ripple (dB)
Astop  = 200;  % Stopband Attenuation (dB)

% Construct an FDESIGN object and call its ELLIP method.
h  = fdesign.bandpass('N,Fp1,Fp2,Ast1,Ap,Ast2', N, Fpass1, Fpass2, ...
                      Astop, Apass, Astop, Fs);
Hd = design(h, 'ellip');

Hd.sosMatrix
Hd.ScaleValues

% [EOF]
