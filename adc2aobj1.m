clc; clear; close all

Am=1; Ac=1; fm=5; fc=50; beta=5;
fs=1000; t=0:1/fs:1;

m=Am*cos(2*pi*fm*t);
c=Ac*cos(2*pi*fc*t);
fm_sig=Ac*cos(2*pi*fc*t + beta*sin(2*pi*fm*t));

figure
subplot(3,1,1), plot(t,m), title('Message Signal'), grid on
subplot(3,1,2), plot(t,c), title('Carrier Signal'), grid on
subplot(3,1,3), plot(t,fm_sig), title('FM Signal'), grid on