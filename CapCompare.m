set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

%[dx,a]=meshgrid(0:0.1:1.5,0:0.1:0.5);
g=9.81
dx=1
a=[0:0.01:1]
zmin = 1-a;
dzmin = a;
xcp = sqrt(1/g);

xcpminz = (sqrt(2.*dzmin./g) + zmin./(sqrt(zmin*g)+sqrt(2*g*dzmin))).*dx;


dzmax = a;
xcpmaxz = 1.*(sqrt(2*dzmax)+sqrt(1+a)).*dx...
    ./(sqrt(g)*(1+2.*dzmax+sqrt(2.*(1+a).*dzmax)));

figure;
hold on;
% area(xcpminz/xcp,1-a,'FaceColor',0.85*[1 1 1],'LineStyle','none')
% area([xcpmaxz(end) xcp]/xcp,[2 2],'FaceColor',0.85*[1 1 1],'LineStyle','none')
% area(flipud(xcpmaxz)/xcp,1+a,'FaceColor','w','LineStyle','none')
p1=plot(xcpminz/xcp,1-a,'Color','b');
plot(xcpmaxz/xcp,1+a,'Color','b');
a=[0.0:0.02:1]
p2=plot([1 -CPreg2/xcp],1+a,'Color','k','LineStyle','--')
p3=plot([1 -CPreg3/xcp],1+a,'Color','k','LineStyle','-.')
plot([1 -CP1reg4/xcp],1-a,'Color','k','LineStyle','--')
plot([1 -CP1reg3/xcp],1-a,'Color','k','LineStyle','-.')
%plot([xcp xcp]/xcp,[0 2],'Color','k')
 
axis equal
axis([0.5 1.5 0 2])
xlabel("Capture Position x' [-]")
ylabel("$z'_{min} \leftarrow z_0' \rightarrow z'_{max}$ [-]",'FontSize',15)
legend([p1 p2 p3],{'Limit','$\ddot{z}_c=g$','$\ddot{z}_c=2.4$'})
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

