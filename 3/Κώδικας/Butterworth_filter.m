function [numd,dend] = Butterworth_filter (fs,Wp,Ws,Rp,Rs,N) 

[n,Wn] = buttord(Wp,Ws,Rp,Rs,'s') ; % It gives us the order of the butterworth filter  = n
% Wn : angular cutoff-frequency

N = 2048;
f = 0:((fs/2)/N):fs/2 - (fs/2)/N;
w = 2*pi*f ; 

[z,p,k] = buttap(n) ;
[b,a] = zp2tf(z,p,k);
[bt,at] = lp2lp(b,a,Wn);

[numd,dend] = bilinear(bt,at,fs) ;






