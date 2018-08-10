function [b, a] = cutDifference2(lambda, w0, w1)
% Разностное уравнение для обнуления частоты, получено обратным
    b = [1 -2*(cos(w0)+cos(w1)) 2*(1+2*cos(w0)*cos(w1)) -2*(cos(w0)+cos(w1)) 1];
    a = [1 -2*lambda*(cos(w0)+cos(w1)) 2*(lambda^2)*(1+2*cos(w0)*cos(w1)) -2*(lambda^3)*(cos(w0)+cos(w1)) lambda^4];
end