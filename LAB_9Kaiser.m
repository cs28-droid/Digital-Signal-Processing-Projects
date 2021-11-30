%DSP LAB ASSESSMENT - 9
%Chirag Satapathy - 19BEI0107

%Date - 9th November, 2021
%KAISER WINDOW

%Pass band ripple = 0.02
%Stop band ripple = 0.01
%Pass band frequency = 1000
%Stop band frequency = 1500
%Sampling frequency = 5000

clc
clear global
close all
rp = input('Enter the passband ripple: ');
rs = input('Enter the stopband ripple: ');
fpb = input('Enter the passband frequency: ');
fsb = input('Enter the stopband frequency: ');
fs = input('Enter the sampling frequency: ');
Wp = 2*fpb/fs;
Ws = 2*fsb/fs;
num = (-20*log10(sqrt(rp*rs)))-13;
den = 14.6*(fsb-fpb)/fs;
n = ceil(num/den);
n1 = n+1;
if(rem(n,2)~=0)
    n1 = n;
    n = n-1;
end
y = kaiser(n1);
%LOW PASS FILTER
b = fir1(n,Wp,y);
[h, w] = freqz(b,1,256);
m = 20*log10(abs(h));
subplot(2,2,1);
plot(w/pi,m,'b');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response of a Low Pass FIR Filter');
%HIGH PASS FILTER
b = fir1(n,Wp,'high',y);
[h, w] = freqz(b,1,256);
g = 20*log(abs(h));
subplot(2,2,2);
plot(w/pi,g,'r');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response of a High Pass FIR Filter');
%BAND PASS FILTER
Wn = [Wp Ws];
b = fir1(n,Wn,"bandpass",y);
[h, w] = freqz(b,1,256);
L = 20*log10(abs(h));
subplot(2,2,3);
plot(w/pi,L,'m');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response of a Band Pass FIR Filter');
%BAND STOP FILTER
Wn = [Wp Ws];
b = fir1(n,Wn,'stop',y);
[h, w] = freqz(b,1,256);
o = 20*log10(abs(h));
subplot(2,2,4);
plot(w/pi,o,'k');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response of a Band Stop FIR Filter');
