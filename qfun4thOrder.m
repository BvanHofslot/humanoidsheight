function dqdt = qfun4thOrder(t,q)

g = 9.81;
x0 = q(1);
dx0 = q(2);
z0 = q(3);
dz0 = q(4);

zf = 1.0;
dzf = 0;
dxf= 0;


u = (dx0.*(20*(dx0.^4)*z0.^2 - 40.*(dx0.^3)*dz0.*x0.*z0 - 20*(dx0.^2).*(dxf.^2).*zf.^2 + 20*(dx0.^2).*(dz0.^2)*(x0.^2) - 8*(dx0.^2)*g*(x0.^2).*z0 - 12*(dx0.^2)*g*(x0.^2).*zf + 10*dx0.*dz0.*g.*x0.^3 + (g^2)*x0.^4))/((x0.^2)*(- 30*(dx0.^3).*x0.*z0.^2 + 30.*(dx0.^3).*(z0.^2) + 60*(dx0.^2).*dz0.*(x0^2).*z0 - 60*(dx0.^2).*dz0.*x0.*z0 + 30*dx0.*(dxf.^2).*x0.*zf.^2 - 30*dx0.*(dxf.^2).*zf.^2 - 30*dx0.*(dz0.^2).*x0.^3 + 30*dx0.*(dz0.^2).*(x0.^2) + 3*g.*dx0.*(x0^3).*z0 + 27*g.*dx0.*(x0.^3).*zf - 2*g*dx0.*(x0.^2).*z0 - 27*g*dx0.*(x0.^2).*zf - 9*g*dz0.*(x0.^4) + 8*g*dz0.*(x0.^3)));
u = max(0,u);

ddx0 = x0*u;
ddz0 = -g + z0*u;

dqdt = [dx0;ddx0;dz0;ddz0];
end