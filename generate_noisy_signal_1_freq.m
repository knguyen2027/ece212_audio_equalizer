clear;

% Frequency parameters
f1 = 10140;                % Frequency (Hz)
phi1 = pi/6;              % Phase (radians)

% Time Vector
t = linspace(0, 20 * 1/f1, 1000); 
Ts = t(2) - t(1);         % Sampling period (seconds)

% Create the clean signal
s1 = sin(2*pi*f1*t + phi1);

% Add Gaussian noise
noise_power = 5;      % Variance of Gaussian noise
noise = sqrt(noise_power) * randn(size(t));
noisy_signal = s1 + noise;

% Print results
current_filename=sprintf('One_Signal_Vin.txt');
current_fid=fopen(current_filename,'w');
fprintf(current_fid,'%e     %e \n',[t; noisy_signal]);
fprintf(current_fid,'%e     %e \n',[t(end)+Ts; 0]);
fclose(current_fid);

% Plot results
figure;
plot(t, noisy_signal, 'k', 'color', 'red');
title('Noisy Signal');
xlabel('Time (s)'); ylabel('Amplitude');