clear all
close all

liczba_bit=30;
A=1.524;
B=10;
D=0.00001;

A_k=fixpoint(A,liczba_bit)
B_k=dec2twos(B,liczba_bit)
D_k=fixpoint(D,liczba_bit)

D_k/2^(liczba_bit-2)