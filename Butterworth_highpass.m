clc
clear all
close all

alphap=0.4; 
alphas=30;
fp=400;
fs=800;
f=2000;

omegap=2*fp/f;
omegas=2*fs/f;  
[n wn]=buttord(omegap,omegas,alphap,alphas);  
[b a]=butter(n,wn,'high'); 
w=0:0.01:pi;  
[h w]=freqz(b,a,w,'whole');
m=abs(h);
an=angle(h);  
 
figure(2);
subplot(2,1,1);
plot(w/pi,20*log(m));
grid;  
xlabel('Normalised Frequency');
ylabel('Gain in dB');
title('Low high IIR filter - magnitude response');

subplot(2,1,2);
plot(w/pi,an);
grid;
xlabel('Normalised Frequency');
ylabel('Gain in radians');  
title('Low high IIR filter - magnitude response');
  
