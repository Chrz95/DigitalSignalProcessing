clc;
clear all;
close all;

%A

tmin = 0 ;
tmax = 1 ;

N = 128 ; 
Fs = N;
Ts = 1/Fs ; 

n = [tmin:Ts:tmax - Ts] ;
xn = 10*cos(2*pi*20*n) - 4*sin(2*pi*40*n + 5) ;
figure (1);
stem(n,xn);
title('(n,x[n])')
xlabel('n')
ylabel('x[n]')

F=[-Fs/2:Fs/N:Fs/2-Fs/N]; 

figure(2)
X=abs(fftshift(fft(xn))) ;
stem (F,X)
title('Amplitude Spectrum of x')
xlabel('frequency (Hz)')
ylabel('|X(f)|')

%B

phi = 5 ;
N = 100 ; 
n=0:N-1 ; 
Fs = 8000 ;
Ts = 1/Fs;    % Περίοδος δειγματοληψίας

i=1;
for f0=100:125:475
    xn = sin(2*pi*(f0/Fs)*n + phi) ;
    figure(3)
    subplot(2,2,i)
    i = i+1 ;
    NFFT = 2^nextpow2(length(xn)); % Ορίζουμε κατάλληλο NFFT ως τη μεγαλύτερη δύναμη του 2
    F=[-Fs/2:Fs/NFFT:Fs/2-Fs/NFFT]; % Διάνυσμα συχνότητας 
    X=fftshift(fft(xn,NFFT)*Ts); % Μετασχηματισμός Fourier του χ
    stem(F,abs(X));
    title(['f0 = ',num2str(f0) , ' Hz' ]) ; 
    xlabel('frequency (Hz)')
    ylabel('|Xn(f)|')
end 

i=1;
for f0=7525:125:7900
    xn = sin(2*pi*(f0/Fs)*n + phi) ;
    figure(4)
    subplot(2,2,i)
    i = i+1 ;
    NFFT = 2^nextpow2(length(xn)); % Ορίζουμε κατάλληλο NFFT ως τη μεγαλύτερη δύναμη του 2
    F=[-Fs/2:Fs/NFFT:Fs/2-Fs/NFFT]; % Διάνυσμα συχνότητας 
    X=fftshift(fft(xn,NFFT)*Ts); % Μετασχηματισμός Fourier του χ
    stem(F,abs(X));
    title(['f0 = ',num2str(f0) , ' Hz'] ) ; 
    xlabel('frequency (Hz)')
    ylabel('|Xn(f)|')
end 



