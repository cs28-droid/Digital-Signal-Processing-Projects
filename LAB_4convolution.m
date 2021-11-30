%DSP LAB ASSESSMENT - 4
%Linear Convolutions of Signals

%Chirag Satapathy - 19BEI0107

clc
clear all
close all

%Enter the 'x' and 'h' values in [] leaving space between each value
%Eg: [1 2 3 4 5]
x = input('Enter the 1st sequence: ');
h = input('Enter the 2nd sequence: ');
y = conv(x,h);

figure; subplot(3,1,1);
stem(x); ylabel('Amplitude-->');
xlabel('(a)n-->');
subplot(3,1,2);
stem(h); ylabel('Amplitude-->');
xlabel('(b)n-->');
subplot(3,1,3);
stem(y); ylabel('Amplitude-->');
xlabel('(c)n-->');
disp('The resultant signal is');y