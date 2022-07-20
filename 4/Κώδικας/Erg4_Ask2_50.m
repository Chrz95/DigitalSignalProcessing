clc; 
clear all ; 
close all ; 

Wc = 0.5 * pi ; 
Fs = 50 ;
Ts = 1/Fs ; 
Ws = 2*pi*Fs ; 

Wn = Wc/(0.5*Ws) ; 

%(a)
N = 21 ; 
bham1 = fir1(N-1,Wn,hamming(N)) ; 
[h1,w1] = freqz(bham1);

%(b)
N = 41 ; 
bham2 = fir1(N-1,Wn,hamming(N)) ; 
[h2,w2] = freqz(bham2);
figure (1) ;
subplot(1,2,1) ;
plot (w1,abs(h1));
title('FIR filter with Hamming of order 21');
xlabel('Ángular Frequency (rad/sec)');
ylabel('|H(jù)|');
subplot(1,2,2) ;
plot (w2,abs(h2));
title('FIR filter with Hamming of order 41');
xlabel('Ángular Frequency (rad/sec)');
ylabel('|H(jù)|');

%(c)
N = 21 ; 
bhan1 = fir1(N-1,Wn,hann(N)) ; 
[h3,w3] = freqz(bhan1);

%(d)
N = 41 ; 
bhan2 = fir1(N-1,Wn,hann(N)) ; 
[h4,w4] = freqz(bhan2);
figure (2) ;
subplot(1,2,1) ;
plot (w3,abs(h3));
title('FIR filter with Hanning of order 21');
xlabel('Ángular Frequency (rad/sec)');
ylabel('|H(jù)|');
subplot(1,2,2) ;
plot (w4,abs(h4));
title('FIR filter with Hanning of order 41');
xlabel('Ángular Frequency (rad/sec)');
ylabel('|H(jù)|');

N = 500 ; 
n=0:N-1 ;

F=[-Fs/2:Fs/N:Fs/2-Fs/N]; % ÄéÜíõóìá óõ÷íüôçôáò 

xn = sin((15*n*2*pi)/Ws) + 0.25*sin((200*n*2*pi)/Ws) ;
XF = fftshift(fft(xn,N)*Ts); 

filt1 =  filter (bham1,1,xn) ; 
filt2 = filter (bham2,1,xn) ; 
filt3 = filter (bhan1,1,xn) ; 
filt4 = filter (bhan2,1,xn) ; 

Filt1F = fftshift(fft(filt1,N)*Ts); 
Filt2F = fftshift(fft(filt2,N)*Ts); 
Filt3F = fftshift(fft(filt3,N)*Ts); 
Filt4F = fftshift(fft(filt4,N)*Ts); 

figure(3)
subplot(1,2,1)
stem (F,abs(XF))
title('X(f)')
xlabel('frequency (Hz)')
ylabel('|X(f)|')
subplot(1,2,2)
stem (F,abs(Filt1F))
title('X(f) filtered with Hamming of order 21')
xlabel('frequency (Hz)')
ylabel('|X(f)|')

figure(4)
subplot(1,2,1)
stem (F,abs(XF))
title('X(f)')
xlabel('frequency (Hz)')
ylabel('|X(f)|')
subplot(1,2,2)
stem (F,abs(Filt2F))
title('X(f) filtered with Hamming of order 41')
xlabel('frequency (Hz)')
ylabel('|X(f)|')

figure(5)
subplot(1,2,1)
stem (F,abs(XF))
title('X(f)')
xlabel('frequency (Hz)')
ylabel('|X(f)|')
subplot(1,2,2)
stem (F,abs(Filt3F))
title('X(f) filtered with Hanning of order 21')
xlabel('frequency (Hz)')
ylabel('|X(f)|')

figure(6)
subplot(1,2,1)
stem (F,abs(XF))
title('X(f)')
xlabel('frequency (Hz)')
ylabel('|X(f)|')
subplot(1,2,2)
stem (F,abs(Filt4F))
title('X(f) filtered with Hanning of order 41')
xlabel('frequency (Hz)')
ylabel('|X(f)|')