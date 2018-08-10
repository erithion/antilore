% напоминачка : w = 2 pi f или f = w / 2 pi
clear all;
T = 20;
f = 1/T;
w = 2 * pi * f; % angular freq

figure('Name', 'Filter test on sinusoids');

% оригинал
t = linspace(0, 1000 - f, 1000);
% simple
%orig = 2 * sin(w * t) + 4 * sin(2 * w * t);
% modulated
orig = cos(t * 10 * w / 7) .* (2 * sin(w * t)) + 4 * sin(2 * w * t);
subplot(4, 1, 1);
plot(t, orig);
grid on;
% simple
%title('Original signal');
%ylabel('$$2 * sin\frac{\pi}{10}x + 4*sin\frac{\pi}{5}x$$', 'Interpreter', 'latex');
% modulated
title('Original (modulated) signal');
ylabel('$$2*sin\frac{\pi}{10}x * cos\frac{\pi}{7}x  + 4*sin\frac{\pi}{5}x$$', 'Interpreter', 'latex');

% FFT
n = length(orig); 
ORIG = fftshift(fft(orig, n));
subplot(4, 1, 2);
tt = - pi : 2 * pi / n : pi - 2 * pi / n;
plot(tt, abs(ORIG));
grid on;
ylabel('Magnitude');
title('FFT');
set(gca, 'TickLabelInterpreter', 'latex');
% simple
%set(gca, 'XTick', [-pi -pi/5 -pi/10 0 pi/10 pi/5 pi]);
%set(gca, 'XTickLabel', {'$$-\pi$$', '$$-\frac{\pi}{5}$$', '$$-\frac{\pi}{10}$$', '0', '$$\frac{\pi}{10}$$', '$$\frac{\pi}{5}$$', '\pi'});
% modulated
set(gca, 'XTick', [-pi -17*pi/70  -pi/5 -3*pi/70 0 3*pi/70 pi/5 17*pi/70 pi]);
set(gca, 'XTickLabel', {'$$-\pi$$', '$$-\frac{17}{70}\pi$$', '$$-\frac{\pi}{5}$$', '$$-\frac{3}{70}\pi$$', '0', '$$\frac{3}{70}\pi$$', '$$\frac{\pi}{5}$$', '$$\frac{17}{70}\pi$$', '$$\pi$$'});
xlim([-pi/2 pi/2])

% ccde
L = 0.99;       % lambda

% simple
%[b,a] = cutDifference(L, w);
% modulated
%[b,a] = cutDifference(L, 2*w);
% two freq
[b,a] = cutDifference2(L, w - 10 * w / 7, w + 10 * w / 7);
[H, W] = freqz(b, a, n);
subplot(4, 1, 3);
plot(W, abs(H));
grid on;
ylabel('Magnitude');
title('CCDE frequency response');
set(gca, 'TickLabelInterpreter', 'latex');
% simple
%set(gca, 'XTick', [0 pi/10 pi]);
%set(gca, 'XTickLabel', {'0', '$$\frac{\pi}{10}$$', '$$\pi$$'});
% modulated
%set(gca, 'XTick', [0 pi/5 pi]);
%set(gca, 'XTickLabel', {'0', '$$\frac{\pi}{5}$$', '$$\pi$$'});
% two freq
set(gca, 'XTick', [0 3*pi/70 17*pi/70 pi]);
set(gca, 'XTickLabel', {'0', '$$\frac{3}{70}\pi$$', '$$\frac{17}{70}\pi$$', '$$\pi$$'});

% фильтрация; другой способ это через свертку и cdde
% simple
%[B, A] = cutTransfer(1, L, w);
% modulated
%[B, A] = cutTransfer(1, L, 2*w);
% two freq
[B, A] = cutTransfer2(1, L, w - 10 * w / 7, w + 10 * w / 7);
subplot(4, 1, 4);
filt = filter(B, A, orig);
plot(t, filt);
grid on;
title('Filtered signal');
%fvtool( B, A );
