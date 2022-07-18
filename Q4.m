syms u v 
x = @(u,v) (9 + 7.*cos(v)).*cos(u);
y = @(u,v) (9 + 7.*cos(v)).*sin(u);
z = @(u,v) 2.*sin(v);
rux = diff(x,u);
ruy = diff(y,u);
ruz = diff(z,u);
rvx = diff(x,v);
rvy = diff(y,v);
rvz = diff(z,v);

ru = [rux,ruy,ruz];
rv = [rvx,rvy,rvz];
dS = norm(cross(ru,rv));
dS
% Copied dS in function f and added element wise operators
f = @(u,v) (abs(7.*cos(u).^2.*sin(v).*(7.*cos(v) + 9) + 7.*sin(u).^2.*sin(v).*(7.*cos(v) + 9)).^2 + 4.*abs(cos(u).*cos(v).*(7.*cos(v) + 9)).^2 + 4.*abs(cos(v).*sin(u).*(7.*cos(v) + 9)).^2).^(1/2);
integral2(f,0,2*pi,0,2*pi)

