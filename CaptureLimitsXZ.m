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

%% Plot options
withPolynomials = false;
withPercentUpperLimit = true;
withPercentPolynomial = true;
withBalistic = false;
withICP =true;
withVerticalLimits = false;
withHorizontalLimits = true;

%% Plot
tspan=[0:0.01:100];
figure('rend','painters','pos', [0 0 400 800]);
if(withHorizontalLimits)
plot([0, 0.5],[1 1]*zf,'LineStyle', '-.');
end
hold on;
xicp = -sqrt(1/9.81);
if(withPolynomials)
    for i=1:39
    xi = sqrt(2)*xicp/40 + i*xicp*sqrt(2)/40;
    [t1,y1] =ode45(@qfun, tspan, [xi;1;1;0]);
    pPol = plot(y1(:,1)-xi,y1(:,3),'Color',[0.7 0.7 0.7]);
    axis([0 0.5 0 2])
    end
end


if(withICP)
    if(withVerticalLimits)
        plot([1 1]*-xicp,[0 2],'LineStyle', '-.','Color','k');
    end
[t1,y1] =ode45(@qfun, tspan, [xicp;1;1;0]);
pICP = plot(y1(:,1)-xicp,y1(:,3),'LineWidth',3,'Color','k');
end

if(withPercentUpperLimit)
    pHeight=plot(x-x0,z,'Color','b','LineWidth',3);
    plot([dx0*t -x0], [1 1]*1.1,'Color','b','LineWidth',3);
    if(withVerticalLimits)
    plot([1 1]*-x0,[0 2],'LineStyle', '-.','Color','b');
    end
    if(withHorizontalLimits)
    plot([0, 0.5],[1 1]*1.1,'LineStyle', '-.');
    end
end

if(withPercentPolynomial)
    [t,y] =ode45(@qfun, tspan, [-0.3;1;1;0]);
    plot(y(:,1)+0.3,y(:,3),'Color',[0.7 0.7 0.7]);
end

if(withBalistic)
    [tbal,ybal]= ode45(@qfunbal, tspan, [0;1;1;0]);
    pBal = plot(ybal(:,1),ybal(:,3),'LineWidth',3,'Color','b');
    plot([1 1]*-sqrt(2)*xicp,[0 1],'LineWidth',3,'Color','b')
    if(withVerticalLimits)
    plot([1 1]*-sqrt(2)*xicp,[0 2],'LineStyle', '-.','Color','k');
    end
end



axis equal
axis([0 0.5 0 1.5])
ylabel('CoM Height [m]','FontSize', 12)
xlabel('CoM Horizontal Position [m]','FontSize', 12)
xticks([0:0.1:0.5])
yticks([0:0.1:1.5])
grid off;
% Specify legend
legend([pICP pHeight],{'Capture Point','Height Constrained Capture'})
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'CPvsHeight.eps', opts)





