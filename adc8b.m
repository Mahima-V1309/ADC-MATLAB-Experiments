clc; clear; close all

N=1000; SNR=5;
data=randi([0 1],N,1);
b=reshape(data,2,[])';

% QPSK Mapping
qpsk=(1-2*b(:,2))+1j*(1-2*b(:,1));
qpsk=qpsk/sqrt(2);

figure
scatter(real(qpsk),imag(qpsk),'filled')
grid on; axis equal
title('Ideal QPSK Constellation')
xlabel('I'); ylabel('Q');

% Add Noise
rx=awgn(qpsk,SNR,'measured');

figure
scatter(real(rx),imag(rx),'filled')
grid on; axis equal
title(['Noisy QPSK (SNR = ' num2str(SNR) ' dB)'])
xlabel('I'); ylabel('Q');

% Detection
det=zeros(N,1);
det(1:2:end)=imag(rx)<0;
det(2:2:end)=real(rx)<0;

% BER
errors=sum(data~=det);
BER=errors/N;

fprintf('Bits = %d\nErrors = %d\nBER = %.4f\n',N,errors,BER);