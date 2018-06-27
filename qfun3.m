function dqdt = qfun3(t,q)

g = 9.81;

x = q(1);
dx = q(2);
z = q(3);
dz = q(4);

zf = 1.1;
dxf= 0;

a = dx/x;
b = dz - a*z;
u = -7*a^2 + (3*zf*a^3-g*a)/b -(10*(a^3)*b)/g + (10*(a^3)*(dxf^2)*zf^2)/(b*g*x^2);
u = max(0,u);

ddx = x*u;
ddz = -g + z*u;

dqdt = [dx;ddx;dz;ddz];
end