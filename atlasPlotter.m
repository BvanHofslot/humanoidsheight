set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

t0 =1.5;
tf=5.3;
fS=20;

figure('rend','painters','pos', [0 0 600 200]);
hold on;
load('atlasHardwareHFBonHFB.mat')
zh=centerOfMassZ;
load('atlasHardwareNormalonHFB.mat')
zd=centerOfMassZ;
dz = zd(1)-zh(1);
zh=zh+dz;
anih = animatedline('LineWidth',2,'Color','b','LineStyle','--');
anid = animatedline('LineWidth',2,'Color','k','LineStyle','--');
set(gca,'XLim',[t0 tf],'YLim',[1.05 1.19]);
xlabel('Time [s]')
ylabel('$z$ [m]')
set(gca,'FontSize',fS)
scatter(t0,zh(1),'filled','MarkerFaceColor','k','MarkerEdgeColor','k');
plot([t0 tf], (1.18)*[1 1],'Color','r','LineWidth',2)
for i=1:length(zh)
        addpoints(anih,i*0.001,zh(i));
        addpoints(anid,i*0.001,zd(i));
        drawnow update
        F(i) =getframe(gcf);
        pause(0.0001)
        i
end

video = VideoWriter('z.avi','Uncompressed AVI')
open(video)
writeVideo(video,F)
close(video)

%%
figure('rend','painters','pos', [0 0 600 200]);
hold on;
load('atlasHardwareHFBonHFB.mat')
zh=sign(leftSoleDesiredCoPX).*sqrt(leftSoleDesiredCoPX.^2+leftSoleDesiredCoPY.^2)-sign(leftSoleDesiredCoPX(1))*sqrt(leftSoleDesiredCoPX(1)^2+leftSoleDesiredCoPY(1)^2);
mh=sqrt((CenterOfPressureX-desiredCMPX(1)).^2+(CenterOfPressureY-desiredCMPY(1)).^2);
load('atlasHardwareNormalonHFB.mat')
zd=sign(leftSoleDesiredCoPX).*sqrt(leftSoleDesiredCoPX.^2+leftSoleDesiredCoPY.^2)-sign(leftSoleDesiredCoPX(1))*sqrt(leftSoleDesiredCoPX(1)^2+leftSoleDesiredCoPY(1)^2);
md=sign(CenterOfPressureX-desiredCMPX(1)).*sqrt((CenterOfPressureX-desiredCMPX(1)).^2+(CenterOfPressureY-desiredCMPY(1)).^2);
dz = zd(1)-zh(1);
zh=zh+dz;
anih = animatedline('LineWidth',2,'Color','b');
anid = animatedline('LineWidth',2,'Color','k');
anihm = animatedline('LineWidth',2,'Color','b','LineStyle','--');
anidm = animatedline('LineWidth',2,'Color','k','LineStyle','--');
set(gca,'XLim',[t0 tf],'YLim',[-0.01 0.17]);
xlabel('Time [s]')
ylabel('$x_{cop}$ [m]')
set(gca,'FontSize',fS)
scatter(t0,zh(1),'filled','MarkerFaceColor','k','MarkerEdgeColor','k');
for i=1:length(zh)
        addpoints(anih,i*0.001,zh(i));
        addpoints(anid,i*0.001,zd(i));
        addpoints(anihm,i*0.001,mh(i));
        addpoints(anidm,i*0.001,md(i));
        drawnow update
        F(i) =getframe(gcf);
        pause(0.0001)
        i
end

