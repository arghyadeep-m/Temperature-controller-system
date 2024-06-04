%: Read the excel file using readtable function
rawTable = readtable('open loop.xlsx','Sheet','Sheet1');
x = rawTable.TimeInSeconds; %: get the excel column, Header1 (header name)
y = rawTable.TemperatureInDegC; %: get the excel column, Header2 (header name)
figure;
plot(x,y)
xlabel('Time in Seconds');
ylabel('Temperature in deg C');
grid;

% Fit a polynomial curve to the data
degree = 4;  % Adjust the degree as needed
coefficients = polyfit(x, y, degree);
fitted_curve = polyval(coefficients, x);

% Calculate the second derivative of the fitted curve
second_derivative = diff(coefficients) .* (degree:-1:1);

% Find the inflection points (zero-crossings)
inflection_points_x = roots(second_derivative);

% Evaluate the fitted curve at the inflection points to get y-values
inflection_points_y = polyval(coefficients, inflection_points_x);

% Plot the data and inflection points
plot(x, y, 'b', x, fitted_curve, 'r');
hold on;
scatter(inflection_points_x, inflection_points_y, 'go');
legend('Data', 'Fitted Curve', 'Inflection Points');
xlabel('Time in Seconds');
ylabel('Temperature in deg C');
title('Inflection Points');
