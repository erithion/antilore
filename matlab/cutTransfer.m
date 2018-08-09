function [B, A] = cutTransfer(gain, lambda, w0)
% ��������-������� 2�� ������� ��� ��������� �������. �������� �� ������ ������ zeroes-poles
% ���. ���: H = G0 (1 - e^iw0 z^-1)(1 - e^-iw0 z^-1) / (1 - L e^iw0 z^-1)(1 - L e^-iw0 z^-1)
% �� ����� [���������, �����������] ������������ ��������-�������
    zeroes = exp( j * [-w0 w0]' );
    poles = lambda * zeroes;
    [B, A] = zp2tf( zeroes, poles, gain );
end