open_loop_script; % it generates system_tf_parameters.txt file
clc, clearvars, close all; % ritual to erase all the previous terminal message, vars, plots
fileID = fopen('system_tf_parameters.txt', 'r');
parameters = fscanf(fileID, '%f');
K = parameters(1);
T1 = parameters(2);
T2 = parameters(3);
fclose(fileID);

% p setting
K_p = ( 0.9*T1 )/( K*T2 );
K_pmax = 0.2;
p = (K_p/K_pmax);

% i setting
K_i = 1/( 3.3*T2 );
K_imax = 1/28;
i = K_i/K_imax;

% temperature setpoint
set_val = 60;

% load data
f = xlsread('pi-control-data.xlsx', 'Sheet1', 'B2:B70');
t = xlsread('pi-control-data.xlsx', 'Sheet1', 'A2:A70');

% Plot dataset
plot(t,f);  % main plot
hold on;
plot([t(1), t(end)], [f(1), f(1)]); % ambient temperature
hold on;
plot([t(1), t(end)], [set_val, set_val]);   % temperature setpoint
xlabel('Time (s)');
ylabel('Temperature (°C)');
title('PI control response');
legend("System response", "Ambient temperature", "Temperature setpoint", 'Location', 'best');

% peak overshoot computation
peak_overshoot = ( max(f) - f(60) )*100/f(60);
