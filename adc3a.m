clc; clear; close all

Am=1; Ac=5; fm=100; fc=1000;
fs=20*fc; kp=pi/2;
t=0:1/fs:4/fm;

m=Am*sin(2*pi*fm*t);
c=Ac*cos(2*pi*fc*t);
pm=Ac*cos(2*pi*fc*t + kp*m);

phase_dev=kp*Am;
mp=phase_dev;

fprintf('Am = %.0f V\nfm = %d Hz\nAc = %.0f V\nfc = %d Hz\n',Am,fm,Ac,fc);
fprintf('kp = %.2f rad/V\nPhase Deviation = %.2f rad\nPM Modulation Index = %.2f\n',kp,phase_dev,mp);

figure
subplot(2,2,1), plot(t,m), title('Message Signal'), grid on
subplot(2,2,2), plot(t,c), title('Carrier Signal'), grid on
subplot(2,2,3), plot(t,pm), title('Phase Modulated Signal'), grid on
subplot(2,2,4), bar(phase_dev), title('Phase Deviation')
set(gca,'XTickLabel',{'PM Signal'}), grid on