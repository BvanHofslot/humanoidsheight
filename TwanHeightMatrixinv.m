syms x0 real
syms zf real 
syms z0 real
syms g real

syms dx0 real
syms dz0 real
syms dxf real
syms dzf real


% dx0 = 0.000001;
% x0 = 0.00000001;
% z0 = 1;
% dz0 =-0.00001;
% g= 9.81;
% zf = 1;
% dxf=0;

k = (1/2)*(dx0*z0-dz0*x0)^2 + g*(x0^2)*z0;% - (1/2)*(dxf*zf)^2;



A = [1 0 0 0;
     1 x0 x0^2 x0^3;
     0 1 2*x0 3*x0^2;
     (3/2)*g*x0^2 g*x0^3 (3/4)*g*x0^4 (3/5)*g*x0^5];
 

 
b = [dzf z0 dz0/dx0 k]';

c = inv(A)*b;


u = simplify((g + (2*c(3) + 6*c(4)*x0)/(c(1) - c(3)*x0^2 - 2*c(4)*x0^3)))
