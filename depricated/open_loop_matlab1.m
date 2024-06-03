%: Read the excel file using readtable function
rawTable = readtable('open loop.xlsx','Sheet','Sheet1');
x = rawTable.TimeInSeconds; %: get the excel column, Header1 (header name)
y = rawTable.TemperatureInDegC; %: get the excel column, Header2 (header name)
figure;
plot(x,y)
xlabel('Time in Seconds');
ylabel('Temperature in deg C');
grid;