clc
close all
clear
N = 4;
I = reshape(1:N^2,N,N)
E = Encrypter(I,LogisticRandomSequence(N^2,4,0.2),"Fredkin",3)