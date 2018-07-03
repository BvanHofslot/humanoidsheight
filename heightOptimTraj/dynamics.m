function dq = dynamics(q,u,p)
% dx = dynamics(x,u,p)
%
% Computes the dynamics for the simple pendulum
%

x = q(1,:);
z = q(2,:);
dx = q(3,:);
dz = q(4,:);

g = p.g;    m = p.m;
ddx = (x/m).*u;
ddz = -g + (z/m).*u;
dq = [dx;dz;ddx;ddz];
end