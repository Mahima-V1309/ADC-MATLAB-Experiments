clc; clear; close all

Am=1; Ac=5; fm=100; fc=1000;
fs=20*fc; kp=pi/2;
t=0:1/fs:4/fm;

m=Am*sin(2*pi*fm*t);
pm=Ac*cos(2*pi*fc*t + kp*m);

beta=kp*Am;
BW=2*(beta+1)*fm;

N=length(pm);
f=linspace(-fs/2,fs/2,N);
PM_FFT=abs(fftshift(fft(pm)))/N;
PSD=abs(fftshift(fft(pm))).^2/(N*fs);

fprintf('Phase Deviation = %.2f rad\n',beta);
fprintf('Estimated Bandwidth = %.2f Hz\n',BW);

figure
subplot(2,2,1), plot(t,m), title('Message Signal'), grid on
subplot(2,2,2), plot(t,pm), title('Phase Modulated Signal'), grid on
subplot(2,2,3), plot(f,PM_FFT), title('Frequency Spectrum'), grid on
subplot(2,2,4), plot(f,PSD), title('Power Spectral Density'), grid on