set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

a=[0:0.00001:0.05]
dx = 1.0;
z=1.0;
g =9.81;
dxcmpmax = a;
xcp = sqrt(1/g)*dx;
Theta=(1/2)*pi;
tbang = sqrt((1/6)*Theta./dxcmpmax);
dxcmp = (1-2*exp(-tbang)+exp(-2*tbang)).*dxcmpmax;
dxcmp=dxcmp/xcp;
xcp=1;


% zmin = z-a;
% dzmin = a;
% xcpminz = (sqrt(2*dzmin/g) + zmin/(sqrt(zmin*g)+sqrt(2*g*dzmin)));
% 
% zmax= z+a;
% dzmax = a;
% 
% xcpmaxz = z*(sqrt(2*dzmax)+sqrt(zmax))*dx...
%     /(sqrt(g)*(z+2*dzmax+sqrt(2*zmax*dzmax)));

xoff=0.1;

figure('rend','painters','pos', [0 0 1700 1000]);
yyaxis left
plot(xcp-dxcmp,a);
hold on;
plot(xcp + dxcmp,a,'LineStyle','-.');
r=find(dxcmp > 0.035,1);
str = "$\leftarrow \theta_{max}=\frac{1}{2}\pi$";
text(xcp - dxcmp(r),a(r),str,'FontSize',font)

xcp=sqrt(1/9.81);
Theta=(1/4)*pi;
tbang = sqrt((1/6)*Theta./dxcmpmax);
dxcmp = (1-2*exp(-tbang)+exp(-2*tbang)).*dxcmpmax;
dxcmp=dxcmp/xcp;
xcp=1;
p(1)=plot(xcp-dxcmp,a,'LineStyle','-');
p(2)=plot(xcp + dxcmp,a,'LineStyle','-.');
r=find(dxcmp > 0.025,1);
str = "$\leftarrow \theta_{max}=\frac{1}{4}\pi$";
text(xcp - dxcmp(r),a(r),str,'FontSize',font)

ylabel("$\delta x_{cmp,max}'$",'FontSize',30)
axis([0.85 1.15 0 0.05]);
yyaxis right
ylabel('$\ddot{z}_c$','FontSize',18)

% p(3)=fplot(xcpmaxz,a);
% p(4)=fplot(xcpminz,a,'LineStyle','-.');

xcp=sqrt(1/9.81);
plot([sqrt(1/9.81) -CPreg(1:50)]/xcp,[0:0.1:5],'LineStyle','-'); 
hold on; 
p(3)=plot([sqrt(1/9.81) -CP1reg(1:50)]/xcp,[0:0.1:5],'LineStyle','-.')
str = "$\leftarrow \delta z_{max}=0.065$";
text(-CPreg(20)/xcp,2,str,'FontSize',font)

p(4)=plot([sqrt(1/9.81) -CPreg2(1:50)]/xcp,[0:0.1:5],'LineStyle','-'); 
hold on; plot([-CP1reg2(2:50)]/xcp,[0.2:0.1:5],'LineStyle','-.')
str = "$\leftarrow \delta z_{max}=0.13$";
text(-CPreg2(30)/xcp,2.5,str,'FontSize',font)

axis([0.85 1.15 0 5]);
xlabel("Capture Region $x'$ [-]",'FontSize',18)
legend(p(1:4),{"$x_{cp,lip}-\delta x_{cmp}'$","$x_{cp,lip}+\delta x_{cmp}'$",'$x_{cp,zmax,\ddot{z}_c}$','$x_{cp,zmin,\ddot{z}_c}$'},'FontSize',18,'Location','west')
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(findall(gcf,'-property','FontSize'),'FontSize',40)
set(findall(gcf,'-property','LineWidth'),'LineWidth',3.5)
exportfig(gcf,'capcompare.eps', opts)

%%
Theta=(1/2)*pi;
tbang = sqrt((1/3)*Theta/dxcmpmax);
dxcmp = (1-2*exp(-tbang)+exp(-2*tbang))*dxcmpmax;
p=zeros(1,4);
figure('rend','painters','pos', [0 0 1600 800]);
yyaxis left
p(1)=fplot(xcp-dxcmp,a,'LineStyle','-');
hold on;
fplot(xcp + dxcmp,a,'LineStyle','-');
Theta=(1/3)*pi;
tbang = sqrt((1/3)*Theta/dxcmpmax);
dxcmp = (1-2*exp(-tbang)+exp(-2*tbang))*dxcmpmax;
p(2)=fplot(xcp-dxcmp,a,'LineStyle','-.');
fplot(xcp + dxcmp,a,'LineStyle','-.');
Theta=(1/6)*pi;
tbang = sqrt((1/2)*Theta/dxcmpmax);
dxcmp = (1-2*exp(-tbang)+exp(-2*tbang))*dxcmpmax;
p(3)=fplot(xcp-dxcmp,a,'LineStyle',':');
fplot(xcp + dxcmp,a,'LineStyle',':');
ylabel("$\delta x_{cmp,max}'$",'FontSize',30)
axis([xcp-xoff xcp+xoff 0 0.1]);
yyaxis right
ylabel('$\delta z_{max}$','FontSize',18)
fplot(xcpmaxz,a,'LineStyle','-');
p(4)=fplot(xcpminz,a,'LineStyle','-');
axis([xcp-xoff xcp+xoff 0 0.2]);
xlabel("Capture Region",'FontSize',18)
legend(p(1:4),{"$\theta_{max}=1/2$","$\theta_{max}=1/3$",'$\theta_{max}=1/6$','$x_{cp,zlim}$'},'FontSize',18,'Location','north')
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(findall(gcf,'-property','FontSize'),'FontSize',30)
set(findall(gcf,'-property','LineWidth'),'LineWidth',2)
exportfig(gcf,'capcompare2.eps', opts)

%%
dx0=1;
z0=1;
dzmax=0.065;
zmax=1.065;
g=9.81
x0=-z0*(sqrt(2*dzmax)+sqrt(zmax))*dx0...
    /(sqrt(g)*(z0+2*dzmax+sqrt(2*zmax*dzmax)));;
dz0 = sqrt(2*g*dzmax);
dx0= 1+x0*dz0/z0;
t = dz0/g;

figure; hold on;
tspan = [0:0.001:t];
x = x0+dx0*tspan;
z = z0+dz0*tspan -0.5*9.81*tspan.^2;

plot(x-x0,z,'Color','b'); 
plot([dx0*t -x0], [1 1]*zmax,'Color','b');
axis equal
grid on;