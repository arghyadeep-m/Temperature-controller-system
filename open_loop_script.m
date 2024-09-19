clc, clearvars, close all;
% ritual to remove all the previous terminal output, vars, plots

f = xlsread('open-loop-response-data.xlsx', 'Sheet1', 'B2:B183');
n = size(f,1);
t = xlsread('open-loop-response-data.xlsx', 'Sheet1', 'A2:A183');

time_gap = 5;
[m, c, inflection_point_idx] = findInflect(f, n, time_gap);
% m = inflect_slope
% c = inflect_yIntercept

% plotting
% main data
plot(t,f);
hold on;
% inflection line
x = [ (f(1)-c)/m, (f(n)-c)/m ]; % T2 = x(1), T1 = x(2) - x(1)
y = m*x + c;
plot(x, y);
hold on;
% ambient line
plot([t(1), t(end)], [f(1) f(1)]);
hold on;
% steady state line
plot([t(1), t(end)], [f(end) f(end)]);
hold on;
% point of inflection
plot( time_gap*(inflection_point_idx - 1), f(inflection_point_idx) , 'g*');
% title, labels, legend to plot
title('Open loop response');
xlabel('Time (s)');
ylabel('Temperature (°C)');
legend("System response", "Inflectional tangent", "Ambient temperature", "Steady state temperature", "Point of inflection", 'Location', 'best');

% const calculation
input_volts = 0.5;
K = ( f(n) - f(1) )/input_volts;
T2 = x(1);
T1 = x(2) - x(1);

% Writing to a file
fileID = fopen('system_tf_parameters.txt', 'w');
fprintf(fileID, '%f\n%f\n%f\n', K, T1, T2);
fclose(fileID);
