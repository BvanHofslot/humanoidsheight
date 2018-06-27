clear all;
close all;

vec(1,:) = [-0.18672 0.6398 1.0815 -0.06219];
vec(2,:) = [-0.3 1 1 0];


i = 2;
k = 3;

zf = 1.0;
dxf= 0;

g = 9.81;
z0 = vec(i,3); 
dz0 = vec(i,4);
dx0 = vec(i,2);
ksi0 = dx0*sqrt(z0/9.81);
x0 = vec(i,1);
x0ksi = -ksi0;

tspan = [0 150];
[t,y] =ode45(@qfun4thOrder, tspan, [x0;dx0;z0;dz0]);

x0 = y(:,1);
dx0 = y(:,2);
z0 = y(:,3);
dz = y(:,4);

ddx0 = gradient(dx0, t);
ddz0 = gradient(dz0, t);

u = (dx0.*(20.*(dx0.^4).*z0.^2 - 40.*(dx0.^3).*dz0.*x0.*z0 - 20.*(dx0.^2).*(dxf.^2).*zf.^2 +...
    20.*(dx0.^2).*(dz0.^2).*(x0.^2) - 8.*(dx0.^2).*g.*(x0.^2).*z0 - 12.*(dx0.^2).*g.*(x0.^2).*zf +...
    10*dx0.*dz0.*g.*x0.^3 + (g^2)*x0.^4))./((x0.^2).*(- 30*(dx0.^3).*x0.*z0.^2 +...
    30.*(dx0.^3).*(z0.^2) + 60.*(dx0.^2).*dz0.*(x0.^2).*z0 - 60.*(dx0.^2).*dz0.*x0.*z0 +...
    30*dx0.*(dxf.^2).*x0.*zf.^2 - 30*dx0.*(dxf.^2).*zf.^2 - 30*dx0.*(dz0.^2).*x0.^3 +...
    30.*dx0.*(dz0.^2).*(x0.^2) + 3.*g.*dx0.*(x0.^3).*z0 + 27.*g.*dx0.*(x0.^3).*zf -...
    2*g*dx0.*(x0.^2).*z0 - 27*g*dx0.*(x0.^2).*zf - 9*g*dz0.*(x0.^4) + 8*g*dz0.*(x0.^3)));
u = max(0,u);


m=10;

figure;

subplot(1,5,1);

plot(y(:,1),y(:,3))
%plot(yksi(:,1),yksi(:,3),'--')
xlabel('x')
ylabel('z')
axis([-0.4 0.05 0 2]);
grid on;



subplot(1,5,2);
plot(y(:,2))
xlabel('t')
ylabel('dx')
axis([0 150 -1.5 1.5]);
grid on;

subplot(1,5,3);
plot(y(:,4))
axis([0 150 -5 5]);
xlabel('t')
ylabel('dz')
grid on;


subplot(1,5,4);
plot(ddz)
axis([0 150 -20 50]);
xlabel('t')
ylabel('ddz')
grid on;

tau = 10*sqrt(x.^2 + z.^2).*u;
tau2 = 10*sqrt(x2.^2 + z2.^2).*u2;
tau3 = 10*sqrt(x3.^2 + z3.^2).*u3;
tauksi = 10*sqrt(xksi.^2 + zksi.^2).*uksi;
subplot(1,5,5);

plot(tau)
axis([0 150 -100 700]);
xlabel('t')
ylabel('tau')
grid on;

figure;
subplot(1,2,1)
plot(y(:,1),tau);
xlabel('x')
ylabel('tau')
grid on;
leg = legend('zf = 1.0','zf = 1.098','zf = 0.8','Location','north');

subplot(1,2,2)
plot(tau)
axis([0 150 50 350]);
xlabel('t')
ylabel('tau')
grid on;


figure('rend','painters','pos', [0 0 900 200]);


subplot(1,2,1);
% plot(y(:,1)-x0ksi,y(:,3),'linewidth',1.8)
plot(y(:,1),y(:,3),'linewidth',5)
hold on;
plot(y2(:,1),y2(:,3),'-.','linewidth',5)
%plot(yksi(:,1),yksi(:,3),'-.','linewidth',5)
% hold on;
% plot(y3(:,1),y3(:,3),'-.')
%plot(yksi(:,1),yksi(:,3),'--')
set(gca,'fontsize',13);
xlabel('x', 'FontSize', 45)
ylabel('z', 'FontSize', 45)
axis([-0.4 0.05 0.95 1.15]);
grid on;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)



% 
% subplot(1,5,2);
% plot(y(:,1),y(:,2),'linewidth',1.8)
% hold on;
% plot(yksi(:,1),yksi(:,2),'--','linewidth',1.8)
% % hold on;
% % plot(y3(:,2),'-.')
% %plot(yksi(:,2),'--')
% set(gca,'fontsize',13);
% xlabel('x', 'FontSize', 17)
% ylabel('dx', 'FontSize', 17)
% axis([-0.47 0.05 -1.5 1.5]);
% grid on;
% 
% 
% 
% 
% subplot(1,5,3);
% plot(y(:,1),y(:,4),'linewidth',1.8)
% hold on;
% plot(yksi(:,1),yksi(:,4),'--','linewidth',1.8)
% % hold on;
% % plot(y3(:,4),'-.')
% %plot(yksi(:,4),'--')
% axis([-0.47 0.05 -5 5]);
% set(gca,'fontsize',13);
% xlabel('x', 'FontSize', 17)
% ylabel('dz', 'FontSize', 17)
% grid on;
% 
% 
% 
% subplot(1,5,4);
% plot(y(:,1),ddz,'linewidth',1.8)
% hold on;
% plot(yksi(:,1),ddzksi,'--','linewidth',1.8)
% % hold on;
% % plot(ddz3,'-.')
% %plot(ddzksi,'--')
% axis([-0.47 0.05 -20 50]);
% set(gca,'fontsize',13);
% xlabel('x', 'FontSize', 17)
% ylabel('ddz', 'FontSize', 17)
% grid on;
% 
% 
% 
tau = 10*sqrt(x.^2 + z.^2).*u;
tau2 = 10*sqrt(x2.^2 + z2.^2).*u2;
tau3 = 10*sqrt(x3.^2 + z3.^2).*u3;
tauksi = 10*sqrt(xksi.^2 + zksi.^2).*uksi;
subplot(1,2,2);

plot(y(:,1),tau,'linewidth',5)
hold on;
plot(y2(:,1),tau2,'-.','linewidth',5)
%plot(yksi(:,1),tauksi,'--','linewidth',5)
% hold on;
% plot(tau3,'-.')
% plot(tauksi,'--')
legend({'dz0=0','dz0=-0.2'},'FontSize', 16)
axis([-0.4 0.05 0 800]);
set(gca,'fontsize',13);
xlabel('x', 'FontSize', 45)
ylabel('tau', 'FontSize', 45)
grid on;
opts.Format = 'eps';
opts.color = 'CMYK';
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'impactzdot.eps', opts)
