clc, clearvars, close all;
% ritual to remove all the previous terminal output, vars, plots

f = xlsread('open-loop-jan-24-correct.xlsx', 'Sheet1', 'B2:B183');
n = size(f,1);
t = xlsread('open-loop-jan-24-correct.xlsx', 'Sheet1', 'A2:A183');

time_gap = 5;
[m, c, inflexion_point_idx] = findInflex(f, n, time_gap);
% m = inflex_slope
% c = inflex_yIntercept

% plotting
% main data
plot(t,f);
hold on;
% inflexion line
x = [ (f(1)-c)/m, (f(n)-c)/m ]; % T2 = x(1), T1 = x(2) - x(1)
y = m*x + c;
plot(x, y);
hold on;
% ambient line
plot( [0, (f(1)-c)/m], [f(1), f(1)] );
hold on;
% steady state line
plot( [(f(n)-c)/m, t(end)], [f(n), f(n)] );
hold on;
plot( time_gap*(inflexion_point_idx - 1), f(inflexion_point_idx) , 'g*');
title('Open loop response');
xlabel('time in s');
ylabel('temperature in degree C');

% const calculation
input_volts = 0.5;
K = ( f(n) - f(1) )/input_volts;
T2 = x(1);
T1 = x(2) - x(1);

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

% Writing to a file
fileID = fopen('open_loop_const.txt', 'w');
fprintf(fileID, '%f\n%f\n%f\n%f\n%f\n%f\n', K, x(2), x(1), K_p, K_i, K_d);
fclose(fileID);
