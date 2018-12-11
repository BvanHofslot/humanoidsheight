function dqdt = penDynFcn(t,q,a)

g = 9.81;

x = q(1);
dx = q(2);
z = q(3);
dz = q(4);

ddz=a;

u = (g + ddz)/z;
ddx = u*x;
ddz = ddz;

dqdt = [dx;ddx;dz;ddz];
end