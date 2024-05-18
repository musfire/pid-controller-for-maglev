%% Kp vs Ki
clc
close all;
num = [1488.4];
den = [1 0 -930.25];
ne = 1488.4;
w_values = 0:0.01:20;
de = zeros(1, length(0:0.01:w_values));
Kp = zeros(1, length(0:0.01:w_values));
Ki = zeros(1, length(0:0.01:w_values));
Kp1 = zeros(1, length(0:0.01:w_values));
Ki1 = zeros(1, length(0:0.01:w_values));
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
Kp(i) = (ne * de(i) * cos(w*0)) / (-(ne^2));
Ki(i) = ((- w *(ne * de(i)) * sin(w*0)) - (0 * w^2 *ne^2)) / (-(ne^2));
end
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
Kp1(i) = (ne * de(i) * cos(w*0)) / (-(ne^2));
Ki1(i) = ((- w *(ne * de(i)) * sin(w*0)) - (0.5 * w^2 *ne^2)) / (-(ne^2));
end
x=0.7;
y=0:100;
figure;
plot(Kp,Ki);
hold all
plot(Kp1,Ki1);
line([x x],[y(1) y(end)],'LineWidth',1)
xlabel('Kp');
ylabel('Ki');
title('Kp vs Ki');
grid on;

%% Kp vs Kd
clc
close all;
num = [1488.4];
den = [1 0 -930.25];
ne = 1488.4;
w_values = 13:13.9;
de = zeros(1, length(0:w_values));
Kp = zeros(1, length(0:w_values));
Kd = zeros(1, length(0:w_values));
Kp1 = zeros(1, length(0:w_values));
Kd1 = zeros(1, length(0:w_values));
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
Kp(i) = (ne * de(i) * cos(w*0)) / (-(ne^2));
Kd(i) = ((- w *(ne * de(i)) * sin(w*0)) + (0.1*ne^2)) / (w^2*ne^2);
end
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
Kp1(i) = (ne * de(i) * cos(w*0)) / (-(ne^2));
Kd1(i) = ((- w *(ne * de(i)) * sin(w*0)) + (0.5*ne^2)) / (w^2*ne^2);
end
figure;
plot(Kp,Kd,'black');
hold all
plot(Kp1,Kd1,'red');
xlabel('Kp');
ylabel('Kd');
title('Kp vs Kd');
grid on;

%% Ki vs Kd
clc
close all;
num = [1488.4];
den = [1 0 -930.25];
ne = 1488.4;
de = zeros(1, length(0:0.01:3.2));
Kd = zeros(1, length(0:0.01:3.2));
Ki = zeros(1, length(0:0.01:3.2));
Kp=0;
w_values = 0:0.01:3.2;
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
Ki(i) = ((- w *(ne * de(i)) * sin(w*0.1)) - (Kd(i) * w^2 *ne^2)) / (-(ne^2));
Kd(i) = ((- w *(ne * de(i)) * sin(w*0.1)) + (Ki(i)*ne^2)) / (w^2*ne^2);
end
figure;
plot(Ki,Kd);
xlabel('Ki');
ylabel('Kd');
title('Ki vs Kd');
grid on;

%% 3d for first two graphs
clc
close all;
ne = 1488.4;
de = zeros(1, length(0:0.01:3.2));
Kp = zeros(1, length(0:0.01:3.2));
Ki = zeros(1, length(0:0.01:3.2));
Kd = zeros(1, length(0:0.01:3.2));
Kp1 = zeros(1, length(0:0.01:3.2));
Ki1 = zeros(1, length(0:0.01:3.2));
Kd1 = zeros(1, length(0:0.01:3.2));
w_values = 0:0.01:3.2;
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
Kp(i) = (ne * de(i) * cos(w*0.1)) / (-(ne^2));
Ki(i) = ((- w *(ne * de(i)) * sin(w*0.1)) - (0.03 * w^2 *ne^2)) / (-(ne^2));
Kd(i) = ((- w *(ne * de(i)) * sin(w*0.1)) + (Ki(i)*ne^2)) / (w^2*ne^2);
end
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
Kp1(i) = (ne * de(i) * cos(w*0.1)) / (-(ne^2));
Ki1(i) = ((- w *(ne * de(i)) * sin(w*0.1)) - (0.05 * w^2 *ne^2)) / (-(ne^2));
Kd1(i) = ((- w *(ne * de(i)) * sin(w*0.1)) + (Ki1(i)*ne^2)) / (w^2*ne^2);
end
plot3(Kp,Ki,Kd,'red');
hold on
plot3(Kp1,Ki1,Kd1,'black');
xlabel('Kp');
ylabel('Ki');
zlabel('Kd')
title('Kp vs Ki vs Kd');
grid on;

