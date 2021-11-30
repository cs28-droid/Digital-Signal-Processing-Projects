%DSP LAB ASSESSMENT - 2
%Correlation of signals

%Chirag Satapathy - 19BEI0107

%Cross Correlation
clc
clear all
close all

%Enter the 'x' and 'h' values in [] leaving space between each value
%Eg: [1 2 3 4 5]
x = input('Discrete sample of x(n): ');
h = input('Discrete sample of h(n): ');
xlen = length(x);
hlen = length(h);
k = 0; y = 0;

for i = 1:xlen
    for j = 1:hlen
        y(i,i+j-1) = x(i)*h(hlen-j+1);
    end
end
newline
z = sum(y)
disp("Output");z
disp("Output sequence");y
stem(x,y);
title('CROSS CORRELATION OF SIGNALS');


