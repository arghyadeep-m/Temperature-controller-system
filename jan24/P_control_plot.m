clc, clearvars, close all;
% ritual to erase all the previous terminal message, vars, plots

set_val = 60;

% load dataset
f1 = xlsread('p-control-jan24.xlsx', 'Sheet1', 'B2:B59');
t1 = xlsread('p-control-jan24.xlsx', 'Sheet1', 'A2:A59');

peak_overshoot = ( max(f1) - set_val )*100/set_val;

% Plot dataset
plot(t1, f1);
ylim([20 65]);
hold on;
plot([t1(1), t1(end)], [f1(1),f1(1)]);
hold on;
plot([t1(1), t1(end)], [set_val,set_val]);
xlabel('Time in s');
ylabel('Temperature in degree C');
title('P control - Jan 2024');