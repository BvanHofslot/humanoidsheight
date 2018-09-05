clc;
clear all;
close all;
x0=-0.286178;
dx0= 1-0.400854;
z0=1;
dz0 = 1.40071;
t = 0.1427839;
x_orbit=dx0*t;
tspan = [0:0.001:t];
x = x0+dx0*tspan;
z = z0+dz0*tspan -0.5*9.81*tspan.^2;
zf = 1.0;

withPolynomials = true;
withPercentUpperLimit = true;
withPercentPolynomial = true;
withBalistic = true;
withICP =true;

tspan=[0:0.01:100];
figure;
plot([0, 0.5],[1 1]*zf,'LineStyle', '-.');
hold on;
xicp = -sqrt(1/9.81);
if(withPolynomials)
    for i=1:39
    xi = sqrt(2)*xicp/40 + i*xicp*sqrt(2)/40;
    [t1,y1] =ode45(@qfun, tspan, [xi;1;1;0]);
    plot(y1(:,1)-xi,y1(:,3),'Color',[0.7 0.7 0.7]);
    axis([0 0.5 0 2])
    end
end


if(withICP)
plot([1 1]*-xicp,[0 2],'LineStyle', '-.','Color','k');
[t1,y1] =ode45(@qfun, tspan, [xicp;1;1;0]);
plot(y1(:,1)-xicp,y1(:,3),'LineWidth',3,'Color','k');
end




if(withPercentUpperLimit)
    plot(x-x0,z,'Color','b','LineWidth',3);
    plot([dx0*t -x0], [1 1]*1.1,'Color','b','LineWidth',3);
    plot([1 1]*-x0,[0 2],'LineStyle', '-.','Color','b');
    plot([0, 0.5],[1 1]*1.1,'LineStyle', '-.');
end

if(withPercentPolynomial)
    [t,y] =ode45(@qfun, tspan, [-0.3;1;1;0]);
    plot(y(:,1)+0.3,y(:,3),'LineWidth',3);
end

if(withBalistic)
    [tbal,ybal]= ode45(@qfunbal, tspan, [0;1;1;0]);
    plot(ybal(:,1),ybal(:,3),'LineWidth',3,'Color','k');
    plot([1 1]*-sqrt(2)*xicp,[0 2],'LineStyle', '-.','Color','k');
end

axis([0 0.5 0 2])







