%DSP LAB ASSESSMENT - 7
%Chirag Satapathy - 19BEI0107

%Date - 5th October, 2021

%To design an analog IIR butterworth high pass filter with parameters
%alphap=0.4, alphas=30, fp=40, fs=800 and f = 2000

clc
clear all
close all

alphap = 0.4;
alphas = 30;
fp = 400;
fs = 800;
f = 2000;
omegap = 2*fp/f;
omegas = 2*fs/f;

%Design Elliptic High pass
[b, a] = ellip(4, 0.1, 40, [15 45]*2/fs);
[h,w] = freqz(b,a,512);
figure(1)
plot(w*fs*(2*pi),abs(h));
title('Response of Filter');
xlabel('Frequency in Hz');
ylabel('Gain in dB');

%Computing order of filter
[z,p,k] = ellip(4,0.1,40,fp/500,'high');
sos = zp2sos(z,p,k);
fvtool(sos,'Analysis','freq')