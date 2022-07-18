u = linspace(0, 2*pi, 40);
v = linspace(0, 2*pi, 40);
[u,v] = meshgrid(u,v);

x = (9 + 7.*cos(v)).*cos(u);
y = (9 + 7.*cos(v)).*sin(u);
z = 2.*sin(v);

surf(x,y,z);
% axis equal;
title('Mobius Strip');
title('Faisal Mustafa 000641779');