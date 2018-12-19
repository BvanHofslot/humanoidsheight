set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

vec(1,:) = [-0.18672 0.6398 1.0815 -0.06219];
vec(2,:) = [-0.2997 1 1 0];
vec(3,:) = [-0.3003 1 1 0];
vec(4,:) = [-0.3 1 1 0];


i = 2;
k = 3;

zf = 1.0;
zf2 = 1.0;
zf3 = 1.0;
dxf= 0;
 
g = 9.81;
z0 = vec(i,3); 
dz0 = vec(i,4);
dx0 = vec(i,2);
ksi0 = dx0*sqrt(z0/9.81);
x0 = vec(i,1);
x0ksi = -ksi0;

z02 = vec(k,3); 
dz02 = vec(k,4);
dx02 = vec(k,2);
ksi02 = dx02*sqrt(z02/9.81);
x02 = vec(k,1);
x0ksi2 = -ksi02;

tspan = [0 3];
[t,y] =ode45(@qfun, tspan, [x0;dx0;z0;dz0]);
[t2,y2] =ode45(@qfun2, tspan, [x02;dx02;z02;dz02]);
[t3,y3] =ode45(@qfun3, tspan, [x0;dx0;z0;dz0]);
[tksi,yksi] =ode45(@qfun, tspan, [x0ksi;dx0;z0;dz0]);


x = y(:,1);
dx = y(:,2);
z = y(:,3);
dz = y(:,4);

ddx = gradient(dx, t);
ddz = gradient(dz, t);


x2 = y2(:,1);
dx2 = y2(:,2);
z2 = y2(:,3);
dz2 = y2(:,4);

ddx2 = gradient(dx2, t2);
ddz2 = gradient(dz2, t2);


x3 = y3(:,1);
dx3 = y3(:,2);
z3 = y3(:,3);
dz3 = y3(:,4);

ddx3 = gradient(dx3, t3);
ddz3 = gradient(dz3, t3);

% zmax=z0;
% for j=1:150
%    if y(j,3)>zmax
%        zmax = y(j,3);
%    end
% end
% zmax

xksi = yksi(:,1);
dxksi = yksi(:,2);
zksi = yksi(:,3);
dzksi = yksi(:,4);

ddxksi = gradient(dxksi, tksi);
ddzksi = gradient(dzksi, tksi);




a =dx./x;
b = dz - a.*z;
u = (-7*a.^2 + (3*zf*a.^3-g.*a)./b -(10*(a.^3).*b)/g);% + (10.*(a.^3)*(dxf^2).*zf^2)./(b.*g.*x.^2);
u = max(0,u);


a2 =dx2./x2;
b2 = dz2 - a2.*z2;
u2 = (-7*a2.^2 + (3*zf2*a2.^3-g.*a2)./b2 -(10*(a2.^3).*b2)./g); + (10.*(a2.^3)*(dxf.^2).*zf.^2)./(b2.*g.*x2.^2);
u2 = max(0,u2);


a3 =dx3./x3;
b3 = dz3 - a3.*z3;
u3 = (-7*a3.^2 + (3*zf3*a3.^3-g.*a3)./b3 -(10*(a3.^3).*b3)/g);% + (10.*(a.^3)*(dxf^2).*zf^2)./(b.*g.*x.^2);
u3 = max(0,u3);

aksi =dxksi./xksi;
bksi = dzksi - aksi.*zksi;
uksi = (-7*aksi.^2 + (3*zf*aksi.^3-g.*aksi)./bksi -(10*(aksi.^3).*bksi)/g);% + (10.*(aksi.^3)*(dxf^2).*zf^2)./(bksi.*g.*xksi.^2);
uksi = max(0,uksi);

m=10;
fs= 16;

figure('rend','painters','pos', [0 0 1600 600]);
subplot(1,2,1);
%plot(y(:,1)-x0ksi,y(:,3),'linewidth',1.8)
plot(y(:,1),y(:,3),'linewidth',5)
hold on;
plot(y2(:,1),y2(:,3),'linewidth',5)
%plot(yksi(:,1),yksi(:,3),'-.','linewidth',5)
% hold on;
% plot(y3(:,1),y3(:,3),'-.')
% plot(yksi(:,1),yksi(:,3),'--')
set(gca,'fontsize',13);
xlabel('$x$ [m]', 'FontSize', fs)
ylabel('$z$ [m]', 'FontSize', fs)
axis equal
axis([-0.32 0.02 0.99 1.11]);
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
set(gca,'FontSize',fs)
% exportfig(gcf,'dzf1.4.eps', opts)
hsp1=get(gca,'Position')

