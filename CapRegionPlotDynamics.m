
set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');
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
dt=t/4;
dx=dx0;
dx1=1-0.4807507;
x1 = x0+dx0*dt*4;
xicppartUpper=x1-x0;
xicppartICP=0

tspan = [0:0.001:t];
dtspan = [0:0.00001:dt]; 

dzmin = 0.3;
g=9.81;
zminfreqafterfall=(z0-dzmin)/(sqrt((z0-dzmin)*g)+sqrt(2*dzmin*g));
tzmin = sqrt(2*dzmin/g);
tspanzmin = [0:0.001:tzmin];
xicppartLower=tzmin*1;
skip=false;

zinf=1.0;
set(groot,'defaulttextinterpreter','latex');  
r=0.02;
iters=70;
lift=-0.7*dt;
zf=1.0

j0=1;
%%
withPolynomials = false;
withPercentUpperLimit = false;
withPercentLowerLimit = false;
withPercentPolynomial = false;
withUnifirst=true;
withBalistic = false;
withICP =true;
withVerticalLimits = false;
withHorizontalLimits = true;

witharea1=false;
witharea2=false;

widthMainPlot=2;
%% Plot

tspan=[0:0.01:100];
xicp = -sqrt(1/9.81);


for j=j0:iters
figure('rend','painters','pos', [0 0 400 870],'DefaultAxesPosition', [0.1, 0.08, 0.9, 0.9]);

if(witharea1)
area([0 1]*-sqrt(2)*xicp,[1.5 1.5],'FaceColor',[0.8,0.8,0.8],'LineStyle','none')
end
hold on;
if(witharea2)
area([-x0 (tzmin+zminfreqafterfall)], [1.1 1.1],'FaceColor',[0.5,0.5,0.5],'LineStyle','none')
area([-x0 (tzmin+zminfreqafterfall)], [0.7 0.7],'FaceColor',[0.8,0.8,0.8],'LineStyle','none')
end

if(withHorizontalLimits)
plot([0, 0.5],[1 1]*zf,'LineStyle', '-.','Color','k');
end
hold on;

if(withPolynomials)
    for i=1:29
    xi = sqrt(2)*xicp - i*xicp*sqrt(2)/70;
    [t1,y1] =ode45(@qfun, tspan, [xi;1;1;0]);
    pPol = plot(y1(:,1)-xi,y1(:,3),'Color','k');
    axis([0 0.5 0 2])
    end
end

if(withICP)
    h=100;
%     if(withVerticalLimits)
%         plot([1 1]*-xicp,[0 2],'LineStyle', '-.','Color','k');
%     end
    if(witharea1)
        [tbal,ybal]= ode45(@qfunbal, tspan, [0;1;1;0]);
        x2 = [ybal(:,1), ybal(:,1)];
        inBetween = [15*ones(length(ybal(:,3)),1), ybal(:,3)];
        fill(x2, inBetween, 'w')
        pBal = plot(ybal(:,1),ybal(:,3),'LineWidth',widthMainPlot,'Color',[1, 0.73, 0.03]);
    end
        [t1,y1] =ode45(@qfun, [0:0.0001:dt*h], [xicp;1;1;0]);
         pICP = plot(y1(:,1)-xicp,y1(:,3),'LineWidth',widthMainPlot,'Color','k');
        %y1(end,1)=xicp; y1(end,3)=1;
        plot([y1(end,1)-xicp -xicp],[y1(end,3) 0],'LineWidth',1,'Color','k');
        scatter(-xicp,0,'filled','MarkerEdgeColor','k','MarkerFaceColor','k');
        com(y1(end,1)-xicp,y1(end,3),r)
        
%         str = "$\dot{x}_0=1.0$ [m/s]";
%         text(0.01,1.05,str,'FontSize',20)
% 
%          str = "$x_{cp}$";
%          text(-xicp-0.03,1.06,str,'FontSize',20)
end

