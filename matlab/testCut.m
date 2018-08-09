% напоминачка : w = 2 pi f или f = w / 2 pi
clear all;
T = 20;
f = 1/T;
w = 2 * pi * f; % angular freq

figure('Name','Filter test on sinusoids');

% оригинал
t = linspace(0, 1000 - f, 1000);
orig = 2 * sin(w * t) + 4 * sin(2 * w * t);
%orig = 2 * sin(w * t) + (cos(t * w/6) .* (4 * sin(2 * w * t)));
subplot(4, 1, 1);
plot(t, orig);
grid on;
title('Original (modulated) signal');
ylabel('2 sin \pi/10 + 4 sin \pi/5');
%ylabel('2 sin \pi/10 + cos \pi/60 * 4 sin \pi/5');

% FFT
n = length(orig); 
ORIG = fftshift(fft(orig, n));
subplot(4, 1, 2);
tt = - pi : 2 * pi / n : pi - 2 * pi / n;
plot(tt, abs(ORIG));
grid on;
ylabel('Magnitude');
title('FFT');
set(gca,'XTick', [-pi -pi/5 -pi/10 0 pi/10 pi/5 pi]);
set(gca,'XTickLabel', {'-\pi','-\pi/5','-\pi/10','0','\pi/10','\pi/5','\pi'});

% ccde
L = 0.99;       % lambda

[b,a] = ccdeCut(L, w);
[H, W] = freqz(b, a, 1000);
subplot(4, 1, 3);
plot(W, abs(H) );
grid on;
ylabel('Magnitude');
title('CCDE frequency response');
set(gca,'XTick', [0 pi/10 pi]);
set(gca,'XTickLabel', {'0','\pi/10','\pi'});

% фильтрация; другой способ это через свертку и cdde
[B, A] = tfCut(1, L, w);
subplot(4, 1, 4);
filt = filter(B, A, orig);
plot(t, filt);
grid on;
title('Filtered signal');
%fvtool( B, A );
