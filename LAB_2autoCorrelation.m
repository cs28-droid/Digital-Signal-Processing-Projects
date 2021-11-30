%DSP LAB ASSESSMENT - 2
%Correlation of signals

%Chirag Satapathy - 19BEI0107

%Auto Correlation
clc
clear all
close all

%Enter the 'x' values in [] leaving space between each value
%Eg: [1 2 3 4 5]
x = input('Discrete sample of x(n): ');
xlen = length(x);

for i = 1:xlen
for j = 1:xlen
    y(i,i+j-1) = x(i)*x(xlen-j+1);
end
end
z = sum(y);
newline
disp('AUTO CORRELATION OF SIGNAL');
disp("Output");z
stem(x,y);