if(withUnifirst)
    g=j;
    if(j<36)
    zinf = zinf-0.02+0.02*j
    xinf=0
    plot([xinf 0.003],[zinf 0],'LineWidth',1,'Color','k');
    pBal=plot([xinf xinf],[1 zinf],'LineWidth',widthMainPlot,'Color',[1, 0.73, 0.03])
    scatter(0.003,0,'filled','MarkerEdgeColor','k','MarkerFaceColor','k');
    elseif(j>35)
        if(j<37)
        zinf=1.4
        end
        xinf=0.003;
        zinf =zinf-0.02*(j-36);
        if(zinf<1)
            zinf=1
        end
        plot([xinf 0.003],[zinf 0],'LineWidth',1,'Color','k');
    pBal=plot([0 0],[1 zinf],'LineWidth',widthMainPlot,'Color',[1, 0.73, 0.03])
    pBal=plot([xinf xinf],[1.4 zinf],'LineWidth',widthMainPlot,'Color',[1, 0.73, 0.03])
    scatter(0.003,0,'filled','MarkerEdgeColor','k','MarkerFaceColor','k');
    end
    
    
    com(xinf,zinf,r)
end

if(withBalistic)
    k=100;
     [tbal,ybal]= ode45(@qfunbal, [0:0.0001:dt*k], [0;1;1;0]);
        pBal = plot(ybal(:,1),ybal(:,3),'LineWidth',widthMainPlot,'Color',[1, 0.73, 0.03]);
        
        if(ybal(end,3)<0)
            ybal(end,1)=0.45152364098;
            lift = lift+0.7*dt;
            ybal(end,3)=lift;
            if(ybal(end,3)>1)
                ybal(end,3)=1;
            end
            
        end
        plot([ybal(end,1) 0.45152364098],[ybal(end,3) 0],'LineWidth',1,'Color','k');
         if(ybal(end,1)>0.4515)
             plot([0.45152364098 0.45152364098],[ybal(end,3) 0],'LineWidth',widthMainPlot,'Color',[1, 0.73, 0.03])
         end
        
        ybal(end,3)=1;
        plot([0.45152364098 0.45152364098],[ybal(end,3) 0],'LineWidth',widthMainPlot,'Color',[1, 0.73, 0.03])
        scatter(0.45152364098,0,'filled','MarkerEdgeColor','k','MarkerFaceColor','k');
        com(ybal(end,1),ybal(end,3),r)
%          str = "$\sqrt{2}x_{cp}$";
%          text(ybal(end,1)-0.07,1.06,str,'FontSize',20)

    
  
    
%     if(withVerticalLimits)
%     plot([1 1]*-sqrt(2)*xicp,[0 2],'LineStyle', '-.','Color','k');
%     plot([1 1]*-sqrt(2)*xicp,[0 1.5],'Color','k','LineStyle', '-.')
%     end
  
end
if(withPercentUpperLimit)
    l=100;
    if(withVerticalLimits)
    plot([1 1]*-x0,[0 2],'LineStyle', '-.','Color','b');
    end
    if(withHorizontalLimits)
    plot([0, 0.5],[1 1]*1.1,'LineStyle', '-.','Color','k');
    end
      if(withHorizontalLimits)
    plot([0, 0.5],[1 1]*1.1,'LineStyle', '-.','Color','k');
    end
    if(l<5)
    x = x0+dx0*dtspan*l;
    z = z0+dz0*dtspan*l -0.5*9.81*(dtspan*l).^2;
    pHeight=plot(x-x0,z,'Color','b','LineWidth',widthMainPlot);
    plot([x(end)-x0 -x0],[z(end) 0],'LineWidth',1,'Color','k');
    scatter(-x0,0,'filled','MarkerEdgeColor','k','MarkerFaceColor','k');
    %draw com
    com(x(end)-x0,z(end),r);
    axis equal
    elseif(l>4)
        x1span = x0+dx0*dtspan*4;
        z1span = z0+dz0*dtspan*4 -0.5*9.81*(dtspan*4).^2;
        pHeight=plot(x1span-x0,z1span,'Color','b','LineWidth',widthMainPlot);
        xicppartUpper=xicppartUpper+dx*dt(end);
        dx = -(x0+xicppartUpper)*sqrt(g/zmax);
        if(xicppartUpper>-x0)
            xicppartUpper=-x0;
        end
        plot([x1-x0-0.003 -x0], [1 1]*1.1,'Color','b','LineWidth',widthMainPlot);
        plot([-x0 -x0],[1.1 0],'LineWidth',1,'Color','k');
        scatter(-x0,0,'filled','MarkerEdgeColor','k','MarkerFaceColor','k');
        com(-x0,1.1,r); 
    end
      if(withHorizontalLimits)
    plot([0, 0.5],[1 1]*0.7,'LineStyle', '-.', 'Color','k');
    end
