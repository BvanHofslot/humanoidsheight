
function [dqdt, tau] = qfunOptimizationHandwritten(t,q)

g = 9.81;
fstConst= [1 0 0 0];
fstObj =  1;
x = q(1);
dx = q(2);
z = q(3);
dz = q(4);

zf = 1.0;
dxf= 0;

for i=1:100000
k = (1/2)*(dx*z - dz*x)^2 + g*(x^2)*z-0.5*(dxf^2);

A = [fstConst;
    1 x x^2 x^3;
    0 1 2*x 3*x^2;
    (3/2)*g*x^2 g*x^3 (3/4)*g*x^4 (3/5)*g*x^5];
c = inv(A)*[fstObj z dz/dx k]';

c0 = c(1);
c1 = c(2);
c2 = c(3);
c3 = c(4);
c4=0;

xmax1 = (-2*c2+sqrt(4*c2^2-12*c3*c1))/(6*c3);
xmax2 = (-2*c2-sqrt(4*c2^2-12*c3*c1))/(6*c3);
if (xmax1<x)&&(xmax1>0)
    xmax=xmax1;
else
    xmax=xmax2;
end
zmax = c0 + c1*xmax+c2*xmax^2+c3*xmax^3;
if (zmax<1.1)
    break
end
dxf=dxf+0.001;
end


u = (g+2*(c2+6*c3*x+12*c4*x^2)*dx^2)/(c0-c2*x^2-2*c3*x^3-3*c4*x^4);
tau = 10*sqrt(x^2 + z^2)*u;

ddx = x*u;
ddz = -g + z*u;

dqdt = [dx;ddx;dz;ddz];
end
