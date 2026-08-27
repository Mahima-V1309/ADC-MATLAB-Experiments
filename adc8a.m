clc; clear; close all

N=1000; SNR=5;
data=randi([0 1],N,1);
bpsk=2*data-1;

figure
subplot(1,2,1)
scatter(real(bpsk),imag(bpsk),30,'filled')
hold on
xline(0); yline(0);
grid on; axis equal
xlim([-1.5 1.5]); ylim([-1 1]);
title('Ideal BPSK Constellation')

rx=awgn(bpsk,SNR,'measured');

subplot(1,2,2)
scatter(real(rx),imag(rx),15,'filled')
hold on
xline(0); yline(0);
grid on; axis equal
xlim([-2.5 2.5]); ylim([-2 2]);
title(['Noisy BPSK (SNR = ' num2str(SNR) ' dB)'])

detected=real(rx)>0;
errors=sum(data~=detected);
BER=errors/N;

fprintf('Transmitted Bits = %d\n',N);
fprintf('Bit Errors = %d\n',errors);
fprintf('BER = %f\n',BER);