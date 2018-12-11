set(groot,'defaulttextinterpreter','latex'); 
%[dx,a]=meshgrid(0:0.1:1.5,0:0.1:0.5);
dx=1
a=[0:0.01:1]
zmin = 1-a;
dzmin = a;


xcpminz = (sqrt(2.*dzmin./g) + zmin./(sqrt(zmin*g)+sqrt(2*g*dzmin))).*dx;


dzmax = a;
xcpmaxz = 1.*(sqrt(2*dzmax)+sqrt(1+a)).*dx...
    ./(sqrt(g)*(1+2.*dzmax+sqrt(2.*(1+a).*dzmax)));

figure;
plot(xcpminz,1-a);
hold on;
plot(xcpmaxz,1+a);
axis([0 0.5 0 2])
% surf(dx,1-a,xcpminz)
% hold on;
% surf(dx,1+a,xcpmaxz)
% xlabel('$\dot{x}$');
% ylabel('$\delta z$');
% zlabel('$x_{cp}$');
% view(-45,150)
% camup([0 1 0])