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

% if(a>0)
%     t1=sqrt(2*(zmax-1)/(ddz+(ddz^2)/a));
%     t2=t1+t1*ddz/a;
% else 
%     t1=sqrt((zmin-1)/a);
%     t2=2*t1;
% end
% 
% if(t>t2)
%     ddz=0;
% elseif(t>t1)
%     ddz=-a;
% end

if(((z+0.5*(dz^2)/a)>zmax-0.002 && (dz>0))||((z+0.5*(dz^2)/a)<zmin+0.002 && (dz<0)))
    ddz = -a;
elseif((z>(zmax+z)/2 || z<(z+zmin)/2) && dz<0.0001)
    ddz=0;
end



u = (g + ddz)/z;
ddx = u*x;
ddz = ddz;


dqdt = [dx;ddx;dz;ddz];
end