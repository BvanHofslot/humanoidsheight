%% xcpzmax
g=9.81;
z0=1.0;
zmax=1.1;
dzmax=0.1;
dzi=sqrt(2*g*dzmax);
term=sqrt(zmax/g)

xcp=(dzi/g +term)/(1+(dzi/g +term)*dzi/z0);
(1+(dzi/g +term)*dzi/z0)*xcp
(dzi/g +term)

xcp=z0*(sqrt(2*dzmax)+sqrt(zmax))/(sqrt(g)*(z0+2*dzmax+sqrt(2*zmax*dzmax)))

z0/(sqrt(z0*g)+0.3)

sqrt(z0/g)/(1+0.3*sqrt(z0/g))
