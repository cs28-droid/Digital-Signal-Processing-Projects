%DSP LAB ASSESSMENT - 7
%Chirag Satapathy - 19BEI0107

%Date - 5th October, 2021

%To design an analog IIR elliptical bandpass filter

clc
clear all
close all

t=0:200;
fs = 150;
N = 256;

s1 = sin(2*pi*10*t/fs);
subplot(4,1,1)
plot(s1);
title('10Hz signal')
xlabel('Time')
ylabel('Amplitude')

s2 = sin(2*pi*20*t/fs);
subplot(4,1,2)
plot(s2);
title('20Hz signal')
xlabel('Time')
ylabel('Amplitude')

s3 = sin(2*pi*30*t/fs);
subplot(4,1,3)
plot(s3);
title('30Hz signal')
xlabel('Time')
ylabel('Amplitude')

s = s1+s2+s3; %addition of the three signals
subplot(4,1,4)
plot(s);
title('Addition of 3 signal')
xlabel('Time')
ylabel('Amplitude')

%IIR bandpass signal (Elliptical)
[b, a] = ellip(4, 0.1, 40, [15 45]*2/fs);
[h,w] = freqz(b,a,512);
figure(2)
plot(w*fs*(2*pi),abs(h));
title('Response of Filter');
xlabel('Frequency in Hz');
ylabel('Gain in dB');

%Filtered Output
sf = filter(b,a,s);
figure(3);
subplot(2,1,1);
plot(sf);
title('Filtered Output');

%Frequency Spectrum plot
y = fft (s,512); 
y1 = fft (sf, 512); 
p = ((0:255) /256*fs/2) ;
subplot (2,1,2);
plot (p, abs ([y(1:256)' ,y1(1:256)']));
title('Frequency spectrum of filtered signal');
xlabel('Frequency in Hz');
ylabel('Amplitude');