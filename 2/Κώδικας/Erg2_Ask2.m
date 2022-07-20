clc;
clear all;
close all;

% (á)

num = [4 -3.5 0];
den = [1 -2.5 1];
[r,p,k] = residuez(num,den);

syms z; % Creates the symbolic variable z
H = r(1)/(1-p(1)*z^(-1)) +  r(2)/(1-p(2)*z^(-1)) ;
pretty(H)

% (â)

hn = iztrans(H)