%%

set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

%[dx,a]=meshgrid(0:0.1:1.5,0:0.1:0.5);
g=9.81
x=sqrt(1/9.81);
a=[0:0.01:1]
zmin = 1-a;
dzmin = a;
xcp = sqrt(1/g);

dxcpminz = x./((sqrt(2.*dzmin./g) + zmin./(sqrt(zmin*g)+sqrt(2*g*dzmin))));

x=sqrt(1/9.81);
dzmax = a;
zmax=1+dzmax;
dxcpmaxz=sqrt(g)*(1+2.*dzmax+sqrt(2.*(zmax).*dzmax))*x./(sqrt(2*dzmax)+sqrt(zmax));

figure;
hold on;
p1=plot(dxcpminz,1-a,'Color','b');
plot(dxcpmaxz,1+a,'Color','b');
a=[0.00:0.02:1]
p2=plot([1 dCPthes1],1+a,'Color','k','LineStyle','--')
p3=plot([1 dCPthes],1+a,'Color','k','LineStyle','-.')
plot([1 dCPthes2],1-a,'Color','k','LineStyle','--')
plot([1 dCPthes3],1-a,'Color','k','LineStyle','-.')
plot([xcp xcp]/xcp,[0 2],'Color','k')
 
axis equal
axis([0.5 1.8 0 2])
xlabel("Capture Velocity $\dot{x}'$ [-]")
ylabel("$z'_{min} \leftarrow z_0' \rightarrow z'_{max}$ [-]",'FontSize',15)
legend([p1 p2 p3],{'Bound',"$\ddot{z}_c'=1$","$\ddot{z}_c'=\frac{1}{4}$"})
% xticks([0.5:0.1:1.5])
% yticks([0:0.1:2.0])
grid on;
grid minor;
set(gca,'FontSize',12)
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'caplimits.eps', opts)
% surf(dx,1-a,xcpminz)
% hold on;
% surf(dx,1+a,xcpmaxz)
% xlabel('$\dot{x}$');
% ylabel('$\delta z$');
% zlabel('$x_{cp}$');
% view(-45,150)
% camup([0 1 0])