video = VideoWriter('cop.avi','Uncompressed AVI')
open(video)
writeVideo(video,F)
close(video)
%%
figure('rend','painters','pos', [0 0 600 200]);
hold on;
load('atlasHardwareHFBonHFB.mat')
zh=desiredMomentumRateLinearZ;
ah=achievedMomentumRateLinearZ;
load('atlasHardwareNormalonHFB.mat')
zd=desiredMomentumRateLinearZ;
ad=achievedMomentumRateLinearZ;
dz = zd(1)-zh(1);
zh=zh+dz;
anih = animatedline('LineWidth',2,'Color','b');
anid = animatedline('LineWidth',2,'Color','k');
aniha = animatedline('LineWidth',2,'Color','b','LineStyle','-.');
anida = animatedline('LineWidth',2,'Color','k','LineStyle','-.');
set(gca,'XLim',[t0 tf],'YLim',[-520 520]);
xlabel('Time [s]')
ylabel('$\dot{\mathbf{l}}_{d,z}$ [m]')
set(gca,'FontSize',fS)
scatter(t0,zh(1),'filled','MarkerFaceColor','k','MarkerEdgeColor','k');
for i=1:length(zh)
        addpoints(anih,i*0.002,zh(i));
        addpoints(anid,i*0.002,zd(i));
        addpoints(aniha,i*0.002,ah(i));
        addpoints(anida,i*0.002,ad(i));
        drawnow update
        F(i) =getframe(gcf);
        pause(0.0001)
        i
end

video = VideoWriter('lz.avi','Uncompressed AVI')
open(video)
writeVideo(video,F)
close(video)

%%
pW=1.3;
fS=12;
set(groot,'defaulttextinterpreter','latex');  
figure('rend','painters','pos', [0 0 600 200]);

load('atlasHardwareDEFkVel40.mat');
hor= sqrt((estimatedCenterOfMassPositionX-estimatedCenterOfMassPositionX(1)).^2 + (estimatedCenterOfMassPositionY-estimatedCenterOfMassPositionY(1)).^2);
dhor= -sign(estimatedCenterOfMassVelocityX).*sqrt(estimatedCenterOfMassVelocityX.^2 + estimatedCenterOfMassVelocityY.^2);
plot(hor,dhor,'Color','k','LineWidth',pW); hold on;


load('atlasHardwareHFBkVel40.mat');
hor= sqrt((estimatedCenterOfMassPositionX-estimatedCenterOfMassPositionX(1)).^2 + (estimatedCenterOfMassPositionY-estimatedCenterOfMassPositionY(1)).^2);
dhor= -sign(estimatedCenterOfMassVelocityX).*sqrt(estimatedCenterOfMassVelocityX.^2 + estimatedCenterOfMassVelocityY.^2);

plot(hor,dhor,'Color','b','LineWidth',pW); hold on;

axis([0 0.2 -0.4 0.4])
xlabel('$x$ [m]','FontSize',fS)
ylabel('$\dot{x}$ [m/s]','FontSize',fS)
legend({'Vertical Motion','Default'},'FontSize',fS)
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'valcomparephaseHW.eps', opts)

%%
DT=0.001;
set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');
pW=1.3;
fS=18;
kGray=0.85;
lastP= 1800;

load('atlasHardwareDEFkVel40.mat')
z = centerOfMassZ;
iF = length(z);

t1=[0:0.001:3];

figure('rend','painters','pos', [0 0 600 500]);
subplot(3,1,1)
hold on;
load('atlasHardwareDEFkVel40.mat')
ldz = desiredMomentumRateLinearZ;
laz= achievedMomentumRateLinearZ;
p1=plot(t1,ldz(1500:4500),'Color','k','LineStyle','-','LineWidth',pW);
hold on;
p2=plot(t1,laz(1500:4500),'Color','k','LineStyle','-.','LineWidth',pW);

