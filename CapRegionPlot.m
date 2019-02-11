

dx0=1;
z0=1;
dzmax=0.1;
zmax=1;
g=9.81
x0=-z0*(sqrt(2*dzmax)+sqrt(zmax))*dx0...
    /(sqrt(g)*(z0+2*dzmax+sqrt(2*zmax*dzmax)));;
dz0 = sqrt(2*g*0.1);
dx0= 1+x0*dz0/z0;


t = dz0/g;


x_orbit=dx0*t;
tspan = [0:0.001:t];
x = x0+dx0*tspan;
z = z0+dz0*tspan -0.5*9.81*tspan.^2;
zf = 1.0;

dzmin = 0.3;
g=9.81;
zminfreqafterfall=(z0-dzmin)/(sqrt((z0-dzmin)*g)+sqrt(2*dzmin*g));
tzmin = sqrt(2*dzmin/g);
tspanzmin = [0:0.001:tzmin];

set(groot,'defaulttextinterpreter','latex');  
%% Plot options
withPolynomials = false;
withPercentUpperLimit = true;
iterateUpperLimit=true;
withPercentLowerLimit = true;
withPercentPolynomial = false;
withBalistic = true;
withICP =true;
withVerticalLimits = false;
withHorizontalLimits = true;

widthMainPlot=2;
%% Plot
tspan=[0:0.01:100];
xicp = -sqrt(1/9.81);

for j=1:100;
figure('rend','painters','pos', [0 0 400 900]);
area([0 1]*-sqrt(2)*xicp,[1.5 1.5],'FaceColor',[0.9,0.9,0.9],'LineStyle','none')

hold on;
% area([-x0 (tzmin+zminfreqafterfall)], [1.1 1.1],'FaceColor',[0.8,0.8,0.8],'LineStyle','none')
% area([-x0 (tzmin+zminfreqafterfall)], [0.7 0.7],'FaceColor',[0.9,0.9,0.9],'LineStyle','none')

if(withHorizontalLimits)
plot([0, 0.5],[1 1]*zf,'LineStyle', '-.','Color','k');
end
hold on;

if(withPolynomials)
    for i=1:39
    xi = sqrt(2)*xicp/40 + i*xicp*sqrt(2)/40;
    [t1,y1] =ode45(@qfun, tspan, [xi;1;1;0]);
    pPol = plot(y1(:,1)-xi,y1(:,3),'Color','k');
    axis([0 0.5 0 2])
    end
end

if(withICP)
    if(withVerticalLimits)
        plot([1 1]*-xicp,[0 2],'LineStyle', '-.','Color','k');
    end
[t1,y1] =ode45(@qfun, tspan, [xicp;1;1;0]);
pICP = plot(y1(:,1)-xicp,y1(:,3),'LineWidth',widthMainPlot,'Color','k');
end

if(withBalistic)
    [tbal,ybal]= ode45(@qfunbal, tspan, [0;1;1;0]);
    x2 = [ybal(:,1), ybal(:,1)];
    inBetween = [15*ones(length(ybal(:,3)),1), ybal(:,3)];
    fill(x2, inBetween, 'w')
    pBal = plot(ybal(:,1),ybal(:,3),'LineWidth',widthMainPlot,'Color',[1 0.9 0.3]);
    plot([1 1]*-sqrt(2)*xicp,[0 1.5],'Color','k','LineStyle', '-.')
    if(withVerticalLimits)
    plot([1 1]*-sqrt(2)*xicp,[0 2],'LineStyle', '-.','Color','k');
    end
end
if(withPercentUpperLimit)
    pHeight=plot(x-x0,z,'Color','b','LineWidth',widthMainPlot); 
    plot([dx0*t -x0], [1 1]*1.1,'Color','b','LineWidth',widthMainPlot);
    plot([1 1]*-x0, [0 1.3]*1,'Color','k','LineStyle', '-.');
    if(withVerticalLimits)
    plot([1 1]*-x0,[0 2],'LineStyle', '-.','Color','b');
    end
    if(withHorizontalLimits)
    plot([0, 0.5],[1 1]*1.1,'LineStyle', '-.','Color','k');
    end
    
    if(iterateUpperLimit)
        if(j<5)
    x = x0+dx0*dtspan*j;
    z = z0+dz0*dtspan*j -0.5*9.81*(dtspan*j).^2;
    pHeight=plot(x-x0,z,'Color','b','LineWidth',widthMainPlot);
    plot([x(end)-x0 -x0],[z(end) 0],'LineWidth',1,'Color','k');
    scatter(-x0,0,'filled','MarkerEdgeColor','k','MarkerFaceColor','k');
    %draw com
    r=0.03;
    circle(x(end)-x0,z(end),r);
    axis equal
    elseif(j>4)
        x1span = x0+dx0*dtspan*4;
        z1span = z0+dz0*dtspan*4 -0.5*9.81*(dtspan*4).^2;
        pHeight=plot(x1span-x0,z1span,'Color','b','LineWidth',widthMainPlot);
        xicppart=xicppart+dx*dt(end);
        dx = -(x0+xicppart)*sqrt(g/zmax);
        if(xicppart>-x0)
            xicppart=-x0;
        end
        plot([x1-x0-0.003 xicppart], [1 1]*1.1,'Color','b','LineWidth',widthMainPlot);
        plot([xicppart -x0],[1.1 0],'LineWidth',1,'Color','k');
        scatter(-x0,0,'filled','MarkerEdgeColor','k','MarkerFaceColor','k');
        circle(xicppart,1.1,r); 
        end
    end
end

if(withPercentLowerLimit)
    [tbal,ybal]= ode45(@qfunbal, tspanzmin, [0;1;1;0]);
    pMinHeight = plot(ybal(:,1),ybal(:,3),'Color','b','LineWidth',widthMainPlot);
    plot([1*tzmin 1*tzmin+1*zminfreqafterfall],[1 1]*0.7,'Color','b','LineWidth',widthMainPlot);
    plot([1 1]*(tzmin+zminfreqafterfall), [0 1.3],'Color','k','LineStyle', '-.');
    if(withHorizontalLimits)
    plot([0, 0.5],[1 1]*0.7,'LineStyle', '-.', 'Color','k');
    end
end

if(withPercentPolynomial)
    [t,y] =ode45(@qfun, tspan, [-0.3;1;1;0]);
    plot(y(:,1)+0.3,y(:,3),'Color',[0.3 0.3 0.3]);
    [t,y] =ode45(@qfun, tspan, [-0.381;1;1;0]);
    plot(y(:,1)+0.381,y(:,3),'Color',[0.3 0.3 0.3]);
end





axis equal
axis([0 0.5 0 1.3])
ylabel('$z$ [m]','FontSize', 12)
xlabel('Capture Position [m]','FontSize', 12)
xticks([0:0.1:0.5])
yticks([0:0.1:1.5])
grid off;
% Specify legend
legend([pICP pBal pMinHeight],{'LIP Capture Point','Unilateral Constrained Capture','Height Constrained Capture'})
% opts.Format = 'eps';
% opts.Color = 'CMYK';
% opts.Resolution = 10000000;
% set(gca,'LineWidth',1)
% set(gca,'GridAlpha',0.4)
% exportfig(gcf,'CPLimits.eps', opts)

set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
saveas(gcf,sprintf('CPupper%d.png',j)) 
end




