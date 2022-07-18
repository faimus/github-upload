% Q1
[x,y] = meshgrid(-1:0.02:1, -1:0.02:1); % 101 points
f = @(x,y)3*(1-3*x).^2.*exp(-x.^2 - (3*y+1).^2) ...
- 10*(3*x/5 - 27*x.^3 - 243*y.^5).*exp(-2*x.^2-9*y.^2) ...
- 1/3*exp(-(3*x+1).^2 - 9*y.^2) + (x.^2+y.^2) - 1;

contourf(x,y,f(x,y),20);
colorbar
title('Faisal Mustafa 000641779');

[x,y] = meshgrid(-1:0.1:1, -1:0.1:1); % 21 points 

SDX = @(x,y) -(18*(1-3*x)).*exp(-x.^2-(3*y+1).^2) ...
- 6*(1-3*x).^2.*x.*exp(-x.^2-(3*y+1).^2) ...
- (10*(3/5-81*x.^2)).*exp(-2*x.^2-9*y.^2) ...
+ (20*((3/5)*x-27*x.^3-243*y.^5)).*2.*x.*exp(-2*x.^2-9*y.^2) ...
- (1/3*(-18*x-6)).*exp(-(3*x+1).^2-9*y.^2)+2*x;

SDY = @(x,y) 3*(1-3*x).^2.*(-18*y-6).*exp(-x.^2-(3*y+1).^2) ...
+ 12150*y.^4.*exp(-2*x.^2-9*y.^2) ...
+ (20*((3/5)*x-27*x.^3-243*y.^5)).*9.*y.*exp(-2*x.^2-9*y.^2) ...
+ 6*y.*exp(-(3*x+1).^2-9*y.^2)+2*y;

hold on;
quiver(x,y,SDX(x,y),SDY(x,y),'k')
hold off;

% Q2

x0 = [0.46;-0.25];
tDomain = 0:0.001:5;
rprime = @(t,x) [-SDX(x(1),x(2));-SDY(x(1),x(2))];
[t r] = ode45(rprime,tDomain,x0);
f(r(end,1),r(end,2)) % 2(a)
r(end,:)             % 2(b)

% Q3

hold on;
plot(r(1:2,1),r(1:2,2),'w','LineWidth',2)
plot(r(3:end,1),r(3:end,2),'k','LineWidth',2)
hold off;

% Q4
% Pythagoras' theorem on a curve to calculate arclength (approximation)
streamlength = 0.0;
for i=1:5000
    streamlength = streamlength + sqrt( (r(i+1,1)-r(i,1))^2 + (r(i+1,2)-r(i,2))^2 + (f(r(i+1,1),r(i+1,2))-f(r(i,1),r(i,2)))^2);
end
streamlength

% Q5
% Pythagoras' theorem 3 dim x(5)-x(1),y(5)-y(1),z(5)-z(1)
pipelength = sqrt((r(end,1)-r(1,1))^2 + (r(end,2)-r(1,2))^2 + (f(r(end,1),r(end,2))-f(r(1,1),r(1,2)))^2);
pipelength

% Q6
% Height is calculated as f(5) - f(1); Basically the difference between
% last and first element of z
pipeheight = abs(f(r(end,1),r(end,2))-f(r(1,1),r(1,2)));
pipeheight



