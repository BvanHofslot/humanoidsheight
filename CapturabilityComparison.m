set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

syms a;
dx = 1.0;
z=1.0;
g =9.81;
dxcmpmax = 0.05;
xcp = sqrt(1/g)*dx;

tbang = sqrt(a*0.5*pi/dxcmpmax);
dxcmp = (1-2*exp(-tbang)+exp(-2*tbang))*dxcmpmax;

zmin = z-a;
dzmin = a;
xcpminz = (sqrt(2*dzmin/g) + zmin/(sqrt(zmin*g)+sqrt(2*g*dzmin)));

zmax= z+a;
dzmax = a;

xcpmaxz = z*(sqrt(2*dzmax)+sqrt(zmax))*dx...
    /(sqrt(g)*(z+2*dzmax+sqrt(2*zmax*dzmax)));


figure;
yyaxis left
fplot(xcp-dxcmp,a);
hold on;
fplot(xcp + dxcmp,a,'LineStyle','-.');
ylabel("$J'_{max}$",'FontSize',18)
axis([0.2 0.4 0 0.35]);
yyaxis right
ylabel('$\delta z_{max}$','FontSize',18)
fplot(xcpmaxz,a);
fplot(xcpminz,a,'LineStyle','-.');
axis([0.2 0.4 0 0.25]);
xlabel("Capture Region",'FontSize',18)

opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
exportfig(gcf,'capcompare.eps', opts)