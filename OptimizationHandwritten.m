clc;clear;close all;
g=9.81;

fstConst= [1 0 0 0];
fstObj =  1;
maxHeight=1.1;
maxLengthSquared=1.21;

x=-0.1; %-0.319275
z=1;
dx=1.0;
dz=0.0;

X=[x:0.001:0];
zf = 1.0;
dxf= 0;

for i=1:100000
k = (1/2)*(dx*z - dz*x)^2 + g*(x^2)*z-0.5*(zf^2)*(dxf^2);

A = [fstConst;
    1 x x^2 x^3 ; % x^4
    0 1 2*x 3*x^2 ; % 4*x^3
    (3/2)*g*x^2 g*x^3 (3/4)*g*x^4 (3/5)*g*x^5 ]; % (3/6)*g*x^6
c = inv(A)*[fstObj z dz/dx k]';

c0 = c(1);
c1 = c(2);
c2 = c(3);
c3 = c(4);
c4=0;

xmax1 = (-2*c2+sqrt(4*c2^2-12*c3*c1))/(6*c3);
xmax2 = (-2*c2-sqrt(4*c2^2-12*c3*c1))/(6*c3);
xmax=max(xmax1,xmax2); % the peak within the interval is always the highest x
zmax = c0 + c1*xmax+c2*xmax^2+c3*xmax^3;
if (zmax<maxHeight)
    break
end

% xl2max1 = (-4*c2^2+sqrt(16*c2^4-24*(c3^2)*(2+2*c1^2)))/(12*c3^2);
% xl2max2 = (-4*c2^2-sqrt(16*c2^4-24*(c3^2)*(2+2*c1^2)))/(12*c3^2);
% xlmax1=-abs(sqrt(max(xl2max1,xl2max2)));
% 
% l2max = xlmax1^2 + (c0 + c1*xlmax1+c2*xlmax1^2+c3*xlmax1^3)^2;
% if (l2max<maxLengthSquared)
%     break
% end

dxf=dxf+0.001;
end

Y=c0+c1.*X+c2.*X.^2+c3*X.^3;
figure;
plot(X,Y);
circle(0,0,sqrt(maxLengthSquared));
legend(num2str(dxf));
axis([-0.5 0.5 0 2])



X=-1:0.0001:1;
Y=c0+c1.*X+c2.*X.^2+c3*X.^3;
figure;plot(X,Y);axis([-0.5 0.5 0 2])
% tspan = [0:0.01:150];
% [t,y] =ode45(@qfunOptimizationHandwritten, tspan, [x;dx;z;dz]);