% subplot(1,4,2);
% plot(y(:,1),y(:,2),'linewidth',5)
% hold on;
% %plot(yksi(:,1),yksi(:,2),'--','linewidth',5)
% % hold on;
% plot(y2(:,1),y2(:,2),'-.','linewidth',5)
% %plot(yksi(:,2),'--')
% set(gca,'fontsize',13);
% xlabel('x', 'FontSize', 35)
% ylabel('dx', 'FontSize', 35)
% axis([-0.47 0.05 -1.5 1.5]);
% grid on;
% set(gca,'LineWidth',1)
% set(gca,'GridAlpha',0.4)
% 
% 
% 
% subplot(1,4,3);
% plot(y(:,1),y(:,4),'linewidth',5)
% hold on;
%  %plot(yksi(:,1),yksi(:,4),'--','linewidth',5)
% hold on;
% plot(y2(:,1),y2(:,4),'-.','linewidth',5)
% %plot(yksi(:,4),'--')
% axis([-0.47 0.05 -5 5]);
% set(gca,'fontsize',13);
% xlabel('x', 'FontSize', 35)
% ylabel('dz', 'FontSize', 35)
% grid on;
% set(gca,'LineWidth',1)
% set(gca,'GridAlpha',0.4)


subplot(1,2,2);
plot(y(:,1),ddz,'linewidth',5)
hold on;
%plot(yksi(:,1),ddzksi,'--','linewidth',5)
% hold on;
 plot(y2(:,1),ddz2,'linewidth',5)
%plot(ddzksi,'--')
axis([-0.32 0.02 -4 32]);
legend({'$z_f=1.0$','$\dot{z}_f=0.0$'},'FontSize', fs)
set(gca,'fontsize',13);
xlabel('$x$ [m]', 'FontSize', fs)
ylabel('$\ddot{z}$ [m/s2]', 'FontSize', fs)
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
opts.Format = 'eps';
opts.color = 'CMYK';
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
set(gca,'FontSize',fs)
hsp2=get(gca,'Position')
% set(gca,'Position',[hsp1(1:4)]);
% exportfig(gcf,'dzf1.4.eps', opts)
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
% %set(gca,'LineWidth',1)
% set(gca,'GridAlpha',0.4)
exportfig(gcf,'polynomialddotz.eps', opts)

tau = 10*sqrt(x.^2 + z.^2).*u;
%tau2 = 10*sqrt(x2.^2 + z2.^2).*u2;
tau3 = 10*sqrt(x3.^2 + z3.^2).*u3;
tauksi = 10*sqrt(xksi.^2 + zksi.^2).*uksi;
% subplot(1,5,5);
% 
figure;
plot(x,tau,'linewidth',5)
hold on;
%plot(y2(:,1),tau2,'-.','linewidth',5)
%plot(yksi(:,1),tauksi,'--','linewidth',5)
% hold on;
% plot(tau2,'-.')
% plot(tauksi,'--')
legend({'x0=-0.3','x0=-0.319'},'FontSize', 16)
axis([-0.32 0.02 0 500]);
set(gca,'fontsize',13);
xlabel('x', 'FontSize', 35)
ylabel('tau', 'FontSize', 35)
grid on;
opts.Format = 'eps';
opts.color = 'CMYK';
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
% exportfig(gcf,'impactzdot2.eps', opts)
% 
% 
% figure;
% subplot(1,2,1)
% plot(y(:,1),tau,'linewidth',1.8);
% hold on;
% plot(yksi(:,1),tauksi,'--','linewidth',1.8)
% % hold on;
% % plot(y3(:,1),tau3,'-.')
% xlabel('x', 'FontSize', 17)
% ylabel('tau', 'FontSize', 17)
% grid on;
% 
% subplot(1,2,2)
% plot(tau,'linewidth',1.8)
% hold on;
% plot(tauksi,'--','linewidth',1.8)
%  legend('x0 = -0.3','x0 = ICP','Location','north');
% % hold on;
% % plot(tau3,'-.')
% axis([0 150 50 350]);
% xlabel('t', 'FontSize', 17)
% ylabel('tau', 'FontSize', 17)
% grid on;






