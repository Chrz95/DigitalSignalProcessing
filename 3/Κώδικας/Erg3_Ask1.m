clear all ; 
close all ; 
clc;

fs = 10000;
Wp = 3000*2*pi;
Ws = 4000*2*pi;
Rp = 3;
Rs = 30;

[n,Wn] = buttord(Wp,Ws,Rp,Rs,'s') ; % It gives us the order of the butterworth filter  = n
n
% Wn : angular cutoff-frequency

N = 2048;
f = 0:((fs/2)/N):fs/2 - (fs/2)/N;
w = 2*pi*f ; 

[z,p,k] = buttap(n) ;
[b,a] = zp2tf(z,p,k);
[bt,at] = lp2lp(b,a,Wn);
h = freqs(bt,at,w);

figure(1);

plot(f,20*log10(abs(h)));

[numd,dend] = bilinear(bt,at,fs);
h1 = freqz(numd,dend,f,fs);
hold on;

plot(f,20*log10(abs(h1)),'r');

xlabel ('frequencies (Hz)') ;
ylabel ('20*log(|H(e^jù)|)') ;
title ('Butterworth filter - (Attenuation 30db)') ; 
legend ('Analog','Digital');
grid on ; 
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs = 10000;
Wp = 3000*2*pi;
Ws = 4000*2*pi;
Rp = 3;
Rs = 50;

[n,Wn] = buttord(Wp,Ws,Rp,Rs,'s') ; % It gives us the order of the butterworth filter  = n
n
% Wn : angular cutoff-frequency

N = 2048;
f = 0:((fs/2)/N):fs/2 - (fs/2)/N;
w = 2*pi*f ; 

[z,p,k] = buttap(n) ;
[b,a] = zp2tf(z,p,k);
[bt,at] = lp2lp(b,a,Wn);
[h,w] = freqs(bt,at,w);
figure(2);

plot(f,20*log10(abs(h)));

[numd,dend] = bilinear(bt,at,fs) ; 
[h1,w] = freqz(numd,dend,f,fs);
hold on;

plot(f,20*log10(abs(h1)),'r');
xlabel ('frequencies (Hz)') ;
ylabel ('20*log(|H(e^jù)|)') ;
title ('Butterworth filter - (Attenuation 50db)') ; 
legend ('Analog','Digital');
grid on ; 
hold off;




