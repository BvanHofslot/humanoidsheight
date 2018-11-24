z0 = 1.08;
dz0 = 0.05;
zmax = 1.15;
zmin = 1.00;
ddzmax = 0.7*9.81;
ddzmin = -0.4*9.81;
gstar = -ddzmin;

a = (1/2)*(ddzmax + (ddzmax^2)/gstar);
b = dz0 + dz0*ddzmax/gstar;
c = z0-zmax + (1/2)*(dz0^2)/gstar;

tmaxhi = (-b + sqrt(b^2-4*a*c))/(2*a)
tmaxlo = (-b - sqrt(b^2-4*a*c))/(2*a)

dz0 = -0.05;

a = (1/2)*(ddzmin - (ddzmin^2)/ddzmax);
b = dz0 + dz0*ddzmin/ddzmax;
c = z0-zmin - (1/2)*(dz0^2)/ddzmax;

tminhi = (-b + sqrt(b^2-4*a*c))/(2*a)
tminlo = (-b - sqrt(b^2-4*a*c))/(2*a)

%%
angles = table2array(angleAndPercentWeight72(:,1));
weights = table2array(angleAndPercentWeight72(:,2));

incr = length(angles)-1;

for i = 1:incr
    angle = angles(i,:);
    weight = weights(i,:);
    plot([0 weight*cos(angle)], [0 weight*sin(angle)],'Color',[0.4 0.4 0.4])
    hold on;
    nextangle = angles(i+1,:);
    nextweight = weights(i+1,:);
    plot([0 nextweight*cos(nextangle)], [0 nextweight*sin(nextangle)],'Color',[0.4 0.4 0.4])
    plot([weight*cos(angle) nextweight*cos(nextangle)],[weight*sin(angle) nextweight*sin(nextangle)],'Color','k');
    hold on;
end
angle = angles(72,:);
    weight = weights(72,:);
    nextangle = angles(1,:);
    nextweight = weights(1,:);
    plot([weight*cos(angle) nextweight*cos(nextangle)],[weight*sin(angle) nextweight*sin(nextangle)],'Color','k');

%%
angles = table2array(angleAndPercentWeight72(:,1));
weights = table2array(angleAndPercentWeight72(:,2));

incr = length(angles)-1;

for i = 1:incr
    angle = angles(i,:);
    weight = weights(i,:);
    plot([0 weight*cos(angle)], [0 weight*sin(angle)],'Color',[0.4 0.4 0.4])
    hold on;
    nextangle = angles(i+1,:);
    nextweight = weights(i+1,:);
    plot([0 nextweight*cos(nextangle)], [0 nextweight*sin(nextangle)],'Color',[0.4 0.4 0.4])
    plot([weight*cos(angle) nextweight*cos(nextangle)],[weight*sin(angle) nextweight*sin(nextangle)],'Color','k');
    hold on;
end
angle = angles(72,:);
    weight = weights(72,:);
    nextangle = angles(1,:);
    nextweight = weights(1,:);
    plot([weight*cos(angle) nextweight*cos(nextangle)],[weight*sin(angle) nextweight*sin(nextangle)],'Color','k');


angles = table2array(angleAndPercentWeight72HeightTiles(:,1));
weights = table2array(angleAndPercentWeight72HeightTiles(:,2));

incr = length(angles)-1;

for i = 1:incr
    angle = angles(i,:);
    weight = weights(i,:);
    hold on;
    nextangle = angles(i+1,:);
    nextweight = weights(i+1,:);
    plot([weight*cos(angle) nextweight*cos(nextangle)],[weight*sin(angle) nextweight*sin(nextangle)],'Color','k');
    hold on;
end
angle = angles(72,:);
    weight = weights(72,:);
    nextangle = angles(1,:);
    nextweight = weights(1,:);
    plot([weight*cos(angle) nextweight*cos(nextangle)],[weight*sin(angle) nextweight*sin(nextangle)],'Color','k');

    %%
    
 figure;
angles = table2array(angleAndPercentWeight72TilesV2NormalHalfWayNormal(:,1));
weights = table2array(angleAndPercentWeight72TilesV2NormalHalfWayNormal(:,2));

incr = length(angles)-1;

for i = 1:incr
    angle = angles(i,:);
    weight = weights(i,:);
    plot([0 weight*cos(angle)], [0 weight*sin(angle)],'Color',[0.4 0.4 0.4])
    hold on;
    nextangle = angles(i+1,:);
    nextweight = weights(i+1,:);
    plot([0 nextweight*cos(nextangle)], [0 nextweight*sin(nextangle)],'Color',[0.4 0.4 0.4])
    plot([weight*cos(angle) nextweight*cos(nextangle)],[weight*sin(angle) nextweight*sin(nextangle)],'Color','k');
    hold on;
