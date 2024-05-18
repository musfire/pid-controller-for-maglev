clc ;
clear all ;

% Example usage
syms Kp Ki Kd
num = [1488.4];  % Example numerator coefficients
den = [1 0 30.5^2];  % Example denominator coefficients
no = 0;  % Example odd part of numerator coefficients
ne = 1488.4;  % Example even part of numerator coefficients
do = 0;  % Example odd part of denominator coefficients % Example even part of denominator coefficients

w = 1:2;  % Example frequency
% Preallocate matrix for Kp
Kp = zeros(length(w), 1);
Kd = zeros(length(w), 1);
Ki = zeros(length(w), 1);
% Calculate Kp for each value of w
for i = 1:length(w)
    de=-w(i)^2-930.25;
Kp(i) = ((w(i)^2 * no * do + ne * de) * cos(w(i)) + w(i) * (no * de - ne * do) * sin(w(i))) / (-((ne^2) + w(i)^2 * no^2));
Kd(i) = (w(i)^2 * (no * de + ne * do) * cos(w(i)) - w(i) * (ne * de + w(i)^2 * no * do) * sin(w(i)) + 0 * (ne^2 + w(i)^2 * no^2)) / (w(i)^2 * ((ne^2) + w(i)^2 * no^2));
Ki(i) = (w(i)^2 * (no * de + ne * do) * cos(w(i)) - w(i) * (ne * de + w(i)^2 * no * do) * sin(w(i)) - Kd(i) * w(i)^2 * (ne^2 + w(i)^2 * no^2)) / (-((ne^2) + w(i)^2 * no^2));
end
figure;
plot3(Kp,Kd,Ki);
xlabel('Kp');
ylabel('Kd');
title('Kp vs Kd');
grid on;