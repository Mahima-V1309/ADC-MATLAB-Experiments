clc; clear; close all

N=[7 15 31 63 127 255 511 1023];
PG=10*log10(N);

T=table(N',PG','VariableNames',{'PN_Length','Gain_dB'});
disp(T)

figure
stem(N,PG,'filled')
grid on
xlabel('PN Sequence Length')
ylabel('Processing Gain (dB)')
title('Processing Gain vs PN Sequence Length')