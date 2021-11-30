%DSP LAB ASSESSMENT - 10
%Chirag Satapathy - 19BEI0107

%Date - 16th November, 2021
%EEG signal plotting

%Load the EEG Signal using MATLAB command, plot the input signal and obtain spectrum for each signal.

clc
clear all
close all

fs = 1000; %Sampling frequency
eeg1 = dlmread('Z001.txt') ; %Normal EEG signal
eeg2 = dlmread('S001.txt'); %Abnormal EEG signal

x = eeg1(:,1); %Reading values from index 0 to end
y = eeg2(:,1);
subplot(211);
plot(x,'b');
title('Normal EEG Signal');
xlabel ('Number of Samples');
ylabel('Amplitude (µV)');
subplot(212);
plot(y,'r');
title('Abnormal EEG Signal ');
xlabel ('Number of Samples');
ylabel('Amplitude (µV)');

figure %Power v/s frewuncy comparision
subplot(2,1,1);
z = fft(x);
n = length(x);
f = (0:n-1)*(fs/n);
power = abs(z).^2/n;
plot(f,power);
xlabel('Frequency');
ylabel('Power Spectra Density');

subplot(2,1,2);
z = fft(y);
n = length(y);
f = (0:n-1)*(fs/n);
power = abs(z).^2/n;
plot(f,power);
xlabel('Frequency');
ylabel('Power Spectral Density');