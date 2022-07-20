clc ;
clear all  ;
close all ;

%A

n = 2 ; 
R = 3 ; 
Ts = 0.2 ; % Sampling period
Fs = 1/Ts ; 
FN = Fs/2 ; 
wc = 2 ;  %Cut-off frequency

N = 256;

W=0:1/(N-1):1; % frequency axis

Wp = wc /(2*pi*FN) 

[b,a] = cheby1(n,R,Wp,'high') ; 
h1 = freqz(b,a,N) ; % Returns frequency response with N samples

%B

n = 16 ; 

[b,a] = cheby1(n,R,Wp,'high'); 
h2 = freqz(b,a,N) ;

plot(W,20*log10(abs(h1)),'r');
% plot(W,(abs(h1)),'r');
hold on ; 
plot(W,20*log10(abs(h2)),'g');
% plot(W,(abs(h2)),'g');

xlabel ('Normalized Angular Frequencies (rad/sample)') ;
ylabel ('20*log(|H(e^jù)|)') ;
title ('Chebyshev Filter') ; 
legend ('Order = 2','Order = 16');
hold off ; 
