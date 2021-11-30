clc
close all
clear all

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
plot(filteredData);
subplot(212)
plot(filteredData2);
