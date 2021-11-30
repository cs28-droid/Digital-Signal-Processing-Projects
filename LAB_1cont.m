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
subplot(6,1,1);
stem(n,x);
title('Exponentially increasing Signal');
xlabel('Time');
ylabel('Amplitude');

a1 = 0.5;
x1 = a1.^n;
subplot(6,1,2);
stem(n,x1);
title('Exponentially decreasing Signal');
xlabel('Time');
ylabel('Amplitude');

%Sinusoidal signal

t1 = 0:0.01:20;
a1 = 3*sin(t1);
subplot(6,1,3);
stem(t1,a1);
title('Sinusoidal Signal');
xlabel('Time');
ylabel('Amplitude');

%Traingualr signal

a1=2;
x1=1-abs(t1)/a1;
x2=0;
x=x1.*(abs(t1)<=a1)+ x2.*(abs(t1)>a1);
subplot(6,1,4);
plot(x);
xlabel('Time');
ylabel('Amplitude');
title('Triangular Signal');

%Gaussian signal

a=2;
x2=exp(-a.*(t1.^2));
subplot(6,1,5);
plot(x2);
xlabel('Time');
ylabel('Amplitude');
title('Gaussian Signal');

%Parabolic signals

t = 0:0.05:1;
a = [t.^2];
subplot(6,1,6);
plot(t,a);
title('Parabolic Signal');
xlabel('Time');
ylabel('Amplitude');




