function dqdt = qfunfake(t,q, c0, c1, c2, c3)

g = 9.81;

x = q(1);
dx = q(2);
z = q(3);
dz = q(4);

u = (g+(2*c2+6*c3*x)*dx^2)/(c0-c2*x^2-2*c3*x^3);

ddx = x*u;
ddz = -g + z*u;



dqdt = [dx;ddx;dz;ddz];
end

