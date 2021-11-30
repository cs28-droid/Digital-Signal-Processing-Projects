%Aim: To design an analog IIR butterworth low pass filter with parameters:
%alphap=0.4; alphas=30; fp=40; fs=800 and f=800
%Plot the magnitude and phase response

clc;
clear all;
close all;

alphap=0.4; 
alphas=30;
fp=400;
fs=800;
f=2000;
omegap=2*fp/f;  omegas=2*fs/f;  
[n wn]=buttord(omegap,omegas,alphap,alphas);  
[b a]=butter(n,wn);  w=0:0.01:pi;  
[h w]=freqz(b,a,w,'whole');
m=abs(h);
an=angle(h);

figure(1);
subplot(2,1,1);
plot(w/pi,20*log(m));
grid;  
title('Low pass IIR filter - magnitude response');
xlabel('Normalised Frequency');
ylabel('Gain in dB');
subplot(2,1,2);
plot(w/pi,an);
grid;
xlabel('Normalised Frequency');
ylabel('Gain in radians');  
title('Low pass IIR filter - phase response');
