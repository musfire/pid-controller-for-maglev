% Define the plant transfer function (example)
num_plant = 1448.4;
den_plant = [1 0 -930.25];
plant_tf = tf(num_plant, den_plant);

% PID controller gains (example)
Kp = 0;
Ki = 0;
Kd = 0;
controller_tf = tf([Kd Kp Ki], [1 0]);

% Closed-loop system transfer function
closed_loop_tf = feedback(series(controller_tf, plant_tf), 1);

% Calculate the critical frequency
DC_gain = abs(freqresp(closed_loop_tf, 0)); % DC gain (magnitude at s = 0)
desired_mag = 0.707 * DC_gain; % Magnitude at critical frequency (-3 dB)

% Define a function to calculate the magnitude of the closed-loop transfer function at a given frequency
magnitude_func = @(omega) abs(freqresp(closed_loop_tf, omega));

% Use fzero to find the critical frequency where |G(j*omega)| = 0.707 * DC_gain
critical_frequency = fzero(@(omega) magnitude_func(omega) - desired_mag, 1);

% Display the critical frequency
fprintf('Critical Frequency: %.4f rad/s\n', critical_frequency);

% Plot Bode plot of the closed-loop system
figure;
bode(closed_loop_tf);
title('Bode Plot of Closed-loop System');
grid on;
%%
clc
clear all
