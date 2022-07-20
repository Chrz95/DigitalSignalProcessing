function [num,den] = Chebyshev_filter (n,R,Ts,wc,N) 

Fs = 1/Ts ; 
FN = Fs/2 ; 

Wp = wc / (2*pi*FN) ;

[num,den] = cheby1(n,R,Wp,'high'); 