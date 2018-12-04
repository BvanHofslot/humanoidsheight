function dqdt = penDynFcn(t,q,a,zmin,zmax)

g = 9.81;

x = q(1);
dx = q(2);
z = q(3);
dz = q(4);

ddz=a;
if(a>g)
        a=9.81;
end

if(((z+0.5*(dz^2)/a)>zmax && (dz>0))||((z+0.5*(dz^2)/a)<zmin && (dz<0)))
    ddz = -a;
elseif((abs(zmax-z)<0.001 || abs(zmin-z)<0.001))
    ddz=0;
end


u = (g + ddz)/z;
ddx = u*x;
ddz = ddz;


dqdt = [dx;ddx;dz;ddz];
end