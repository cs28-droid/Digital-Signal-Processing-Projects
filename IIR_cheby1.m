clc
clear all
close all

t = 0:200;
fs = 150;
N = 256;
s1 = sin(2*pi*10*t/fs);
subplot(4,1,1);
plot(s1);
title('10Hz Signal');
xlabel('Time');
ylabel('Amoplitude');
s2 = sin(2*pi*20*t/fs);
subplot(4,1,2);
plot(s2);
title('20Hz Signal');
xlabel('Time');
ylabel('Amplitude');
s3 = sin(2*pi*30*t/fs);
subplot(4,1,3);
plot(s3);
xlabel('Time');
ylabel("Amplitude");
s4 = s1+s2+s3;
subplot(4,1,4);
plot(s4);

%IIR BANDPASS FILTER(CHEBYSHEV TYPE_1 FILTER)
[b,a] = cheby1(4,0.1,[15 45]*2/fs);
[h,w] = freqz(b,a,512);
figure(2);
plot(w*fs/(2*pi),abs(h));
xlabel('Frequency in Hz');
ylabel('Gain in db');
title('Response of Filter');
sf = filter(b,a,s4);
figure(3);
subplot(2,1,1);
plot(sf);
title('Filtered Output');
y = fft(s4,512);
y1 = fft(sf,512);
p = ((0:255)/256*fs/2);
subplot(2,1,2);
plot(p,abs([y(1:256)',y1(1:256)']));
title('Frequency Spectrum of Sample Signal');
xlabel('Frequency in Hz');
ylabel('Amplitude');