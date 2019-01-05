%%
dCPthes1=[];
g=9.81;
a_vect=[1 5 10 50]
for j=1:50
zmax=1+j*0.02;
zmin=1-j*0.02;
dx0=0.5;
incr =0.02;
cost=[];
dX0=[];
S=[];
tspan3=[0 5];
a=9.81;
        
for i=1:10000;
dx0=dx0+incr;
  
t=[];
x1=[];
x2=[];
xf=[];
    
aplus =a;
amin=-a;
if(aplus>9.81)
    amin=-9.81;
end
t1=sqrt(2*(zmax-1)/(aplus+aplus*aplus/-amin));
t2=t1*aplus/-amin;
tspan1=[0 t1];
tspan2=[0 t2];
[t,x1] = ode45(@(t,x) penDynFcn(t,x,aplus),tspan1,[-sqrt(1/9.81),dx0,1.0,0.0]);

[t,x2] = ode45(@(t,x) penDynFcn(t,x,amin),tspan2,x1(end,:));

[t,xf] = ode45(@(t,x) penDynFcn(t,x,0),tspan3,x2(end,:));

s = find(xf(:,2) <0.00001,1)


if(length(s)==0)
    cost(i)=100;
else
    cost(i)=(xf(s,1))^2;
end

dX0(i)=dx0;

if(cost(i)<10^-10)
    dx0=dx0-incr;
    S(i)=s;
    break;
end

if(length(cost)>1)
    if((cost(i-1)<cost(i)))
        dx0=dx0-incr;
        incr=incr/2;
    elseif((cost(i)>99))
        dx0=dx0-incr;
        incr=incr/2;
    end
end
end
dCPthes1(j)=dx0;
end
%%
figure('rend','painters','pos', [0 0 600 400]);
set(groot,'defaulttextinterpreter','latex'); 
font = 12;
hold on;
for i=1:4
dx0=-0.33;
incr =0.01;
cost=[];
X0=[];
S=[];
tspan2=[0 5];
if(i==1)
    a=2.45;
elseif(i==2)
     a=4.9;
elseif (i==3)
     a=9.81;
else
    a=49;
end
t1=sqrt((zmax-1)/(a));
tspan1=[0 t1];

t=[];
x1=[];
x2=[];
xf=[];

aplus =a;
amin=-a;
if(aplus>9.81)
    amin=-9.81;
end
t1=sqrt(2*(zmax-1)/(aplus+aplus*aplus/-amin));
t2=t1*aplus/-amin;
tspan1=[0 t1];
tspan2=[0 t2];
[t,x1] = ode45(@(t,x) penDynFcn(t,x,aplus),tspan1,[CPthes(i),1.0,1.0,0.0]);

[t,x2] = ode45(@(t,x) penDynFcn(t,x,amin),tspan2,x1(end,:));

[t,xf] = ode45(@(t,x) penDynFcn(t,x,0),tspan3,x2(end,:));

s=find(xf(:,2)<0.00001,1);

p1=plot([x1(:,1); x2(:,1); xf(1:s,1)]-x1(1,1), [x1(:,3); x2(:,3); xf(1:s,3)], 'Color','k')
plot([-x1(1,1) -x1(1,1)],[0 zmax], 'Color','k','LineStyle','--');
x=[x1; x2; xf];
r=find(x(:,3) > 1.0+0.015*i,1);
str = "$\leftarrow \ddot{z}_c=$" +num2str(a);
text(x(r,1)-CPthes(i),x(r,3),str,'FontSize',font)
  
end
% Limit part
dx0=1;
z0=1;
g=9.81;
dx0=-z0*(sqrt(2*dzmax)+sqrt(zmax))*dx0...
    /(sqrt(g)*(z0+2*dzmax+sqrt(2*zmax*dzmax)));
dz0 = sqrt(2*g*dzmax);
dx0= 1+dx0*dz0/z0;
t = dz0/g;

tspan = [0:0.001:t];
x = dx0+dx0*tspan;
z = z0+dz0*tspan -0.5*9.81*tspan.^2;

p2=plot(x-dx0,z,'Color','b','LineWidth',2); 
plot([dx0*t -dx0], [1 1]*zmax,'Color','b','LineWidth',2);
plot([-dx0 -dx0], [0.85 1]*zmax,'Color','b','LineWidth',1);
axis equal
axis([0 0.35 0.99 1.15])
  ylabel("$z$ [m]",'FontSize', font)