end

if(withPercentLowerLimit)
    m=100;
    tfin=dt*m;
    if(tfin>tzmin)
        tfin=tzmin;
        xicppartLower=xicppartLower+dx1*dt;
        dx1 = (tzmin+zminfreqafterfall-xicppartLower)*sqrt(g/0.7);
        if(xicppartLower>zminfreqafterfall+tzmin)
            xicppartLower=zminfreqafterfall+tzmin;
        end
        plot([1*tzmin tzmin+zminfreqafterfall],[1 1]*0.7,'Color','b','LineWidth',widthMainPlot);
        plot([1 1]*(tzmin+zminfreqafterfall), [0 1.3],'Color','k','LineStyle', '-.');
        skip=true;
    end
    [tbal,ybal]= ode45(@qfunbal, [0:0.0001:tfin], [0;1;1;0]);
    pMinHeight = plot(ybal(:,1),ybal(:,3),'Color','b','LineWidth',widthMainPlot);
    
        if(skip)
            plot([tzmin+zminfreqafterfall tzmin+zminfreqafterfall],[0.7 0],'LineWidth',1,'Color','k');
        scatter(tzmin+zminfreqafterfall,0,'filled','MarkerEdgeColor','k','MarkerFaceColor','k');
        com(tzmin+zminfreqafterfall,0.7,r); 
        else
        plot([ybal(end,1) tzmin+zminfreqafterfall],[ybal(end,3) 0],'LineWidth',1,'Color','k');
        scatter(tzmin+zminfreqafterfall,0,'filled','MarkerEdgeColor','k','MarkerFaceColor','k');
        com(ybal(end,1),ybal(end,3),r); 
        end
    if(withHorizontalLimits)
    plot([0, 0.5],[1 1]*0.7,'LineStyle', '-.', 'Color','k');
    end
end

if(withPercentPolynomial)
    [t,y] =ode45(@qfun, tspan, [-0.3;1;1;0]);
    plot(y(:,1)+0.3,y(:,3),'Color','k','LineStyle','--','LineWidth',widthMainPlot);
    [t,y] =ode45(@qfun, tspan, [-0.381;1;1;0]);
    plot(y(:,1)+0.381,y(:,3),'Color','k','LineStyle','--','LineWidth',widthMainPlot);
end

box on
axis equal
axis([0 0.5 0 1.3])
ylabel('$z$ [m]','FontSize', 12)
xlabel('Capture Position [m]','FontSize', 12)
xticks([0:0.1:0.5])
yticks([0:0.1:1.3])
grid off;
% Specify legend
legend([pICP pBal],{'LIP Capture Point', 'Unilat. Contact Constrained Capture'},'Position',[0.25 0.87 0.5 0.09])%,'Height Constrained Capture'
set(gca,'FontSize',17)
saveas(gcf,sprintf('CPunif%d.png',j)) 
%saveas(gcf,sprintf('CPbunif%d.eps',j)) 
end
