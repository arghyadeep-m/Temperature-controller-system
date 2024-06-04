clc, clearvars, close all;
% ritual to erase all the previous terminal message, vars, plots

set_val = 60;

% load dataset 1
f1 = xlsread('P-control-points.xlsx', 'Sheet2', 'C1:C40');
t1 = xlsread('P-control-points.xlsx', 'Sheet2', 'B1:B40');

% load dataset 2
f2 = xlsread('P-control-2.xlsx', 'Sheet1', 'B1:B36');
t2 = xlsread('P-control-2.xlsx', 'Sheet1', 'A1:A40');

% Plot dataset 1
subplot(1,2,1);
plot(t1, f1);
ylim([25 65]);
hold on;
plot([t1(1), t1(end)], [f1(1),f1(1)]);
hold on;
plot([t1(1), t1(end)], [set_val,set_val]);
xlabel('Time in s');
ylabel('Temperature in degree C');
title('P control - Dataset 1')

% Plot dataset 2
subplot(1,2,2);
plot(t2, f2);
ylim([25 65]);
hold on;
plot([t2(1), t2(end)], [f2(1), f2(1)]);
hold on;
plot([t2(1), t2(end)], [set_val,set_val]);
xlabel('Time in s')
ylabel('Temperatue in degree C')
title('P control - Dataset 2')