clc; clear; close all

bits=[1 0 0 1 1];
trellis=poly2trellis(3,[7 5]);
encoded=convenc(bits,trellis);

pairs=reshape(encoded,2,[])';

T=table((1:length(bits))',bits', ...
    string(pairs(:,1))+string(pairs(:,2)), ...
    'VariableNames',{'Bit','Input','Encoded'});
disp(T)

figure
subplot(2,1,1)
stairs(bits), ylim([-0.2 1.2])
title('Input Bit Sequence'), grid on

subplot(2,1,2)
stairs(encoded), ylim([-0.2 1.2])
title('Encoded Output Bit Sequence'), grid on