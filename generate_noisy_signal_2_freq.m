clear;

% Lower frequency parameters
f1 = 6380;                % Frequency (Hz)
phi1 = pi/6;              % Phase (radians)

% Higher frequency parameters
f2 = 10140;                % Frequency (Hz)
phi2 = pi/3;              % Phase (radians)

% Time Vector
t = linspace(0, 20 * 1/f1, 1000);        
Ts = t(2) - t(1);         % Sampling period (seconds)

% Create the clean signal
s1 = sin(2*pi*f1*t + phi1);
s2 = sin(2*pi*f2*t + phi2);
clean_signal = s1 + s2;

% Add Gaussian noise
noise_power = 5;      % Variance of Gaussian noise
noise = sqrt(noise_power) * randn(size(t));
noisy_signal = clean_signal + noise;

% Print results
current_filename=sprintf('Two_Signal_Vin.txt');
current_fid=fopen(current_filename,'w');
fprintf(current_fid,'%e     %e \n',[t; noisy_signal]);
fprintf(current_fid,'%e     %e \n',[t(end)+Ts; 0]);
fclose(current_fid);

% Plot results
figure;
plot(t, noisy_signal, 'k');
title('Noisy Signal');
xlabel('Time (s)'); ylabel('Amplitude');