%legend([p2 p1],{'Height Constrained','Vertical Force Constrained'},'FontSize', font,'Interpreter','latex')
set(gca,'LineWidth',1)
% set(gca,'XTick',[0:0.05:1])
% set(gca,'YTick',[0.98:0.01:1.08]);
set(gca,'FontSize',font)
set(gca,'TickLabelInterpreter','latex')
%%
g=9.81;
a_vect=[1 5 10 50]
for j=45:50
zmax=1+j*0.02;
zmin=1-j*0.02;
dx0=0.7;
incr =0.02;
cost=[];
X0=[];
S=[];
tspan3=[0 5];
a=2.4;
for i=1:10000;
dx0=dx0+incr;
  
t=[];
x1=[];
x2=[];
xf=[];
    
aplus =a;
amin=-a;
if(aplus>9.81)
    amin=-9.81;
end
t1=sqrt(2*(zmin-1)/(amin+amin*amin/-aplus));
t2=t1*amin/-aplus;
tspan1=[0 t1];
tspan2=[0 t2];
[t,x1] = ode45(@(t,x) penDynFcn(t,x,amin),tspan1,[-sqrt(1/9.81),dx0,1.0,0.0]);

[t,x2] = ode45(@(t,x) penDynFcn(t,x,aplus),tspan2,x1(end,:));

[t,xf] = ode45(@(t,x) penDynFcn(t,x,0),tspan3,x2(end,:));

s = find(xf(:,2) <0.00001,1);


if(length(s)==0)
    cost(i)=100;
else
    cost(i)=(xf(s,1))^2;
end

X0(i)=dx0;

if(cost(i)<10^-9)
    dx0=dx0-incr;
    S(i)=s;
    break;
end

if(length(cost)>1)
    if((cost(i-1)<cost(i)))
        dx0=dx0-incr;
        incr=incr/2;
    elseif((cost(i)>99))
        dx0=dx0-incr;
        incr=incr/2;
    end
end
end
dCPthes3(j)=dx0
end
%%
set(groot,'defaulttextinterpreter','latex');  
hold on;
for i=1:4
incr =0.01;
if(i==1)
    a=2.45;
elseif(i==2)
     a=4.9;
elseif (i==3)
     a=9.81;
else
    a=49;
end

t=[];
x1=[];
x2=[];
xf=[];

aplus =a;
amin=-a;
if(aplus>9.81)
    amin=-9.81;
end
t1=sqrt(2*(zmin-1)/(amin+amin*amin/-aplus));
t2=t1*amin/-aplus;
tspan1=[0 t1];
tspan2=[0 t2];
[t,x1] = ode45(@(t,x) penDynFcn(t,x,amin),tspan1,[dCPthes3(i),1.0,1.0,0.0]);

[t,x2] = ode45(@(t,x) penDynFcn(t,x,aplus),tspan2,x1(end,:));

[t,xf] = ode45(@(t,x) penDynFcn(t,x,0),tspan3,x2(end,:));

s=find(xf(:,2)<0.00001,1);

plot([x1(:,1); x2(:,1); xf(1:s,1)]-dCPthes3(i), [x1(:,3); x2(:,3); xf(1:s,3)], 'Color','k')
x=[x1; x2; xf];
plot([-dCPthes3(i) -dCPthes3(i)],[0 zmin], 'Color','k','LineStyle','--');
r=find(x(:,3) < 1.0-0.015*i,1);
str = "$\leftarrow \ddot{z}_c=$" +num2str(a);
text(x(r,1)-dCPthes3(i),x(r,3),str,'FontSize',font)
end

g=9.81;
dzmin=1-zmin;
zminfreqafterfall=(z0-dzmin)/(sqrt((z0-dzmin)*g)+sqrt(2*dzmin*g));
tzmin = sqrt(2*dzmin/g);
tspanzmin = [0:0.001:tzmin];
    [tbal,ybal]= ode45(@qfunbal, tspanzmin, [0;1;1;0]);
    pMinHeight = plot(ybal(:,1),ybal(:,3),'Color','b','LineWidth',2);
    plot([1*tzmin 1*tzmin+1*zminfreqafterfall],[1 1]*zmin,'Color','b','LineWidth',2);
    plot([1 1]*(tzmin+zminfreqafterfall), [0 zmin],'Color','b');
    axis equal
    axis([0 0.5 0.6 1.3])
    set(gca,'TickLabelInterpreter','latex')
      ylabel("$z$ [m]",'FontSize', font)
xlabel("Capture Position [m]",'FontSize', font)
    set(gca,'LineWidth',1)
% set(gca,'XTick',[0:0.05:1])
% set(gca,'YTick',[0.98:0.01:1.08]);
set(gca,'FontSize',font)
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
exportfig(gcf,'CPZvsForce.eps', opts)