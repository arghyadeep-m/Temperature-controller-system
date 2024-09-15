% fetching data of system parameters
open_loop_plot;
clc, clearvars, close all; % ritual to erase all the previous terminal message, vars, plots
fileID = fopen('open_loop_const.txt', 'r');
parameters = fscanf(fileID, '%f');
K = parameters(1);
T1 = parameters(2);
T2 = parameters(3);
fclose(fileID);

% p setting
K_p = ( 1.2*T1 )/( K*T2 );
K_pmax = 0.2;
p = (K_p/K_pmax);

% i setting
K_i = 1/( 2*T2 );
K_imax = 1/28;
i = K_i/K_imax;

% d setting
K_d = 0.5*T2;
K_dmax = 23.5;
d = K_d/K_dmax;

% temperature setpoint
set_val = 60;

% load data
f = xlsread('pid-control-jan24.xlsx', 'Sheet1', 'B2:B63');
t = xlsread('pid-control-jan24.xlsx', 'Sheet1', 'A2:A63');

% Plot dataset
plot(t,f);
hold on;
plot([t(1), t(end)], [f(1), f(1)]);
hold on;
plot([t(1), t(end)], [set_val, set_val]);
xlabel('Time in s');
ylabel('Temperature in degree C');
title('PID control - Jan 2024');

% peak overshoot computation
peak_overshoot = ( max(f) - f(end) )*100/f(end);