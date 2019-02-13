set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');
syms g c1 z0 zmax
syms t0 


A = [0 1; (g+c1)/(z0+0.5*c1*t0^2) 0];

Adt= simplify(int(A,t0));
latex(Adt);

phi = simplify(expm(Adt))
simplify(phi);
latex(simplify(phi));


A1 = [0 1; (g-c1)/(z0+c1*t0^2) 0];

A1dt= simplify(int(A1,t0));
latex(A1dt);

phi1 = simplify(expm(A1dt))
simplify(phi1);
latex(simplify(phi1));
%%

syms g a z0 zmax dx0 xcp
g=9.81; a=.5; z0=1; zmax=1.1; dx0=1; 
c1=a;
t0=sqrt((zmax-z0)/a);



phi0 = [                                                                                                                                              cosh((2^(1/4)*t0^(1/2)*atan((2^(1/2)*a^(1/2)*t0)/(2*z0^(1/2)))^(1/2)*(a + g)^(1/2))/(a^(1/4)*z0^(1/4))), (2^(3/4)*sinh((2^(1/4)*(a^(1/2)*t0*z0^(1/2)*atan((2^(1/2)*a^(1/2)*t0)/(2*z0^(1/2)))*(a + g))^(1/2))/(a^(1/2)*z0^(1/2)))*(a^(1/2)*t0*z0^(1/2)*atan((2^(1/2)*a^(1/2)*t0)/(2*z0^(1/2)))*(a + g))^(1/2))/(2*atan((2^(1/2)*a^(1/2)*t0)/(2*z0^(1/2)))*(a + g));
 (2^(1/4)*atan((2^(1/2)*a^(1/2)*t0)/(2*z0^(1/2)))*sinh((2^(1/4)*(a^(1/2)*t0*z0^(1/2)*atan((2^(1/2)*a^(1/2)*t0)/(2*z0^(1/2)))*(a + g))^(1/2))/(a^(1/2)*z0^(1/2)))*(a + g))/(a^(1/2)*t0*z0^(1/2)*atan((2^(1/2)*a^(1/2)*t0)/(2*z0^(1/2)))*(a + g))^(1/2),                                                                                                                                                  cosh((2^(1/4)*t0^(1/2)*atan((2^(1/2)*a^(1/2)*t0)/(2*z0^(1/2)))^(1/2)*(a + g)^(1/2))/(a^(1/4)*z0^(1/4)))]


phi1 = [                                                                                                                      cos((t0^(1/2)*atan((c1^(1/2)*t0)/z0^(1/2))^(1/2)*(c1 - g)^(1/2))/(c1^(1/4)*z0^(1/4))), -(sinh((-c1^(1/2)*t0*z0^(1/2)*atan((c1^(1/2)*t0)/z0^(1/2))*(c1 - g))^(1/2)/(c1^(1/2)*z0^(1/2)))*(-c1^(1/2)*t0*z0^(1/2)*atan((c1^(1/2)*t0)/z0^(1/2))*(c1 - g))^(1/2))/(atan((c1^(1/2)*t0)/z0^(1/2))*(c1 - g));
 -(sinh((-c1^(1/2)*t0*z0^(1/2)*atan((c1^(1/2)*t0)/z0^(1/2))*(c1 - g))^(1/2)/(c1^(1/2)*z0^(1/2)))*atan((c1^(1/2)*t0)/z0^(1/2))*(c1 - g))/(-c1^(1/2)*t0*z0^(1/2)*atan((c1^(1/2)*t0)/z0^(1/2))*(c1 - g))^(1/2),                                                                                                                        cos((t0^(1/2)*atan((c1^(1/2)*t0)/z0^(1/2))^(1/2)*(c1 - g)^(1/2))/(c1^(1/4)*z0^(1/4)))];
% vars = [xcp dx2];
% sol = solve([-sqrt(zmax/g)*dx2; dx2]==phi1*phi0*[-xcp; dx0], vars)

solxcp = double(solve([-sqrt(zmax/g) -1]*phi1*phi0*[-xcp; dx0]==0, xcp))

