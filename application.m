z0 = 1.08;
dz0 = 0.05;
zmax = 1.15;
zmin = 1.00;
ddzmax = 0.7*9.81;
ddzmin = -0.4*9.81;
gstar = -ddzmin;

a = (1/2)*(ddzmax + (ddzmax^2)/gstar);
b = dz0 + dz0*ddzmax/gstar;
c = z0-zmax + (1/2)*(dz0^2)/gstar;

tmaxhi = (-b + sqrt(b^2-4*a*c))/(2*a)
tmaxlo = (-b - sqrt(b^2-4*a*c))/(2*a)

dz0 = -0.05;

a = (1/2)*(ddzmin - (ddzmin^2)/ddzmax);
b = dz0 + dz0*ddzmin/ddzmax;
c = z0-zmin - (1/2)*(dz0^2)/ddzmax;

tminhi = (-b + sqrt(b^2-4*a*c))/(2*a)
tminlo = (-b - sqrt(b^2-4*a*c))/(2*a)