%% phase gain for a=1 and phi=45 Kp vs Ki
clc
close all;
num = [1488.4];
den = [1 0 -930.25];
ne = 1488.4;
w_values = 0:0.1:7.5;
de = zeros(1, length(0:0.01:w_values));
Kp = zeros(1, length(0:0.01:w_values));
Kp1 = zeros(1, length(0:0.01:w_values));
Ki = zeros(1, length(0:0.01:w_values));
Ki1 = zeros(1, length(0:0.01:w_values));
Kp2 = zeros(1, length(0:0.01:w_values));
Kp3 = zeros(1, length(0:0.01:w_values));
Ki2 = zeros(1, length(0:0.01:w_values));
Ki3 = zeros(1, length(0:0.01:w_values));
A = 10^(6/20);
A1 = 10^(10/20);
p=45*pi/180;
p1=80*pi/180;
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
    h=w*0.8+p;
Kp(i) = (ne * de(i) * cos(h)) / (-(ne^2));
Ki(i) = ((- w *(ne * de(i)) * sin(h)) - (0 * w^2 *ne^2)) / (-(ne^2));
end
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
    h=w*0.8;
Kp1(i) = (ne * de(i) * cos(h)) / (-A*(ne^2));
Ki1(i) = ((- w *(ne * de(i)) * sin(h)) - (0 * w^2 *ne^2)) / (-A*(ne^2));
end
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
    h=w*0.8+p1;
  Kp2(i) = (ne * de(i) * cos(h)) / (-(ne^2));
Ki2(i) = ((- w *(ne * de(i)) * sin(h)) - (0 * w^2 *ne^2)) / (-(ne^2));
end
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
    h=w*0.8;
Kp3(i) = (ne * de(i) * cos(h)) / (-A1*(ne^2));
Ki3(i) = ((- w *(ne * de(i)) * sin(h)) - (0 * w^2 *ne^2)) / (-A1*(ne^2));
end
figure;
x=0.2;
y=0:5;
x1=0:10;
y1=0;
plot(Kp,Ki,'red');
hold all
plot(Kp1,Ki1,'black')
plot(Kp2,Ki2)
plot(Kp3,Ki3,'green')
line([x x],[y(1) y(end)],'LineWidth',1)
%line([x1(1) x1(end)],[y1 y1],'LineWidth',1)
xlabel('Kp');
ylabel('Ki');
title('Kp vs Ki');
grid on;

%% Kp vs Kd for phase gain
clc
close all;
num = [1488.4];
den = [1 0 -930.25];
ne = 1488.4;
w_values = 0:7.5;
de = zeros(1, length(0:0.01:w_values));
Kp = zeros(1, length(0:0.01:w_values));
Kp1 = zeros(1, length(0:0.01:w_values));
Kd = zeros(1, length(0:0.01:w_values));
Kd1 = zeros(1, length(0:0.01:w_values));
Kp2 = zeros(1, length(0:0.01:w_values));
Kp3 = zeros(1, length(0:0.01:w_values));
Kd2 = zeros(1, length(0:0.01:w_values));
Kd3 = zeros(1, length(0:0.01:w_values));
A = 10^(6/20);
A1 = 10^(10/20);
p=45*pi/180;
p1=80*pi/180;
for i = 1:length(w_values)
    w = w_values(i);
    h=w*0.8+p;
    de(i)=-w^2-930.25;
Kp(i) = (ne * de(i) * cos(h)) / (-(ne^2));
Kd(i) = ((- w *(ne * de(i)) * sin(h)) + (1*ne^2)) / (w^2*ne^2);
end
for i = 1:length(w_values)
    w = w_values(i);
   h=w*0.8;
    de(i)=-w^2-930.25;
Kp1(i) = (ne * de(i) * cos(h)) / (-A*(ne^2));
Kd1(i) = ((- w *(ne * de(i)) * sin(h)) + (1*ne^2)) / (A*w^2*ne^2);
end
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
    h=w*0.8+p1;
  Kp2(i) = (ne * de(i) * cos(h)) / (-(ne^2));
Kd2(i) = ((- w *(ne * de(i)) * sin(h)) + (1 *ne^2)) / (-(ne^2));
end
for i = 1:length(w_values)
    w = w_values(i);
    de(i)=-w^2-930.25;
    h=w*0.8;
  Kp3(i) = (ne * de(i) * cos(h)) / (-A1*(ne^2));
Kd3(i) = ((- w *(ne * de(i)) * sin(h)) + (1 *ne^2)) / (-A1*(ne^2));
end
figure;
x=0.2;
y=-0.6:2.5;
plot(Kp,Kd,'black');
hold all
plot(Kp1,Kd1,'red')
plot(Kp2,Kd2,'green')
plot(Kp3,Kd3)
line([x x],[y(1) y(end)],'LineWidth',1)
xlabel('Kp');
ylabel('Kd');
title('Kp vs Kd');
grid on;