end
angle = angles(72,:);
    weight = weights(72,:);
    nextangle = angles(1,:);
    nextweight = weights(1,:);
    plot([weight*cos(angle) nextweight*cos(nextangle)],[weight*sin(angle) nextweight*sin(nextangle)],'Color','k');


angles = table2array(angleAndPercentWeight72TilesV2NormalHalfWay(:,1));
weights = table2array(angleAndPercentWeight72TilesV2NormalHalfWay(:,2));

incr = length(angles)-1;

for i = 1:incr
    angle = angles(i,:);
    weight = weights(i,:);
    hold on;
    nextangle = angles(i+1,:);
    nextweight = weights(i+1,:);
    plot([weight*cos(angle) nextweight*cos(nextangle)],[weight*sin(angle) nextweight*sin(nextangle)],'Color','k');
    hold on;
end
angle = angles(72,:);
    weight = weights(72,:);
    nextangle = angles(1,:);
    nextweight = weights(1,:);
    plot([weight*cos(angle) nextweight*cos(nextangle)],[weight*sin(angle) nextweight*sin(nextangle)],'Color','k');
    
    
    %%
        %%
    
 figure;
angles = table2array(angleAndPercentWeight72TilesV2NormalHalfWayNormal(:,1));
weights = table2array(angleAndPercentWeight72TilesV2NormalHalfWayNormal(:,2));

wHNav = mean(weights)

polarplot(angles,weights);
ax = gca;
ax.ThetaTick = [0:20:340];
ax.ThetaTickMode = 'manual';
ax.ThetaMinorGrid = 'on';
ax.RMinorGrid = 'on';
ax.RLim = [0 2.5];
hold on;
angle = [angles(72) angles(1)];
weight = [weights(72) weights(1)];
polarplot(angle,weight);

angles = table2array(angleAndPercentWeight72TilesV2NormalHalfWay(:,1));
weights = table2array(angleAndPercentWeight72TilesV2NormalHalfWay(:,2));

wHav = mean(weights)

polarplot(angles,weights);
angle = [angles(72) angles(1)];
weight = [weights(72) weights(1)];
polarplot(angle,weight);

%%
        %%
    
figure;
angles = table2array(angleAndPercentWeight18TilesCoPStandingHigh01(:,1));
weights = table2array(angleAndPercentWeight18TilesCoPStandingHigh01(:,2));

wNav = mean(weights)

polarplot(angles,weights);
hold on;
angle = [angles(36) angles(1)];
weight = [weights(36) weights(1)];
polarplot(angle,weight);

angles = table2array(angleAndPercentWeight18TilesCoPStandingHigh01Normal(:,1));
weights = table2array(angleAndPercentWeight18TilesCoPStandingHigh01Normal(:,2));

wav = mean(weights)

polarplot(angles,weights);
angle = [angles(36) angles(1)];
weight = [weights(36) weights(1)];
polarplot(angle,weight);

ax = gca;
ax.ThetaTickMode = 'manual';
ax.ThetaTick = [0:20:340];
ax.ThetaMinorGrid = 'on';
ax.RMinorGrid = 'on';
title('High01');
%%
a=5;
g=9.81;
ta = sqrt(2*0.1/(a+(a^2)/g));
intomegat=sqrt(2/a)*sqrt(a*ta^2 + 2*1)*sqrt((a+g)/(1+0.5*a*ta^2))*log(sqrt(a)*sqrt(a*ta^2+2*1)+a*ta)
%%
x0=-0.31;
dx0=1.0;
z0=1.0;
dz0=0.0;

e=0.001;

for i=1:100
x0=x0+e;
tspan = [0:0.001:150];
[t,y] =ode45(@qfuna, tspan, [x0;dx0;z0;dz0]);

x = y(:,1);
dx = y(:,2);
z = y(:,3);
dz = y(:,4);

xf=x(end);
dxf=dx(end);
if((xf>-e) & (xf<e))
    if(dxf>-e & dxf<e)
    break;
    end
end
end

%%
x0=[-0.31 1.0 1.0 0.0];
xl=[-0.31 0.0 1.0 -1.0];
xu =[0.0 1.0 1.1 10.0];
x = simulannealbnd(@qfuna,x0,xl,xu)


