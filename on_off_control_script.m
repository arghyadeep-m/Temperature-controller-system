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
plot(t1, f1);
ylim([20 80]);
hold on;
plot([t1(1), t1(end)], [f1(1),f1(1)]);
hold on;
plot([t1(1), t1(end)], [set_val,set_val]);
xlabel('Time in s');
ylabel('Temperature in degree C');
title('ON-OFF control - Low hysteresis')

% Plot dataset 2
figure;
plot(t2, f2);
ylim([20 80]);
hold on;
plot([t2(1), t2(end)], [f2(1), f2(1)]);
hold on;
plot([t2(1), t2(end)], [set_val,set_val]);
xlabel('Time in s')
ylabel('Temperatue in degree C')
title('ON-OFF control - High hysteresis')