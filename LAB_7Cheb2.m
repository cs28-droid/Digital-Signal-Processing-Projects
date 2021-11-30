%DSP LAB ASSESSMENT - 7
%Chirag Satapathy - 19BEI0107

%Date - 5th October, 2021

%To design of Type 2 Chebyshev Filter with parameters
%alphap=2, alphas=20, wp1=0.2, ws1=0.1 

close all;
clear all:
clc;

alphap = 2; %Passband attenuation in dB
alphas = 20; %Stopband attenuation in dB
wp = 0.2*pi; %Passband frequency in radians
ws = 0.3*pi; %stopband frequency in radians

%To find cutoff frequency and order of the filter

[n,wn] = cheb2ord(wp/pi, ws/pi, alphap, alphas);

%System function of the filter
[b,a] = cheby2(n, alphap, wn);
w = 0:0.01:pi;
[h,ph]= freqz (b, a, w);
m = 20*log(abs(h));
an = angle (h);

%To plot magnitude and phase response

subplot (2,1,1);
plot (ph/pi, m);
grid;
title('Magnitude Response' );
ylabel ('Gain in dB');
xlabel('Normalised Frequency ');

subplot (2,1,2);
plot (ph/pi, an);
grid;
title('Phase Response');
ylabel('Phase in radians');
xlabel ('Normalised frequency');