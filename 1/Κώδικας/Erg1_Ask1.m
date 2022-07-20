clc ;
clear all  ;
close all ;

%A

nmin = -5 ; % ������ ��� ������� � ��� y
nmax = 5 ; 
n = [nmin:nmax];
conv_n = [2*nmin:2*nmax] ; % ������ ���������

x = power(n,2) - 2; % ������ � ��� y
y = 3*n + 7;

figure(1)
subplot(2,1,1);
stem (n,x)
title('������� ��������� (n,x[n])')
xlabel('n')
ylabel('x[n]') 

subplot(2,1,2);
stem (n,y)
title('������� ��������� (n,y[n])')
xlabel('n')
ylabel('y[n]') 

% ����������� ��������� �� ����� ��� �������

LN = length(conv_n); % ����� ��� ���������
LenY = length(y);  % ����� ��� y

% ������ �� �������� �� � ��� �� ������ ���� �� ��������������� 
X0 = [zeros(1, LenY-1) x zeros(1, LenY-1)]; % Zero-padding
%���������� �������� ������ ��� ����������� ��� �0 

y_rev = y(end:-1:1); % �������� y[-n]

for i=1:LN % ����� ���������   
    y_rev0 = [zeros(1,(i-1)) y_rev zeros(1,(LN-i))];
    conv_sig_def(i) = sum(X0.*y_rev0); 
end 

% ����������� ��������� �� ����� ��� ���������� conv
conv_sig_func = conv(x,y) ;

%�������� ��� ��� ����������

figure(2) 
subplot(2,1,1);
stem (conv_n,conv_sig_def)
title('conv(x,y) with definition')
xlabel('n')
ylabel('x(n)*y(n)') 

subplot(2,1,2);
stem (conv_n,conv_sig_func)
title('conv(x,y) with conv() function')
xlabel('n')
ylabel('x(n)*y(n)')

%B

NFFT = LN; % �������� ��������� NFFT �� �o ����� ��� ���������
% ���� �� ���� ��� ���.Fourier ��� ��������� ��� �������� �� ���� �� ���� ����� �� ��� ����� ��������� 

X=fft(x,NFFT); % ��������������� Fourier ��� �
Y=fft(y,NFFT); % ��������������� Fourier ��� y 
Z = X.*Y ; % ��������������� ��������
Zsp = ifft(Z); % ����������� Fourier

figure(3); 
subplot(2,1,1);
stem(conv_n,Zsp)
title('����������� Fourier ��� ��������� ��� �������� ��� � ��� y')
xlabel('n')
ylabel('z(n)') 

subplot(2,1,2);
stem(conv_n,conv_sig_def)
title('�������� � ��� y')
xlabel('n')
ylabel('conv(x,y)') 
