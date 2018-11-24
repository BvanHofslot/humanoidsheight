set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

syms a;
dx = 1.0;
z=1.0;
g =9.81;
dxcmpmax = a;
xcp = sqrt(1/g)*dx;
Theta=(1/2)*pi;
tbang = sqrt((1/6)*Theta/dxcmpmax);
dxcmp = (1-2*exp(-tbang)+exp(-2*tbang))*dxcmpmax;

zmin = z-a;
dzmin = a;
xcpminz = (sqrt(2*dzmin/g) + zmin/(sqrt(zmin*g)+sqrt(2*g*dzmin)));

zmax= z+a;
dzmax = a;

xcpmaxz = z*(sqrt(2*dzmax)+sqrt(zmax))*dx...
    /(sqrt(g)*(z+2*dzmax+sqrt(2*zmax*dzmax)));
xoff=0.1;

figure('rend','painters','pos', [0 0 1600 800]);
yyaxis left
fplot(xcp-dxcmp,a);
hold on;
fplot(xcp + dxcmp,a,'LineStyle','-.');
Theta=(1/3)*pi;
tbang = sqrt((1/6)*Theta/dxcmpmax);
dxcmp = (1-2*exp(-tbang)+exp(-2*tbang))*dxcmpmax;
p(1)=fplot(xcp-dxcmp,a,'LineStyle','-');
p(2)=fplot(xcp + dxcmp,a,'LineStyle','-.');
Theta=(1/6)*pi;
tbang = sqrt((1/6)*Theta/dxcmpmax);
dxcmp = (1-2*exp(-tbang)+exp(-2*tbang))*dxcmpmax;
fplot(xcp-dxcmp,a,'LineStyle','-');
fplot(xcp + dxcmp,a,'LineStyle','-.');
ylabel("$\delta x_{cmp,max}'$",'FontSize',30)
axis([0.2 0.4 0 0.1]);
yyaxis right
ylabel('$\delta z_{max}$','FontSize',18)
p(3)=fplot(xcpmaxz,a);
p(4)=fplot(xcpminz,a,'LineStyle','-.');
axis([0.2 0.4 0 0.15]);
xlabel("Capture Region",'FontSize',18)
legend(p(1:4),{"$x_{cp}-\delta x_{cmp}'$","$x_{cp}+\delta x_{cmp}'$",'$x_{cp,zmax}$','$x_{cp,zmin}$'},'FontSize',18,'Location','northwest')
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(findall(gcf,'-property','FontSize'),'FontSize',30)
set(findall(gcf,'-property','LineWidth'),'LineWidth',2)
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