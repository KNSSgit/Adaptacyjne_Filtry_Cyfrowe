[A,B,C,D] = cheby2(1,10,[500 560]/750);
sos = ss2sos(A,B,C,D);
sos
[b,a] = sos2tf(sos)

freqz(b,a);