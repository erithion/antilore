function [B, A] = cutTransfer2(gain, lambda, w0, w1)
% Трансфер-функция
    zeroes = exp( j * [-w0 w0 -w1 w1]' );
    poles = lambda * zeroes;
    [B, A] = zp2tf( zeroes, poles, gain );
end