load('atlasHardwareHFBkVel40.mat')
ldz = desiredMomentumRateLinearZ;
laz = achievedMomentumRateLinearZ;
plot(t1,ldz(1500:4500),'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,laz(1500:4500),'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 3 -600 600])
ylabel('$\dot{\mathbf{l}}_z$ [N]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(3,1,2)
hold on;
load('atlasHardwareDEFkVel40.mat')
ldz = estimatedCenterOfMassPositionZ - estimatedCenterOfMassPositionZ(1) +1.1;
p1=plot(t1,ldz(1500:4500),'Color','k','LineStyle','--','LineWidth',pW);


load('atlasHardwareHFBkVel40.mat')
ldz = estimatedCenterOfMassPositionZ- estimatedCenterOfMassPositionZ(1) +1.1;
plot(t1,ldz(1500:4500),'Color','b','LineStyle','--','LineWidth',pW);
axis([0 3 1.08 1.18])
ylabel('$z$ [m]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(3,1,3)
hold on;
load('atlasHardwareDEFkVel40.mat')
ldz = sqrt(r_leg_akyLowLevelDesiredTorqueHHLCM.^2+l_leg_akyLowLevelDesiredTorqueHHLCM.^2);
laz= sqrt(filt_tau_l_leg_aky_sp0.^2+filt_tau_r_leg_aky_sp0.^2);
p1=plot(t1,ldz(1500:4500),'Color','k','LineStyle','-','LineWidth',pW);
hold on;
p2=plot(t1,laz(1500:4500),'Color','k','LineStyle','--','LineWidth',pW);

load('atlasHardwareHFBkVel40.mat')
ldz = sqrt(r_leg_akyLowLevelDesiredTorqueHHLCM.^2+l_leg_akyLowLevelDesiredTorqueHHLCM.^2);
laz= sqrt(filt_tau_l_leg_aky_sp0.^2+filt_tau_r_leg_aky_sp0.^2);
plot(t1,ldz(1500:4500),'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,laz(1500:4500),'Color','b','LineStyle','--','LineWidth',pW);
axis([0 3 0 250])
ylabel('$\tau_{ak,y}$ [N]','FontSize',fS)
xlabel('Time [s]','FontSize',fS)
set(gca,'FontSize',fS)

opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'atlascomparetimeHW.eps', opts)

%%
set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

figure('rend','painters','pos', [0 0 600 600]);
hold on;
box on;
grid on;
fS=14;
load('walkingHWforvideo.mat')
load('walkingHWfeetforvideo.mat')
load('walkingHWds.mat')
x=estimatedCenterOfMassPositionX;
y=estimatedCenterOfMassPositionY;
z=estimatedCenterOfMassPositionZ;
cmpx=desiredCMPX;
cmpy=desiredCMPY;

%ylabel('$\dot{\mathbf{l}}_{d,z}$ [m]')

%scatter(t0,zh(1),'filled','MarkerFaceColor','k','MarkerEdgeColor','k');

FR=10;
for i=300:length(z)/FR
        figure('rend','painters','pos', [0 0 600 600]);
        set(gcf,'color','w');
hold on;
box on;
grid on;
axis equal
 view(157.5,20)
        set(gca,'XLim',[2.3 3.8],'YLim',[-0.35 0.1],'ZLim',[0 1.3]);
        j=i*FR;
        pcom=plot3(x(1:j),y(1:j),z(1:j),'Color',[0 0.18 1],'LineWidth',1.5)
        pcmp=plot3(cmpx(1:j),cmpy(1:j),zeros(length(cmpy(1:j)),1),'Color','r','LineWidth',1.5)
        head = com3D(x(j),y(j),z(j),0.03,20);
        
        pfoot=plot3([leftFootPolygon_0_x(j) leftFootPolygon_1_x(j)], [leftFootPolygon_0_y(j) leftFootPolygon_1_y(j)], [0 0], 'Color',[0 0.4 0],'LineWidth',1.5);
    plot3([leftFootPolygon_1_x(j) leftFootPolygon_2_x(j)], [leftFootPolygon_1_y(j) leftFootPolygon_2_y(j)], [0 0], 'Color',[0 0.4 0],'LineWidth',1.5);
    plot3([leftFootPolygon_2_x(j) leftFootPolygon_3_x(j)], [leftFootPolygon_2_y(j) leftFootPolygon_3_y(j)], [0 0], 'Color',[0 0.4 0],'LineWidth',1.5);
    plot3([leftFootPolygon_3_x(j) leftFootPolygon_0_x(j)], [leftFootPolygon_3_y(j) leftFootPolygon_0_y(j)], [0 0], 'Color',[0 0.4 0],'LineWidth',1.5);
    
     plot3([rightFootPolygon_0_x(j) rightFootPolygon_1_x(j)], [rightFootPolygon_0_y(j) rightFootPolygon_1_y(j)], [0 0], 'Color',[0 0.4 0],'LineWidth',1.5);
    plot3([rightFootPolygon_1_x(j) rightFootPolygon_2_x(j)], [rightFootPolygon_1_y(j) rightFootPolygon_2_y(j)], [0 0], 'Color',[0 0.4 0],'LineWidth',1.5);
    plot3([rightFootPolygon_2_x(j) rightFootPolygon_3_x(j)], [rightFootPolygon_2_y(j) rightFootPolygon_3_y(j)], [0 0], 'Color',[0 0.4 0],'LineWidth',1.5);
    plot3([rightFootPolygon_3_x(j) rightFootPolygon_0_x(j)], [rightFootPolygon_3_y(j) rightFootPolygon_0_y(j)], [0 0], 'Color',[0 0.4 0],'LineWidth',1.5);
    plot3([cmpx(j) x(j)], [cmpy(j) y(j)], [0 z(j)], 'Color','k','LineWidth',1.5)
    [rx ry rz] = sphere;
    a=0.005;
    surf(cmpx(j)+rx*a,cmpy(j)+ry*a,rz*a)
    legend([pcom pcmp pfoot],{'Center of Mass', 'Center of Pressure', 'Foot Polygon'},'Location','northwest')
        xticks([2.3:0.1:3.8])
yticks([-0.35:0.2:0.1])
zticks([0.0:0.1:1.3])
xlabel('$x$ [m]')
ylabel('$y$ [m]')
zlabel('$z$ [m]')
set(gca,'FontSize',fS)
        pause(0.001)
        saveas(gcf,sprintf('ath%d.png',i))
        close(gcf)
        figure('rend','painters','pos', [0 0 600 200]);
%         ds = controllerIsInDoubleSupport;
%         if(i==1)
%            
%         elseif(ds(i)==1 && ds(i-1)==1)
%             area([(i-1)/1000 i/1000],[1000 1000], 'FaceColor',[1 1 1]*0.8,'LineStyle','none','ShowBaseLine','off')
%             hold on;
%             area([(i-1)/1000 i/1000],[-1000 -1000], 'FaceColor',[1 1 1]*0.8,'LineStyle','none','ShowBaseLine','off')
%         end
        t=[0:1:length(desiredMomentumRateLinearZ)-1]/1000;
        plot(t(1:j),desiredMomentumRateLinearZ(1:j),'Color','b','LineWidth',1.5);
        set(gca,'XLim',[0 6],'YLim',[-1200 1200]);
        xlabel('Time [s]')
ylabel('$\dot{\mathbf{l}}_{d,z}$ [N]')
set(gca,'FontSize',fS)
        pause(0.001)
        saveas(gcf,sprintf('atldz%d.png',i))
        close(gcf)
end

%%
writerObj = VideoWriter('YourAVI.avi');
open(writerObj);
for K = 1:length(z)/FR
  filename = sprintf('ath%d.png', K);
  thisimage = imread(filename);
  writeVideo(writerObj, thisimage);
  pause(0.001)
end
close(writerObj);

writerObj = VideoWriter('YourAVI1.avi');
open(writerObj);
for K = 1:length(z)/FR
  filename = sprintf('atldz%d.png', K);
  thisimage = imread(filename);
  writeVideo(writerObj, thisimage);
  pause(0.001)
end
close(writerObj);
%%
set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

figure('rend','painters','pos', [0 0 600 600]);
hold on;
box on;
grid on;
fS=12;
eikx=2.3;
load('walkingHWTest.mat')
x=estimatedCenterOfMassPositionX-eikx;
y=estimatedCenterOfMassPositionY;
z=estimatedCenterOfMassPositionZ;
cmpx=desiredCMPX-eikx;
cmpy=desiredCMPY;
axis equal
set(gca,'XLim',[0 1.45],'YLim',[-0.35 0.1],'ZLim',[0 1.3]);
xticks([0:0.1:1.4])
yticks([-0.3:0.1:0.1])
zticks([0.0:0.1:1.3])
xlabel('$x$ [m]')
ylabel('$y$ [m]')
zlabel('$z$ [m]')
%ylabel('$\dot{\mathbf{l}}_{d,z}$ [m]')
set(gca,'FontSize',fS)
%scatter(t0,zh(1),'filled','MarkerFaceColor','k','MarkerEdgeColor','k');
view(157.5,15)
plot3(x,y,z,'Color',[0 0.18 1],'LineWidth',1.5)
plot3(cmpx,cmpy,zeros(length(cmpy),1),'Color','r','LineWidth',1.5)
n=300;
% for i=1:round(length(z)/n)
%     com3D(x(i*n),y(i*n),z(i*n),0.03,20);
%     plot3([cmpx(i*n) x(i*n)], [cmpy(i*n) y(i*n)], [0 z(i*n)], 'Color','k','LineWidth',1.5)
%     [rx ry rz] = sphere;
%     a=0.005;
%     surf(cmpx(i*n)+rx*a,cmpy(i*n)+ry*a,rz*a)
% end
load('walkingHWfeet.mat')
for i=1:4
    if(i==1)
        j=1;
    end
     if(i==2)
        j=3048-1476;
     end
     if(i==3)
        j=4402-1476;
     end
     if(i==4)
        j=6327-1476;
    end
    plot3([leftFootPolygon_0_x(j) leftFootPolygon_1_x(j)]-eikx, [leftFootPolygon_0_y(j) leftFootPolygon_1_y(j)], [0 0], 'Color','g');
    plot3([leftFootPolygon_1_x(j) leftFootPolygon_2_x(j)]-eikx, [leftFootPolygon_1_y(j) leftFootPolygon_2_y(j)], [0 0], 'Color','g');
    plot3([leftFootPolygon_2_x(j) leftFootPolygon_3_x(j)]-eikx, [leftFootPolygon_2_y(j) leftFootPolygon_3_y(j)], [0 0], 'Color','g');
    plot3([leftFootPolygon_3_x(j) leftFootPolygon_0_x(j)]-eikx, [leftFootPolygon_3_y(j) leftFootPolygon_0_y(j)], [0 0], 'Color','g');
    
     plot3([rightFootPolygon_0_x(j) rightFootPolygon_1_x(j)]-eikx, [rightFootPolygon_0_y(j) rightFootPolygon_1_y(j)], [0 0], 'Color','g');
    plot3([rightFootPolygon_1_x(j) rightFootPolygon_2_x(j)]-eikx, [rightFootPolygon_1_y(j) rightFootPolygon_2_y(j)], [0 0], 'Color','g');
    plot3([rightFootPolygon_2_x(j) rightFootPolygon_3_x(j)]-eikx, [rightFootPolygon_2_y(j) rightFootPolygon_3_y(j)], [0 0], 'Color','g');
    plot3([rightFootPolygon_3_x(j) rightFootPolygon_0_x(j)]-eikx, [rightFootPolygon_3_y(j) rightFootPolygon_0_y(j)], [0 0], 'Color','g');
end

for i=1:12
    n=2184;
    plot3([cmpx(2184+200*i-200) x(2184+200*i-200)],[-0.35 -0.35],[0 z(2184+200*i-200)], 'Color','y')  
    n=200
     com3D(x(2184+200*i-200),y(2184+200*i-200),z(2184+200*i-200),0.03,20);
    plot3([cmpx(2184+200*i-200) x(2184+200*i-200)], [cmpy(2184+200*i-200) y(2184+200*i-200)], [0 z(2184+200*i-200)], 'Color','k','LineWidth',1.5)
    [rx ry rz] = sphere;
    a=0.005;
    surf(cmpx(2184+200*i-200)+rx*a,cmpy(2184+200*i-200)+ry*a,rz*a)
end

opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
set(gca,'FontSize',fS)
exportfig(gcf,'walkingHW.eps', opts)

%%
load('walkingHWldz.mat')
   figure('rend','painters','pos', [0 0 600 200]);
%         end
        t=[0:1:length(desiredMomentumRateLinearZ)-1]/1000;
        
        hold on;
        box on;
        set(gca,'XLim',[0 6],'YLim',[-1200 1200]);
        for i=1:12
            plot([1 1]*(3660+200*i-200)/1000-1,[-1200 1200], 'Color','y')
        end
        plot(t-1,desiredMomentumRateLinearZ,'Color',[0 0.176 1],'LineWidth',1.5);
        xlabel('Time [s]')
ylabel('$\dot{\mathbf{l}}_{d,z}$ [N]')
set(gca,'FontSize',fS)
        pause(0.001)
       exportfig(gcf,'walkingHWldz.eps', opts)
  

%%
figure;
hold on;
for i=1:21
load(sprintf('def%d.mat',i))
% x=estimatedCenterOfMassPositionX-estimatedCenterOfMassPositionX(1);
% s=find(x>0.075,1)
% if(isempty(s))
%     continue;
% end
dx=estimatedCenterOfMassVelocityX;
s=find(dx>0.01,1)
s1=find(dx>0.1,1)
if(s1-s<3)
    s=s-50;
end
x=estimatedCenterOfMassPositionX;
y=estimatedCenterOfMassPositionX;
dx=estimatedCenterOfMassVelocityX;
dy=estimatedCenterOfMassVelocityX;

hor =sqrt((x-x(1)).^2+(y-y(1)).^2);
dhor= sign(dx).*sqrt((dx-dx(1)).^2+(dy-dy(1)).^2);
plot(hor(s:s+2700),dhor(s:s+2700),'Color','k');
%plot(hor(s:s+2700),'Color','k')
end

for i=1:21
load(sprintf('hfb%d.mat',i))
% x=estimatedCenterOfMassPositionX-estimatedCenterOfMassPositionX(1);
% s=find(x>0.088,1)
% if(~isempty(s))
%     continue;
% end
dx=estimatedCenterOfMassVelocityX;
s=find(dx>0.01,1)
s1=find(dx>0.1,1)
if(s1-s<2)
    s=s-120;
end

x=estimatedCenterOfMassPositionX;
y=estimatedCenterOfMassPositionX;
dx=estimatedCenterOfMassVelocityX;
dy=estimatedCenterOfMassVelocityX;

hor =sqrt((x-x(1)).^2+(y-y(1)).^2);
dhor= sign(dx).*sqrt((dx-dx(1)).^2+(dy-dy(1)).^2);
plot(hor(s:s+2700),dhor(s:s+2700),'Color','b');
%plot(hor(s:s+2700),'Color','b')
end


%%
set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');
figure('rend','painters','pos', [0 0 800 400],'DefaultAxesPosition', [0.1, 0.15, 0.88, 0.8]);;
box on;
n=21;
fS=14;
N=2700;
HOR=zeros(n,N+1);
% DHOR=zeros(n,N+1);
hold on;
for i=1:n
load(sprintf('def%d.mat',i))
% x=estimatedCenterOfMassPositionX-estimatedCenterOfMassPositionX(1);
% s=find(x>0.075,1)
% if(isempty(s))
%     continue;
% end
dx=estimatedCenterOfMassVelocityX;
s=find(dx>0.01,1)
s1=find(dx>0.1,1)
if(s1-s<3)
    s=s-50;
end
if(i==6)
    continue
end
x=estimatedCenterOfMassPositionX;
y=estimatedCenterOfMassPositionX;
dx=estimatedCenterOfMassVelocityX;
dy=estimatedCenterOfMassVelocityX;
hor =sqrt((x-x(1)).^2+(y-y(1)).^2);
dhor= sign(dx).*sqrt((dx-dx(1)).^2+(dy-dy(1)).^2);
HOR(i,:)=hor(s:s+N);
DHOR(i,:)=dhor(s:s+N);
plot(hor(s:s+N),dhor(s:s+N),'Color',[0,0,0,0.3]);
end

% for i=2:length(HOR(1,:))-1
%     xmin=mean(HOR(:,i-1:i+1))-std(HOR(:,i-1:i+1));
%     xmax=mean(HOR(:,i-1:i+1))+std(HOR(:,i-1:i+1));
%     dxmin=mean(DHOR(:,i-1:i+1))-std(DHOR(:,i-1:i+1));
%     dxmax=mean(DHOR(:,i-1:i+1))+std(DHOR(:,i-1:i+1));
%     %fill([xmin';flipud(xmax')],[dxmin';flipud(dxmax')],[.9 .9 .9],'linestyle','none');
% end
% 

