%DSP LAB ASSESSMENT - 1
%Generation of Signals

%Chirag Satapathy - 19BEI0107

clc
clear all
close all

%unit impulse signal
n = -20:20;
x = [zeros(1, 20) 1 zeros(1,20)];
subplot(3,1,1);
stem(n,x);
xlabel('Time Index n');
ylabel('Amplitude')
title('Unit Impulse Signal');

%unit step signal
y = [zeros(1, 20) 1 ones(1,20)];
subplot(3,1,2);
stem(n,y);
xlabel('Time Index n');
ylabel('Amplitude')
title('Unit Step Signal');

%ramp signal
z = [zeros(1, 21), 1:20];
subplot(3,1,3);
stem(n,z);
xlabel('Time Index n');
ylabel('Amplitude')
title('Ramp Signal');
