clc ;
clear all  ;
close all ;

%A

nmin = -5 ; % Χρόνος των σημάτων χ και y
nmax = 5 ; 
n = [nmin:nmax];
conv_n = [2*nmin:2*nmax] ; % Χρόνος συνέλιξης

x = power(n,2) - 2; % Σήματα χ και y
y = 3*n + 7;

figure(1)
subplot(2,1,1);
stem (n,x)
title('Γραφική Παράσταση (n,x[n])')
xlabel('n')
ylabel('x[n]') 

subplot(2,1,2);
stem (n,y)
title('Γραφική Παράσταση (n,y[n])')
xlabel('n')
ylabel('y[n]') 

% Υπολογισμός συνέλιξης με χρήση του ορισμού

LN = length(conv_n); % Μήκος της συνέλιξης
LenY = length(y);  % Μήκος του y

% Γεμίζω με μηδενικά το Χ για να γίνουν όλοι οι πολλαπλασιασμοί 
X0 = [zeros(1, LenY-1) x zeros(1, LenY-1)]; % Zero-padding
%Εκτεταμένο διάνυσμα χρόνου που αντιστοιχεί στο Χ0 

y_rev = y(end:-1:1); % Ανάκλαση y[-n]

for i=1:LN % Μήκος συνέλιξης   
    y_rev0 = [zeros(1,(i-1)) y_rev zeros(1,(LN-i))];
    conv_sig_def(i) = sum(X0.*y_rev0); 
end 

% Υπολογισμός συνέλιξης με χρήση της συνάρτησης conv
conv_sig_func = conv(x,y) ;

%Εκτύπωση των δύο συνελίξεων

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

NFFT = LN; % Ορίζουμε κατάλληλο NFFT ως τo μήκος της συνέλιξης
% Ώστε το σήμα του αντ.Fourier του γινομένου των φασμάτων να έχει το ιδιο μήκος με τον χρόνο συνέλιξης 

X=fft(x,NFFT); % Μετασχηματισμός Fourier του χ
Y=fft(y,NFFT); % Μετασχηματισμός Fourier του y 
Z = X.*Y ; % Πολλαπλασιασμός φασμάτων
Zsp = ifft(Z); % Αντίστροφος Fourier

figure(3); 
subplot(2,1,1);
stem(conv_n,Zsp)
title('Αντίστροφος Fourier του γίνομένου των φασμάτων του χ και y')
xlabel('n')
ylabel('z(n)') 

subplot(2,1,2);
stem(conv_n,conv_sig_def)
title('Συνέλιξη χ και y')
xlabel('n')
ylabel('conv(x,y)') 
