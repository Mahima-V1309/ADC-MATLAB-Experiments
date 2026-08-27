clc; clear; close all

Am=2; Ac=1; fm=500; fc=10000;
kf=250; fs=100000; T=0.01;
t=0:1/fs:T;

m=Am*cos(2*pi*fm*t);
df=kf*Am;
beta=df/fm;

fm_sig=Ac*cos(2*pi*fc*t + beta*sin(2*pi*fm*t));

fprintf('fc = %d Hz\nfm = %d Hz\nAm = %d V\nkf = %d Hz/V\n',fc,fm,Am,kf);
fprintf('\nDelta f = %.0f Hz\nBeta = %.2f\n',df,beta);

if abs(beta-df/fm)<1e-6
    fprintf('Verification Successful\n');
else
    fprintf('Verification Failed\n');
end

figure
subplot(2,1,1), plot(t,m), title('Message Signal'), grid on
xlabel('Time (s)'), ylabel('Amplitude (V)')

subplot(2,1,2), plot(t,fm_sig), title('FM Signal'), grid on
xlabel('Time (s)'), ylabel('Amplitude (V)')