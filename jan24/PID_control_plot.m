clc, clearvars, close all;
% ritual to erase all the previous terminal message, vars, plots

% load data
f = xlsread('pid-control-jan24.xlsx', 'Sheet1', 'B2:B63');
t = xlsread('pid-control-jan24.xlsx', 'Sheet1', 'A2:A63');

set_val = 60;

peak_overshoot = ( max(f) - f(end) )*100/f(end);

% plot curve
plot(t,f);
hold on;
plot([t(1), t(end)], [f(1), f(1)]);
hold on;
plot([t(1), t(end)], [set_val, set_val]);
xlabel('Time in s');
ylabel('Temperature in degree C');
title('PID control');