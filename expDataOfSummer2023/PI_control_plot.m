clc, clearvars, close all;
% ritual to erase all the previous terminal message, vars, plots

% load data
f = xlsread('PI-control-points.xlsx', 'Sheet1', 'B1:B60');
t = xlsread('PI-control-points.xlsx', 'Sheet1', 'A1:A60');

set_val = 60;

% plot curve
plot(t,f);
hold on;
plot([t(1), t(end)], [f(1), f(1)]);
hold on;
plot([t(1), t(end)], [set_val, set_val]);
xlabel('Time in s');
ylabel('Temperature in degree C');
title('PI control');