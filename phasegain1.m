clc
clear all;
close all;

sys=tf([1488.4], [1 0 -930.25])
no = 0;  
ne = 1488.4;  
do = 0;
 w = 0:103.9563; 
% Preallocate matrix for Kp
Kp1 = zeros(length(w), 1);
Ki1 = zeros(length(w), 1);
Kp2 = zeros(length(w), 1);
Ki2 = zeros(length(w), 1);
Kd=0.05;
% Calculate Kp Ki for each value of w
for i = 1:length(w)
    de=-w(i)^2-930.25;
    h=w(i)*0.1;
Kp1(i) = ((w(i)^2 * no * do + ne * de) * cos(h) + w(i) * (no * de - ne * do) * sin(h)) / (-2.5*((ne^2) + w(i)^2 * no^2));
Ki1(i) = (w(i)^2 * (no * de + ne * do) * cos(h) - w(i) * (ne * de + w(i)^2 * no * do) * sin(h)-( Kd * w(i)^2 * (ne^2 + w(i)^2 * no^2))) / (-2.5*((ne^2) + w(i)^2 * no^2));
end
for i = 1:length(w)
    de=-w(i)^2-930.25;
    h=w(i)*0.1+0.785;
Kp2(i) = ((w(i)^2 * no * do + ne * de) * cos(h) + w(i) * (no * de - ne * do) * sin(h)) / (-((ne^2) + w(i)^2 * no^2));
Ki2(i) = (w(i)^2 * (no * de + ne * do) * cos(h) - w(i) * (ne * de + w(i)^2 * no * do) * sin(h)-( Kd * w(i)^2 * (ne^2 + w(i)^2 * no^2))) / (-((ne^2) + w(i)^2 * no^2));
end
hold all
plot(Kp1,Ki1,'red')
plot(Kp2,Ki2,'black')
xlabel('Kp');
ylabel('Ki');
title('Kp vs Ki');
grid on;