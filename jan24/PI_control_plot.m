clc, clearvars, close all;
% ritual to erase all the previous terminal message, vars, plots

% load data
f = xlsread('pi-control-jan24.xlsx', 'Sheet1', 'B2:B70');
t = xlsread('pi-control-jan24.xlsx', 'Sheet1', 'A2:A70');

set_val = 60;

peak_overshoot = ( max(f) - f(60) )*100/f(60);

% plot curve
plot(t,f);
hold on;
plot([t(1), t(end)], [f(1), f(1)]);
hold on;
plot([t(1), t(end)], [set_val, set_val]);
xlabel('Time in s');
ylabel('Temperature in degree C');
title('PI control');