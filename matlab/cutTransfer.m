function [B, A] = cutTransfer(gain, lambda, w0)
% Трансфер-функция 2го порядка для обнуления частоты. Получаем на основе метода zeroes-poles
% Мат. вид: H = G0 (1 - e^iw0 z^-1)(1 - e^-iw0 z^-1) / (1 - L e^iw0 z^-1)(1 - L e^-iw0 z^-1)
% На выход [числитель, знаменатель] коэффициенты трансфер-функции
    zeroes = exp( j * [-w0 w0]' );
    poles = lambda * zeroes;
    [B, A] = zp2tf( zeroes, poles, gain );
end