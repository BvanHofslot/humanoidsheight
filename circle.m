function h = circle(x,y,r)
hold on
th = 0:pi/300:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit,'LineStyle', '-','LineWidth',2,'Color','k');
plot([x-r x+r],[y y],'Color','k');
plot([x x],[y-r y+r],'Color','k');

rspan = [0:0.0001:r];
xspan = x+rspan;
yspan = sqrt(r^2-rspan.^2)+y;
yconst= y*ones(1,length(xspan));
x2 = [xspan, fliplr(xspan)];
y2 = [yconst, fliplr(yspan)];
fill(x2,y2,'k');

rspan = -[0:0.0001:r];
xspan = x+rspan;
yspan = sqrt(r^2-rspan.^2)+y;
yconst= y*ones(1,length(xspan));
x2 = [xspan, fliplr(xspan)];
y2 = [yconst, fliplr(yspan)];
fill(x2,y2,'w');


rspan = -[0:0.0001:r];
xspan = x+rspan;
yspan = -sqrt(r^2-rspan.^2)+y;
yconst= y*ones(1,length(xspan));
x2 = [xspan, fliplr(xspan)];
y2 = [yconst, fliplr(yspan)];
fill(x2,y2,'k');

rspan = [0:0.0001:r];
xspan = x+rspan;
yspan = -sqrt(r^2-rspan.^2)+y;
yconst= y*ones(1,length(xspan));
x2 = [xspan, fliplr(xspan)];
y2 = [yconst, fliplr(yspan)];
fill(x2,y2,'w');