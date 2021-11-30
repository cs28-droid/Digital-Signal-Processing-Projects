clc
clear all
close all

EEG = dlmread('Z001.txt')
EEG_cellarray=table2array(EEG);
EEG_array = vertcat(EEG_cellarray{:});
t=0:1/200:10;
figure;
subplot(211);
plot(t, EEG_array(1:2001));

fs=200;
n=256;
%spectra of the sum of given signals
f=fft(EEG_array,n);
d=abs(f);
subplot(212);
h=0:fs/n:fs-(fs/n); %x-axis scale-to find dft for each sample
plot(h,d);
xlabel('frequency');
ylabel('Magnitude');
title('Spectra of the EEG signal');
