vec(1,:) = [-0.18672 0.6398 1.0815 -0.06219];
vec(2,:) = [0.0 1 1 0];
vec(3,:) = [-0.45 1 1 0];
vec(4,:) = [-0.3 1 1 0];


i = 2;
k = 3;

zf = 1;
zf2 = 1;
zf3 = 0.8;
dxf= 0;

g = 9.81;
z0 = vec(i,3); 
dz0 = vec(i,4);
dx0 = vec(i,2);
ksi0 = dx0*sqrt(z0/9.81);
x0 = vec(i,1);
x0ksi = -ksi0;

z02 = vec(k,3); 
dz02 = vec(k,4);
dx02 = vec(k,2);
ksi02 = dx02*sqrt(z02/9.81);
x02 = vec(k,1);
x0ksi2 = -ksi02;

tspan = [0 500];
[t,y] =ode45(@qfunbal, tspan, [x0;dx0;z0;dz0]);

figure;
plot(y(:,1),y(:,3))
axis([-0.2 0.5 0 2]);