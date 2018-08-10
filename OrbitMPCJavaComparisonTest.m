clc;clear;close all;
g=9.81;

fstConst= [1 0 0 0];
fstObj =  1.0;
maxHeight=1.3;
umax =40;
z=1;
dx=1.0;
dz=0.0;
zf = 1.0;

for i=1:10
    
x=-0.3193-0.02+0.02*i;

dxf= 0;

A = [fstConst;
    1 x x^2 x^3 ; % x^4
    0 1 2*x 3*x^2 ; % 4*x^3
    (3/2)*g*x^2 g*x^3 (3/4)*g*x^4 (3/5)*g*x^5 ]; % (3/6)*g*x^6

Ainv= inv(A);
iter = 0;
    for i=1:1000000
    k = (1/2)*(dx*z - dz*x)^2 + g*(x^2)*z-0.5*(zf^2)*(dxf^2);


    c = Ainv*[fstObj z dz/dx k]';

    c0 = c(1);
    c1 = c(2);
    c2 = c(3);
    c3 = c(4);
    c4=0;

    %xmax1 = (-2*c2+sqrt(4*c2^2-12*c3*c1))/(6*c3)
    xmax2 = (-2*c2-sqrt(4*c2^2-12*c3*c1))/(6*c3);
    %xmax= max(xmax1,xmax2); % the peak within the interval is always the highest x
    %zmax = c0 + c1*xmax+c2*xmax^2+c3*xmax^3;
    %zmax1= c0 + c1*xmax1+c2*xmax1^2+c3*xmax1^3
    zmax2= c0 + c1*xmax2+c2*xmax2^2+c3*xmax2^3;
    uinit = (g+ (2*c2+6*c3*x).*dx^2)/(c0-c2*x^2-2*c3*x^3);
    if (zmax2<=maxHeight) && (uinit<=umax)
        x;
      uinit
       zmax2
      
     
       uinit;
        break
    end


dxf=dxf+0.04;
iter = iter+1;
    end
iter;
end