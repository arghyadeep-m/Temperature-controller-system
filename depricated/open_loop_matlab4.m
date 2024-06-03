%A = xlsread('data.xlsx');
%x = A(:,1);
%y = A(:,2);
ii = [1:4 5:10:length(x)];
x1 = x(ii);
y1 = y(ii);
t1 = [0; cumsum(hypot(diff(x1),diff(y1)))];    % arc-length (parameter for interpolation)
t2 = linspace(0,t1(end),100);                  % new arc-length
x2 = spline(t1,x1,t2);
y2 = spline(t1,y1,t2);
dy = diff(y2)./diff(x2);                       % first derivative
d2y = diff(y2,2)./diff(x2(2:end)).^2;          % second derivative
kk = d2y./(1+dy(2:end).^2).^(3/2);             % curvature (1/r)
plot(x,y,'.b')
hold on
plot(x2,y2,'.-r')
plot(x2(2:end-1),kk*1e6,'.-g')
hold off
legend('original data','spline','curvature','location','northwest')