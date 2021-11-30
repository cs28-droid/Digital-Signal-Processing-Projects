%DSP LAB ASSESSMENT - 4
%Convolutions of Signals

%Chirag Satapathy - 19BEI0107

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
        y(i,j+k) = x(i)*h(j);
    end
    k = k+1;
end
newline
z = sum(y)
stem(z);
title('CONVOLUTION OF SIGNALS');
