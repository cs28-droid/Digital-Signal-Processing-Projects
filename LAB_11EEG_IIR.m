%DSP LAB ASSESSMENT - 11
%Chirag Satapathy - 19BEI0107

%Date - 23rd November, 2021
%EEG signal plotting IIR bandpass elliptical filter

%Load the EEG Signal using MATLAB command, plot the input signal and obtain spectrum for each signal.

clc
clear all
close all

fs = 80; %Sampling frequency
eeg1 = dlmread('Z001.txt') ; %Normal EEG signal
eeg2 = dlmread('S001.txt'); %Abnormal EEG signal

x = eeg1(:,1); %Reading values from index 0 to end
y = eeg2(:,1);
figure(1);
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

%IIR bandpass filter (Elliptical filter)
figure(2);
inputData = dlmread('Z001.txt') ;
inputData2 = dlmread('S001.txt') ;

fs = 80; % Hz
lowEnd = 3; % Hz
highEnd = 30; % Hz
filterOrder = 4; % Filter order (e.g., 2 for a second-order Butterworth filter). Try other values too
[b,a] = ellip(4,0.1,40,[3 30]*2/fs);
[h,w] = freqz(b,a,512);
filteredData = filtfilt(b, a, inputData);
filteredData2 = filtfilt(b, a, inputData2);% Apply filter to data using zero-phase filtering
subplot(211)
plot(filteredData,'b');
title('Normal EEG Signal after filtering');
xlabel ('Number of Samples');
ylabel('Amplitude (µV)');
subplot(212)
plot(filteredData2,'r');
title('Abnormal EEG Signal after filtering');
xlabel ('Number of Samples');
ylabel('Amplitude (µV)');

figure(3); %Power v/s frequency comparision
subplot(2,1,1);
z = fft(filteredData);
n = length(filteredData);
f = (0:n-1)*(fs/n);
power = abs(z).^2/n;
plot(f,power);
xlabel('Frequency');
ylabel('Power Spectral Density');

subplot(2,1,2);
z = fft(filteredData2);
n = length(filteredData);
f = (0:n-1)*(fs/n);
power = abs(z).^2/n;
plot(f,power);
xlabel('Frequency');
ylabel('Power Spectral Density');

[b,a] = ellip(4,0.1,40,[3 30]*2/fs);
[h,w] = freqz(b,a,512);
figure(4);
subplot(211);
plot(w*fs/(2*pi),abs(h));
xlabel('Frequency');
ylabel('Gain in dB');
title('Response of filter (Normal)');

[b,a] = ellip(4,0.1,40,[3 30]*2/fs);
[h,w] = freqz(b,a,inputData(1));
subplot(212);
plot(w*fs/(2*pi),abs(h),'g');
xlabel('Frequency');
ylabel('Gain in dB');
title('Response of filter (Abnormal)');

