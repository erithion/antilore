clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;

[filepath, ~, ~] = fileparts(mfilename('fullpath'));
filename = 'julie_fowlis.mp3';
samples = [700000, 700000 + 2 * 44100 - 1]; % 5 sec of 44100-samples-per-second audio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

audioFile = strcat(filepath, '\', filename);
[x, fs] = audioread(audioFile, samples);
    xl = x(:, 1); % left channel
    xr = x(:, 2); % right channel
    % sound(x, fs);
    
figure;

% Signal in time domain
t = ( 0 : 1/fs : (length(xl) - 1)/fs );

    % left
    subplot(3, 2, 1)
    plot(t, xl)
    grid on;
    title('Time domain (left channel)');
    xlabel('Seconds')
    ylabel('Amplitude')
    xlim([0 t(end)])

    % right
    subplot(3, 2, 2)
    plot(t, xr)
    grid on;
    title('Time domain (right channel)');
    xlabel('Seconds')
    ylabel('Amplitude')
    xlim([0 t(end)])

% Signal in frequency domain
m = length(xl); 
%n = pow2(nextpow2(m));
n = m;
f = (-n/2 : n/2 - 1) * (fs/n)/(10^3); % frequency vector (in kHz (10^3))

    Xl = fftshift(fft(xl, n));
    Xr = fftshift(fft(xr, n));

    % left magntd
    Xlm = abs(Xl);   % magnitude
    subplot(3, 2, 3);
    plot(f, Xlm);
    grid on;
    xlabel('Frequency, kHz');
    ylabel('Magnitude');
    title('Frequency domain (left channel)');
    xlim([-4 4])

    % left pwr
    Xlp = abs(Xl).^2/n;   % power spectrum      
    subplot(3, 2, 5);
    plot(f, Xlp);
    grid on;
    xlabel('Frequency, kHz');
    ylabel('Power');
    title('Frequency domain (left channel)');
    xlim([-1.2 1.2])
    
    % right mgn
    Xrm = abs(Xr);
    subplot(3, 2, 4);
    plot(f, Xrm);
    grid on;
    xlabel('Frequency, kHz');
    ylabel('Magnitude');
    title('Frequency domain (right channel)');
    xlim([-4 4])

    % right mgn
    Xrp = abs(Xr).^2/n; 
    subplot(3, 2, 6);
    plot(f, Xrp);
    grid on;
    xlabel('Frequency, kHz');
    ylabel('Power');
    title('Frequency domain (right channel)');
    xlim([-2 2])

