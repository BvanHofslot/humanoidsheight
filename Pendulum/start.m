%%

tspan=[0:0.00001:1];
a = 2.4;
zmin = 0.935;
zmax =1.065;

cp5=[];
for j=1:3
    a= 10^(j-1);
    incr=0.008;
    abs=-0.40;
    cost=100*ones(1000,1);
    
    for i=1:10000
    abs=abs+incr;
    cost(i) = afstandOptimFun(abs,a,zmin,zmax);
    if(i>1)
        if(cost(i-1)<cost(i))
            if(cost(i-1)<10^-7)
                abs=abs-incr;
                 break;
             end
             abs = abs - incr - incr/2;
             incr = incr/2;    
        end
    end
    end
    cp5=abs;
end

%%
figure;plot([1:50],fliplr(cp2(1:50))+sqrt(1/9.81)); 
hold on; plot([1:50],cp2(52:101)+sqrt(1/9.81))

plot([1:50],fliplr(cp3(1:50))+sqrt(1/9.81)); 
hold on; plot([1:50],cp3(52:101)+sqrt(1/9.81))

%%
set(groot,'defaulttextinterpreter','latex');  
figure;
hold on;
tspan=[0:0.000001:1];
font=30;
zmin = 0.935;
zmax =1.065;
xcp=sqrt(1/9.81);
for i=1:3
    a = 10^(i-1);
   [t,x] = ode45(@(t,x) penDynFcn(t,x,a,zmin,zmax),tspan,[cp4(i),1.0,1.0,0.0]);
   s = find(x(:,1) >-0.0001,1);
   plot(x(1:s,1)/xcp-cp4(i)/xcp,x(1:s,3),'Color','k','LineStyle','--')
   hold on;
   p1=plot([-cp4(i) -cp4(i)]/xcp, [0.95 1.1],'Color','k','LineStyle','--');
   r=find(x(:,3) > 1.0+0.015*i,1);
   
   str = "$\leftarrow \ddot{z}_c=$" +num2str(a);
   text(x(r,1)/xcp-cp4(i)/xcp,x(r,3),str,'FontSize',font)
end
a =2.4;
   [t,x] = ode45(@(t,x) penDynFcn(t,x,a,zmin,zmax),tspan,[abs,1.0,1.0,0.0]);
   s = find(x(:,1) >-0.0001,1);
   plot(x(1:s,1)/xcp-abs/xcp,x(1:s,3),'Color','k','LineStyle','--')
   
   p1=plot([-abs -abs]/xcp, [0.95 1.1],'Color','k','LineStyle','--');
   r=find(x(:,3) > 1.0+0.015*i,1);
   str = "$\leftarrow \ddot{z}_c=$" +num2str(a);
   text(x(r,1)/xcp-abs/xcp,x(r,3),str,'FontSize',font)
   
dx0=1;
z0=1;
dzmax=0.065;
zmax=1.065;
g=9.81;
x0=-z0*(sqrt(2*dzmax)+sqrt(zmax))*dx0...
    /(sqrt(g)*(z0+2*dzmax+sqrt(2*zmax*dzmax)));
dz0 = sqrt(2*g*dzmax);
dx0= 1+x0*dz0/z0;
t = dz0/g;

tspan = [0:0.001:t];
x = x0+dx0*tspan;
z = z0+dz0*tspan -0.5*9.81*tspan.^2;

p2=plot(x/xcp-x0/xcp,z,'Color','b','LineWidth',3); 
plot([dx0*t -x0]/xcp, [1 1]*zmax,'Color','b','LineWidth',3);
plot([-x0 -x0]/xcp, [0.85 1.1]*zmax,'Color','b','LineWidth',1);
  axis([0 1 0.98 1.08])
  ylabel("$z'$ [-]",'FontSize', font)
xlabel("$x'$ [-]",'FontSize', font)
legend([p2,p1],{'Height Constrained Capture','Force Constrained Capture'},'FontSize', font)
set(gca,'LineWidth',2)
set(gca,'XTick',[0:0.05:1])
set(gca,'YTick',[0.98:0.01:1.08]);
set(gca,'FontSize',font)