clc ; 
clear all ;
close all ; 

%A

Wc = 0.4 * pi ; 
Fs = 100 ;
Ws = 2*pi*Fs ; 

Wn = Wc / (0.5*Ws) ; 
N = 21 ; 

bham = fir1(N-1,Wn,hamming(N)) ; 
brec = fir1(N-1,Wn,rectwin(N)) ; 

[h1,w1] = freqz(bham);
[h2,w2] = freqz(brec) ;

figure (1);
plot(w1,abs(h1)) ;
hold on
plot (w2,abs(h2)) ; 
title('FIR signal filtered with windows');
xlabel('Ángular Frequency (rad/sec)');
ylabel('|H(jù)|');
legend ('Hamming','Rectangular')
hold off ; 
