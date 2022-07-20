clc ;
clear all  ;
close all ;

%A

N = 500 ; 
Fs = 10000 ; 
Ts = 1 / Fs ; 
n=0:N-1 ; % 500 samples
Ws = 2*pi*Fs ; % Angular sampling frequency
% x = 1 + cos(1000*t) + cos(16000*t) + cos(30000*t) ;

figure(1);
% xn = xa(nTs)
xn =  1 + cos(((1000*2*pi)/Ws)*n) + cos(((16000*2*pi)/Ws)*n) + cos(((30000*2*pi)/Ws)*n)  ;
% frequencies : 159.1 , 2546 , 4774
stem (n,xn) ;
title('x[n] with Ts = 1/10000')
xlabel('time (sec)')
ylabel('x[n]')

figure(2) ; 
XF_unfiltered =fftshift(fft(xn,N)*Ts); % Μετασχηματισμός Fourier
F=[-Fs/2:Fs/N:Fs/2-Fs/N]; % Διάνυσμα συχνότητας 
stem (F,abs(XF_unfiltered)) ;
title('Amplitude Spectrum of x')
xlabel('frequency (Hz)')
ylabel('|X(f)|')

Rs = 30 ;
[num30,den30] = Butterworth_filter(10000,3000*2*pi,4000*2*pi,3,Rs,2048)  ; 
Rs = 50 ; 
[num50,den50] = Butterworth_filter(10000,3000*2*pi,4000*2*pi,3,Rs,2048)  ; 

figure(3);
xn_filtered = filter (num30,den30,xn) ;
XF_filtered = fftshift(fft(xn_filtered,N)*Ts); % Μετασχηματισμός Fourier του χ
stem (F,abs(XF_filtered))
title('X(f) filtered with Butterworth (att = 30db)')
xlabel('frequency (Hz)')
ylabel('|X(f)|')

figure(4);
xn_filtered = filter (num50,den50,xn) ;
XF_filtered =fftshift(fft(xn_filtered,N)*Ts); % Μετασχηματισμός Fourier του χ
stem (F,abs(XF_filtered))
title('X(f) filtered with Butterworth (att = 50db)')
xlabel('frequency (Hz)')
ylabel('|X(f)|')

%B

Ts = 0.2 ; % Sampling period
Fs = 1/Ts ;
n=0:N-1 ; % 500 samples
Ws = 2*pi*Fs ; % Angular sampling frequency

figure(5);
% xn = xa(nTs)
xn =  1 + cos(((1.5*2*pi)/Ws)*n) + cos(((5*2*pi)/Ws)*n)  ;
% frequencies : 159.1 , 2546 , 4774
stem (n,xn) ;
title('x[n] with Ts = 0.2s')
xlabel('time (sec)')
ylabel('x[n]')

figure(6) ; 
XF_unfiltered =fftshift(fft(xn,N)*Ts); % Μετασχηματισμός Fourier του χ
F=[-Fs/2:Fs/N:Fs/2-Fs/N]; % Διάνυσμα συχνότητας 
stem (F,abs(XF_unfiltered)) ;
title('Amplitude Spectrum of x')
xlabel('frequency (Hz)')
ylabel('|X(f)|')

[num,den] = Chebyshev_filter(2,3,0.2,2,256) ; 
figure(7);
xn_filtered = filter (num,den,xn) ;
XF_filtered = fftshift(fft(xn_filtered,N)*Ts); % Μετασχηματισμός Fourier του χ
stem (F,abs(XF_filtered))
title('X(f) filtered with Chebyshev (order = 2)')
xlabel('frequency (Hz)')

[num,den] = Chebyshev_filter(16,3,0.2,2,256) ; 
figure(8);
xn_filtered = filter (num,den,xn) ;
XF_filtered = fftshift(fft(xn_filtered,N)*Ts); % Μετασχηματισμός Fourier του χ
stem (F,abs(XF_filtered))
title('X(f) filtered with Chebyshev (order = 16)')
xlabel('frequency (Hz)')
ylabel('|X(f)|')







