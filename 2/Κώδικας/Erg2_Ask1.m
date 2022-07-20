clear all;
close all;
clc ; 

% â)

TS=1;
num = [0 0.2 0];
den = [1 -0.7 -0.18];
h = tf(num,den,TS)
% h = 0.2*z/(z*z-0.7*z-0.18);
figure(1)
zplane(num,den)

% ä)

faxis = [-pi:pi/128:pi];
figure(2)
freqz(num,den,faxis);

figure(3)
freqz(num,den);

% å)

num = [0 0 0.2 0];
den = [1 -1.7 0.52 0.18];
figure(4)
freqz(num,den,faxis);
% zplane(num,den)