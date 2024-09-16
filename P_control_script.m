open_loop_script; % it generates system_tf_parameters.txt file
clc, clearvars, close all; % ritual to erase all the previous terminal message, vars, plots
fileID = fopen('system_tf_parameters.txt', 'r');
parameters = fscanf(fileID, '%f');
K = parameters(1);
T1 = parameters(2);
T2 = parameters(3);
fclose(fileID);

% p setting
K_p = ( T1 )/( K*T2 );
K_pmax = 0.2;
p = (K_p/K_pmax);

% temperature setpoint
set_val = 60;

% load dataset
f1 = xlsread('p-control-data.xlsx', 'Sheet1', 'B2:B59');
t1 = xlsread('p-control-data.xlsx', 'Sheet1', 'A2:A59');

% Plot dataset
plot(t1, f1);
ylim([20 65]);
hold on;
plot([t1(1), t1(end)], [f1(1),f1(1)]);
hold on;
plot([t1(1), t1(end)], [set_val,set_val]);
xlabel('Time in s');
ylabel('Temperature in degree C');
title('P control response');

% peak overshoot computation
peak_overshoot = ( max(f1) - set_val )*100/set_val;
