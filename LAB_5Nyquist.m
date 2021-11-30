%DSP LAB ASSESSMENT - 5
%Chirag Satapathy - 19BEI0107

%Date - 7th September, 2021
%Nyquist Criteria
clc
clear all
close all

t=0:200;
fs = 150;

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

n=256;
f = fft(s,n);
d = abs(f);
figure(2);
h = 0:fs/n:fs-(fs/n);
plot(h,d);
title('Spectrum of signals')
xlabel('Frequency')
ylabel('Amplitude')

sn=awgn(s,0.5); %add white gaussain noise to signal
figure(3);
subplot(2,1,1);
plot(sn);
fn = fft(sn,n);
title('Spectrum of signal with noise')
xlabel('Frequency')
ylabel('Power Spectral Density')

dn = abs(fn);
subplot(2,1,2);
plot(h,dn);
xlabel('Frequency')
ylabel('Power Spectral Density')

