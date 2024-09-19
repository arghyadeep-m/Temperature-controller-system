clc, clearvars, close all;
% ritual to erase all the previous terminal message, vars, plots

set_val = 60;

% load dataset 1
f1 = xlsread('on-off-control-low-hyst-data.xlsx', 'Sheet1', 'B2:B70');
t1 = xlsread('on-off-control-low-hyst-data.xlsx', 'Sheet1', 'A2:A70');

% load dataset 2
f2 = xlsread('on-off-control-high-hyst-data.xlsx', 'Sheet1', 'B2:B107');
t2 = xlsread('on-off-control-high-hyst-data.xlsx', 'Sheet1', 'A2:A107');

% Plot dataset 1
figure;
plot(t1, f1);   % main plot
ylim([20 80]);
hold on;
plot([t1(1), t1(end)], [f1(1),f1(1)]);  % ambient temperature
hold on;
plot([t1(1), t1(end)], [set_val,set_val]);  % temperature setpoint
xlabel('Time (s)');
ylabel('Temperature (°C)');
title('ON-OFF control - Low hysteresis')
legend("System response", "Ambient temperature", "Temperature setpoint", 'Location', 'best');

% Plot dataset 2
figure;
plot(t2, f2);   % main plot
ylim([20 80]);
hold on;
plot([t2(1), t2(end)], [f2(1), f2(1)]);  % ambient temperature
hold on;
plot([t2(1), t2(end)], [set_val,set_val]);  % temperature setpoint
xlabel('Time (s)')
ylabel('Temperatue (°C)')
title('ON-OFF control - High hysteresis')
legend("System response", "Ambient temperature", "Temperature setpoint", 'Location', 'best');
