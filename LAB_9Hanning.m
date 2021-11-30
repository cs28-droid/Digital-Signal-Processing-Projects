%DSP LAB ASSESSMENT - 9
%Chirag Satapathy - 19BEI0107

%Date - 9th November, 2021
%HANNING, KAISER AND BARTLETT WINDOW

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
y = hanning(n1);
y1 = kaiser(n1);
y2 = bartlett(n1);
%LOW PASS FILTER HANNING
b = fir1(n,Wp,y);
[h, w] = freqz(b,1,256);
m = 20*log10(abs(h));
figure(1);
subplot(2,2,1);
plot(w/pi,m,'b');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Low Pass FIR Filter Hanning');
%LOW PASS FILTER KAISER
b = fir1(n,Wp,y1);
[h, w] = freqz(b,1,256);
m = 20*log10(abs(h));
figure(2);
subplot(2,2,1);
plot(w/pi,m,'b');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response Low Pass FIR Filter Kaiser');
%LOW PASS FILTER BARTLETT
b = fir1(n,Wp,y2);
[h, w] = freqz(b,1,256);
m = 20*log10(abs(h));
figure(3);
subplot(2,2,1);
plot(w/pi,m,'b');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response Low Pass FIR Filter Bartlett');

%HIGH PASS FILTER HANNING
b = fir1(n,Wp,'high',y);
[h, w] = freqz(b,1,256);
g = 20*log(abs(h));
figure(1);
subplot(2,2,2);
plot(w/pi,g,'r');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('High Pass FIR Filter Hanning');
%HIGH PASS FILTER KAISER
b = fir1(n,Wp,'high',y1);
[h, w] = freqz(b,1,256);
g = 20*log(abs(h));
figure(2);
subplot(2,2,2);
plot(w/pi,g,'r');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response High Pass FIR Filter Kaiser');
%HIGH PASS FILTER BARTLETT
b = fir1(n,Wp,'high',y2);
[h, w] = freqz(b,1,256);
g = 20*log(abs(h));
figure(3);
subplot(2,2,2);
plot(w/pi,g,'r');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response High Pass FIR Filter Bartlett');

%BAND PASS FILTER HANNING
Wn = [Wp Ws];
b = fir1(n,Wn,"bandpass",y);
[h, w] = freqz(b,1,256);
L = 20*log10(abs(h));
figure(1);
subplot(2,2,3);
plot(w/pi,L,'m');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Band Pass FIR Filter Hanning');
%BAND PASS FILTER KAISER
Wn = [Wp Ws];
b = fir1(n,Wn,"bandpass",y1);
[h, w] = freqz(b,1,256);
L = 20*log10(abs(h));
figure(2);
subplot(2,2,3);
plot(w/pi,L,'m');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response Band Pass FIR Filter Kaiser');
%BAND PASS FILTER BARTLETT
Wn = [Wp Ws];
b = fir1(n,Wn,"bandpass",y2);
[h, w] = freqz(b,1,256);
L = 20*log10(abs(h));
figure(3);
subplot(2,2,3);
plot(w/pi,L,'m');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response Band Pass FIR Filter Bartlett');

%BAND STOP FILTER HANNING
Wn = [Wp Ws];
b = fir1(n,Wn,'stop',y);
[h, w] = freqz(b,1,256);
o = 20*log10(abs(h));
figure(1);
subplot(2,2,4);
plot(w/pi,o,'k');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Band Stop FIR Filter Hanning');
%BAND STOP FILTER KAISER
Wn = [Wp Ws];
b = fir1(n,Wn,'stop',y1);
[h, w] = freqz(b,1,256);
o = 20*log10(abs(h));
figure(2);
subplot(2,2,4);
plot(w/pi,o,'k');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response Band Stop FIR Filter Kaiser');
%BAND STOP FILTER BARTLETT
Wn = [Wp Ws];
b = fir1(n,Wn,'stop',y2);
[h, w] = freqz(b,1,256);
o = 20*log10(abs(h));
figure(3);
subplot(2,2,4);
plot(w/pi,o,'k');
ylabel('Gain(dB)');
xlabel('Normalized Frequency');
title('Response Band Stop FIR Filter Bartlett');
