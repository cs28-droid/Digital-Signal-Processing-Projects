%DSP LAB ASSESSMENT - 6
%Chirag Satapathy - 19BEI0107

%Date - 28th September, 2021

%To design an analog IIR butterworth bandstop filter with parameters
%alphap=0.4, alphas=30, fp=40, fs=800 and f = 2000

clc
clear all
close all

%Design of Analog Butterworth filter
alphap = 2;
alphas = 20;
fs1 = 0.1;
fs2 = 0.5;
f = 2000;
omegap = [0.2*pi,0.4*pi];
omegas = [0.1*pi,0.5*pi];

%Design Butter LPF
[n wn] = buttord(omegap/pi, omegas/pi, alphap, alphas);

%COmputing order of filter
[b a] = butter(n,wn,'stop');
w=0:0.1:pi;
[h w] = freqz(b,a,w)
m = abs(h);
an = angle(h);
subplot(2,1,1);
plot(w/pi,20*log(m));
grid;
xlabel('Normalised Frequency');
ylabel('Gain in dB');
subplot(2,1,2);

%Plotting phase response 
plot(w/pi,an);
grid;
xlabel('Normalized frequency');
ylabel('Given in radians');