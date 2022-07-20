clc;
clear all;
close all;

DT = 0.001;
tmin = 0 + DT ;
tmax = 0.5 - DT ;

t = [tmin : DT :tmax] ; 
x = 5*cos(24*pi*t) - 2*sin(1.5*pi*t) ;
figure(1)
plot (t,x)
title('(t,x(t))')
xlabel('time (sec)')
ylabel('x(t)')

figure(2);

subplot(2,2,1)

Ts = 1/48;
ts = [tmin : Ts :tmax] ;
x1 = 5*cos(24*pi*ts) - 2*sin(1.5*pi*ts) ;
hold on
plot(t,x)
title('x[n] sampling with Ts = 1/48')
xlabel('time (sec)')
ylabel('x[n]')
stem (ts,x1,'r')
hold off

Ts = 1/24;
ts = [tmin : Ts :tmax] ; 
x2 = 5*cos(24*pi*ts) - 2*sin(1.5*pi*ts) ;

subplot(2,2,2)

plot(t,x)
title('x[n] sampling with Ts = 1/24')
xlabel('time (sec)')
ylabel('x[n]')
hold on
stem (ts,x2,'r')
hold off

Ts = 1/12;
ts = [tmin : Ts :tmax] ; 
x3 = 5*cos(24*pi*ts) - 2*sin(1.5*pi*ts) ;

subplot(2,2,3)

hold on
plot(t,x)
title('x[n] sampling with Ts = 1/12')
xlabel('time (sec)')
ylabel('x[n]')
stem (ts,x3,'r')
hold off