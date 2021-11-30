%DSP LAB ASSESSMENT - 1
%Generation of Signals continuation

%Chirag Satapathy - 19BEI0107

clc
clear all
close all

%exponential increasing and decreasing signal

n = 0:10;
a = 2;
x = a.^n;
subplot(2,1,1);
stem(n,x);
title('Exponentially rising Signal');
xlabel('Time');
ylabel('Amplitude');

a1 = 0.5;
x1 = a1.^n;
subplot(2,1,2);
stem(n,x1);
title('Exponentially rising Signal');
xlabel('Time');
ylabel('Amplitude');