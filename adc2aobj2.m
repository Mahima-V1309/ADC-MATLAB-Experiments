clc; clear; close all

Am=2; Ac=1; fm=500; fc=10000;
kf=1000; fs=100000; T=0.02;
t=0:1/fs:T;

m=Am*cos(2*pi*fm*t);
df=kf*Am;
beta=df/fm;

fm_sig=Ac*cos(2*pi*fc*t + beta*sin(2*pi*fm*t));

figure
subplot(2,1,1), plot(t,m), title('Message Signal'), grid on
subplot(2,1,2), plot(t,fm_sig), title('Frequency Modulated Signal'), grid on

N=length(fm_sig);
f=(-N/2:N/2-1)*(fs/N);
FM_FFT=fftshift(abs(fft(fm_sig))/N);

figure
plot(f,FM_FFT), title('FM Signal Spectrum')
xlabel('Frequency (Hz)'), ylabel('Magnitude')
xlim([fc-10000 fc+10000]), grid on

BW=2*(df+fm);

fprintf('\nFM SIGNAL PARAMETERS\n');
fprintf('Carrier Frequency = %d Hz\n',fc);
fprintf('Message Frequency = %d Hz\n',fm);
fprintf('Message Amplitude = %.2f V\n',Am);
fprintf('Frequency Sensitivity = %d Hz/V\n',kf);

fprintf('\nCALCULATED VALUES\n');
fprintf('Frequency Deviation = %d Hz\n',df);
fprintf('Modulation Index = %.2f\n',beta);
fprintf('Bandwidth (Carson Rule) = %d Hz\n',BW);