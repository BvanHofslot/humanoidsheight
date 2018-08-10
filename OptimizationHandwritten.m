clc;clear;close all;
g=9.81;

fstConst= [1 0 0 0];
fstObj =  1.0;
maxHeight=1.3;
maxLengthSquared=1.21;
stepUp=0.2;

%% First step
x=-0.3193;
z=1;
dx=1.0;
dz=0.0;

X0=[x:0.001:0];
zf = 1.0;
dxf= 0;

A = [fstConst;
    1 x x^2 x^3 ; % x^4
    0 1 2*x 3*x^2 ; % 4*x^3
    (3/2)*g*x^2 g*x^3 (3/4)*g*x^4 (3/5)*g*x^5 ]; % (3/6)*g*x^6

Ainv= inv(A);
iter = 0;
for i=1:100000
k = (1/2)*(dx*z - dz*x)^2 + g*(x^2)*z-0.5*(zf^2)*(dxf^2);


c = Ainv*[fstObj z dz/dx k]';

c0 = c(1);
c1 = c(2);
c2 = c(3);
c3 = c(4);
c4=0;

xmax1 = (-2*c2+sqrt(4*c2^2-12*c3*c1))/(6*c3);
xmax2 = (-2*c2-sqrt(4*c2^2-12*c3*c1))/(6*c3);
xmax=max(xmax1,xmax2); % the peak within the interval is always the highest x
zmax = c0 + c1*xmax+c2*xmax^2+c3*xmax^3;
if (zmax<maxHeight) %&& (sqrt(x^2+z^2)*(g+(2*c2+6*c3*x).*dx^2)/(c0-c2*x^2-2*c3*x^3)<30)
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

dxf=dxf+0.001;% + (l2max-maxLengthSquared)*0.01;
iter = iter+1;
end

%% Second step
x1=-sqrt(c0/g)*dxf*0.66; %-0.319275
z1= c0-stepUp;
dx1=dxf;
dz1=c1*dxf;

X1=[x1:0.001:0];
zf1 = 1.0;
dxf1= 0;

A1 = [1 0 0 0;
    1 x1 x1^2 x1^3 ; % x^4
    0 1 2*x1 3*x1^2 ; % 4*x^3
    (3/2)*g*x1^2 g*x1^3 (3/4)*g*x1^4 (3/5)*g*x1^5 ]; % (3/6)*g*x^6

Ainv1= inv(A1);
iter1 = 0;
for i=1:100000
k1 = (1/2)*(dx1*z1 - dz1*x1)^2 + g*(x1^2)*z1-0.5*(zf1^2)*(dxf1^2);

c_1 = Ainv1*[zf1 z1 dz1/dx1 k1]';

c01 = c_1(1);
c11 = c_1(2);
c21 = c_1(3);
c31 = c_1(4);
c41=0;

xmax11 = (-2*c21+sqrt(4*c21^2-12*c31*c11))/(6*c31);
xmax21 = (-2*c21-sqrt(4*c21^2-12*c31*c11))/(6*c31);
xmax_1=max(xmax11,xmax21); % the peak within the interval is always the highest x
zmax1 = c01 + c11*xmax_1+c21*xmax_1^2+c31*xmax_1^3;
if (zmax1<maxHeight) %&& (sqrt(x^2+z^2)*(g+(2*c2+6*c3*x).*dx^2)/(c0-c2*x^2-2*c3*x^3)<30) 
    break
end

% xl2max11 = (-4*c21^2+sqrt(16*c21^4-24*(c31^2)*(2+2*c11^2)))/(12*c31^2);
% xl2max21 = (-4*c21^2-sqrt(16*c21^4-24*(c31^2)*(2+2*c11^2)))/(12*c31^2);
% xlmax11=-abs(sqrt(max(xl2max11,xl2max21)));
% 
% l2max1 = xlmax11^2 + (c01 + c11*xlmax11+c21*xlmax11^2+c31*xlmax11^3)^2;
% if (l2max1<maxLengthSquared)
%     break
% end

dxf1=dxf1+0.001;% + (l2max-maxLengthSquared)*0.01;
iter1 = iter1+1;
end

%% plotting
Fx0=c0+c1.*X0+c2.*X0.^2+c3*X0.^3;
Fx1=c01+c11.*X1+c21.*X1.^2+c31*X1.^3;

dX0=(((c0^2)*(dxf^2) + (c0*X0.^2 - 0.5*c2*X0.^4 - (4/5)*c3*X0.^5)*g).^(0.5))./(c0 - c2*X0.^2 - 2*c3*X0.^3);
dX0dx1 = (c0^2)*(dxf^2)*(2*c2 + 6*c3.*X0);
dX0dx2 = g*(c0^2 + 2*c0*c3*X0.^3 + (c3*X0.^5).*(-0.6*c2-0.8*c3.*X0));
dX0dx3 = (c0 + (X0.^2).*(-c2 -2*c3*X0)).^2;
dX0dx4 = ((c0^2)*(dxf^2) + (c0*X0.^2 - 0.5*c2*X0.^4 - (4/5)*c3*X0.^5)*g).^(0.5);
dX0dx = X0.*(dX0dx1 + dX0dx2)./(dX0dx3.*dX0dx4);



figure;
plot(X0,dX0);
figure;
plot(X0,dX0dx);

figure;
plot(X0,Fx0,'linewidth',2);
hold on;
line([0,x],[0,z])
line([0,0],[0,c0])
plot(X1-x1,Fx1+stepUp,'linewidth',2);
line([-x1,0],[stepUp,stepUp+z1]);
line([-x1,-x1],[stepUp,stepUp+zf1]);
circle(0,0,sqrt(maxLengthSquared));
circle(-x1,0+stepUp,sqrt(maxLengthSquared));
% Xline=[-1:0.01:1];
% Zmax= 0*Xline+maxHeight;
% hold on;
% plot(Xline,Zmax);
axis([-0.4 0.4 0.0 1.5])
xlabel('x','FontSize', 35)
ylabel('z','FontSize', 35)
grid off;
legend(num2str(dxf),num2str(dxf1));
axis equal
axis([-0.4 0.4 0.0 1.5])
iter
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'cubicPolMultiStepUp.eps', opts)

u = (g+(2*c2+6*c3*x).*dx^2)/(c0-c2*x^2-2*c3*x^3);
% figure;
% plot(X,u);
% axis([-0.3 0 0 100]);
fgr = 10*sqrt(z^2+x^2)*u
time_est= ((c0 + c1*x +c2*x^2+c3*x^3)/(c1 + 2*c2*x + 3*c3*x^2))%+c0/c1


X=-1:0.0001:1;
Y=c0+c1.*X+c2.*X.^2+c3*X.^3;
figure;
plot(X,Y);
% circle(0,0,sqrt(maxLengthSquared));
Xline=[-1:0.01:1];
Zmax= 0*Xline+maxHeight;
hold on;
plot(Xline,Zmax);
axis equal
axis([-0.5 0.5 0.5 1.5])
xlabel('x','FontSize', 35)
ylabel('z','FontSize', 35)
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
%exportfig(gcf,'cubicPolAndLine.eps', opts)


fx=c0+c1*x+c2*x^2+c3*x^3;
dfx=c1+2*c2*x+3*c3*x^2;
ddfx=2*c2 +6*c3*x;

b = inv([1 0 0; 0 1 0; 0 0 2;])*[1 0 ddfx*dx^2]';


% tspan = [0:0.01:150];
% [t,y] =ode45(@qfunOptimizationHandwritten, tspan, [x;dx;z;dz]);
