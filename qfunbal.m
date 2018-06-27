function dqdt = qfunbal(t,q)

g = 9.81;

x = q(1);
dx = q(2);
z = q(3);
dz = q(4);

ddx = 0;
ddz = -g;

dqdt = [dx;ddx;dz;ddz];
end

