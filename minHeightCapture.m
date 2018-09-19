x0=-0.286178;
dx0= 1-0.400854;
z0=1;
dz0 = 1.40071;
t = 0.1427839;
x_orbit=dx0*t;


tspan = [0:0.00001:t];
x = x0+dx0*tspan;
z = z0+dz0*tspan -0.5*9.81*tspan.^2;

figure;
plot([-0.5,0],[1 1]*1.1);
hold on;
plot([1 1]*-x0,[0 2]);
plot(x,z)
axis([-0.5 0.0 0.0 1.2])
circle(0,0,1.118);
tspan=[0:0.0001:100];
[t,y] =ode45(@qfun, tspan, [-0.3;1;1;0]);
hold on;
axis([-1 0 0 2])
plot(y(:,1),y(:,3));
legend('heightconstraint','minheightcapture','leglengthconstraint','Twan')