%: Read the excel file using readtable function
rawTable = readtable('open loop.xlsx','Sheet','Sheet1');
x = rawTable.TimeInSeconds; %: get the excel column, Header1 (header name)
y = rawTable.TemperatureInDegC; %: get the excel column, Header2 (header name)
figure;
plot(x,y)
xlabel('Time in Seconds');
ylabel('Temperature in deg C');
grid;
%inflection_idx = find(diff(sign(diff(y)))) + 1

hold on;

% Define the slope and point
slope = 0.2;
x0 = 90;
y0 = 47.3;

% Generate x-values for the line
x = linspace(0, 200, 10); % Adjust the range as needed

% Calculate the corresponding y-values using the point-slope formula
y = slope * (x - x0) + y0;

% Create the plot
plot(x, y, 'r'); % 'b' for blue color, you can change it to any color you prefer

% Add labels and title
xlabel('X-axis');
ylabel('Y-axis');
title('Straight Line with Slope 0.2 through (90, 47.3)');

% Optionally, you can add a grid
grid on;

% Optionally, set axis limits if needed
% axis([xmin, xmax, ymin, ymax]);

ii = [1:4 5:10:length(x)];
x1 = x(ii);
y1 = y(ii);
t1 = [0; cumsum(hypot(diff(x1),diff(y1)))];    % arc-length (parameter for interpolation)
t2 = linspace(0,t1(end),100);                  % new arc-length
x2 = spline(t1,x1,t2);
y2 = spline(t1,y1,t2);
dy = diff(y2)./diff(x2);                       % first derivative
d2y = diff(y2,2)./diff(x2(2:end)).^2;          % second derivative
kk = d2y./(1+dy(2:end).^2).^(3/2);             % curvature (1/r