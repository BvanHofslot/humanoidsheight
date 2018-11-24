function dqdt = qfuna(t,q)

g = 9.81;

x = q(1);
dx = q(2);
z = q(3);
dz = q(4);

e=0.0001;

a=5;
zmax=1.1;
if((z+0.5*(dz^2)/a)>zmax && a>0)
    a = -5;
elseif(dz<0)
    a=0;
end

if(x>0)
    x=0;
end

u = (g + a)/z;
ddx = u*x;
ddz = a;


dqdt = [dx;ddx;dz;ddz];
end