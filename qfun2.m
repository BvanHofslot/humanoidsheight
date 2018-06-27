function [dqdt, tau] = qfun2(t,q)

g = 9.81;

x = q(1);
dx = q(2);
z = q(3);
dz = q(4);

zf = 1.0;
dxf= 0;

% a = dx/x;
% b = dz - a*z;
% u = -7*a^2 + (3*zf*a^3-g*a)/b -(10*(a^3)*b)/g; + (10*(a^3)*(dxf^2)*zf^2)/(b*g*x^2);
% u = max(0,u);

k = (1/2)*(dx*z - dz*x)^2 + g*(x^2)*z-0.5*(dxf^2);

A = [0 1 0 0;
    1 x x^2 x^3;
    0 1 2*x 3*x^2;
    (3/2)*g*x^2 g*x^3 (3/4)*g*x^4 (3/5)*g*x^5];
c = inv(A)*[0 z dz/dx k]';

c0 = c(1);
c1 = c(2);
c2 = c(3);
c3 = c(4);
c4=0;

u = (g+2*(c2+6*c3*x+12*c4*x^2)*dx^2)/(c0-c2*x^2-2*c3*x^3-3*c4*x^4);
tau = 10*sqrt(x^2 + z^2)*u;

ddx = x*u;
ddz = -g + z*u;

dqdt = [dx;ddx;dz;ddz];
end
