clc
clear all;
close all;

sys=tf([1488.4], [1 0 -930.25]);

Kp = 1.92;
Ki = 3;
Kd = 0.05;
C = pid(Kp,Ki,Kd);
T = feedback(C*sys,1);
[Gm,Pm,Wcg,Wcp] = margin(T);
margin(T);
%% stability boundry condn for phase margin
clc
clear all;
close all;

sys=tf([1488.4], [1 0 -930.25])
no = 0;  
ne = 1488.4;  
do = 0;
a=1;
 w = 0:3.14; 
% Preallocate matrix for Kp
Kp = zeros(length(w), 1);
Ki = zeros(length(w), 1);
Kd=0.04;
% Calculate Kp for each value of w
for i = 1:length(w)
    de=-(w(i)^2)-930.25;
    h=w(i)*0.5+0.785;
Kp(i) = ((w(i)^2 * no * do + ne * de) * cos(h) + w(i) * (no * de - ne * do) * sin(h)) / (-a*((ne^2) + w(i)^2 * no^2));
Ki(i) = (w(i)^2 * (no * de + ne * do) * cos(h) - w(i) * (ne * de + w(i)^2 * no * do) * sin(h)-( Kd * w(i)^2 * (ne^2 + w(i)^2 * no^2))) / (-a*((ne^2) + w(i)^2 * no^2));
end
figure;
plot(Kp,Ki,'red');
xlabel('Kp');
ylabel('Ki');
title('Kp vs Ki');
grid on;
%% stability boundry condn for phase margin
clc
clear all;
close all;

sys=tf([1488.4], [1 0 -930.25])
no = 0;  
ne = 1488.4;  
do = 0;
a=2.5;
 w = 0:20; 
% Preallocate matrix for Kp
Kp = zeros(length(w), 1);
Ki = zeros(length(w), 1);
Kd=0.05;
% Calculate Kp Ki for each value of w
for i = 1:length(w)
    de=-w(i)^2-930.25;
    h=w(i)*0.1;
Kp(i) = ((w(i)^2 * no * do + ne * de) * cos(h) + w(i) * (no * de - ne * do) * sin(h)) / (-a*((ne^2) + w(i)^2 * no^2));
Ki(i) = (w(i)^2 * (no * de + ne * do) * cos(h) - w(i) * (ne * de + w(i)^2 * no * do) * sin(h)-( Kd * w(i)^2 * (ne^2 + w(i)^2 * no^2)))  / (-a*((ne^2) + w(i)^2 * no^2));
end
figure;
plot(Ki,Kp);
xlabel('Kp');
ylabel('Ki');
title('Kp vs Ki');
grid on;

%%