HORh=zeros(n,N+1);
DHORh=zeros(n,N+1);
for i=1:n
load(sprintf('hfb%d.mat',i))
% x=estimatedCenterOfMassPositionX-estimatedCenterOfMassPositionX(1);
% s=find(x>0.088,1)
% if(~isempty(s))
%     continue;
% end
dx=estimatedCenterOfMassVelocityX;
s=find(dx>0.01,1)
s1=find(dx>0.1,1)
if(s1-s<2)
    s=s-107;
end
if(i==20 || i==7)
    continue
end
x=estimatedCenterOfMassPositionX;
y=estimatedCenterOfMassPositionX;
dx=estimatedCenterOfMassVelocityX;
dy=estimatedCenterOfMassVelocityX;

hor =sqrt((x-x(1)).^2+(y-y(1)).^2);
dhor= sign(dx).*sqrt((dx-dx(1)).^2+(dy-dy(1)).^2);
HORh(i,:)=hor(s:s+N);
DHORh(i,:)=dhor(s:s+N);
%plot(hor,dhor,'Color','b');
plot(hor(s:s+N),dhor(s:s+N),'Color',[0,0.18,1,0.3]);
alpha(0.9)
end


% for i=2:length(HORh(1,:))-1
%     xmin=mean(HORh(:,i-1:i+1))-std(HORh(:,i-1:i+1));
%     xmax=mean(HORh(:,i-1:i+1))+std(HORh(:,i-1:i+1));
%     dxmin=mean(DHORh(:,i-1:i+1))-std(DHORh(:,i-1:i+1));
%     dxmax=mean(DHORh(:,i-1:i+1))+std(DHORh(:,i-1:i+1));
%     %fill([xmin';flipud(xmax')],[dxmin';flipud(dxmax')],[0.6 0.6 .98],'linestyle','none');
% end
p2=plot(median(HOR),median(DHOR),'Color','k','LineWidth',3);
p1=plot(median(HORh),median(DHORh),'Color',[0 0.18 1],'LineWidth',3);

axis([0 0.13 -0.25 0.5])
xlabel('$x$ [m]','FontSize',fS);
ylabel('$\dot{x}$ [m/s]','FontSize',fS);
%legend([p1 p2],{'Vertical Motion','Default'},'FontSize',fS)
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 100000;
%set(gca,'LineWidth',1)
%set(gca,'GridAlpha',0.4)
set(gca,'FontSize',fS)
saveas(gcf,'atlasphaseHW.png')
%exportfig(gcf,'atlasphaseHW.eps', opts)