
set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

pW=1.3;
fS=18;
kGray=0.85;
i0=3.92/0.004;
DT=0.004;
figure('rend','painters','pos', [0 0 1000 450]);
load('walkingBack053HFB.mat')
subplot(3,2,1)
area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
area([0.705 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.71 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

ldz = desiredMomentumRateLinearZ;

hold on;
p1=plot(t(i0:end)-3.92,ldz(i0:end),'Color','b','LineStyle','-','LineWidth',pW);
axis([0 0.85 -800 800])
ylabel('$\dot{\mathbf{l}}_{z,d}$ [N]','FontSize',fS)
set(gca,'FontSize',fS)
load('walkingBack053DEF.mat')
ldz = desiredMomentumRateLinearZ;
plot(t(i0:end)-3.92,ldz(i0:end),'Color','k','LineStyle','-','LineWidth',pW);

load('walkingBack053HFB.mat')
subplot(3,2,3)
area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
area([0.725 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.725 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

z = estimatedCenterOfMassPositionZ;
zmax=zMaxHeightCtrl;

hold on;
p1=plot(t(i0:end)-3.92,z(i0:end),'Color','b','LineStyle','--','LineWidth',pW);
p2=plot(t(i0:end)-3.92,zmax(i0:end),'Color','r','LineStyle','-','LineWidth',pW);
p3=plot(t(i0:end)-3.92,0.88*ones(1,length(zmax(i0:end))),'Color','r','LineStyle','-','LineWidth',pW);
axis([0 0.85 0.86 1.12])
ylabel('$z$ [m]','FontSize',fS)
set(gca,'FontSize',fS)
load('walkingBack053DEF.mat')
z = estimatedCenterOfMassPositionZ;
plot(t(i0:end)-3.92,z(i0:end),'Color','k','LineStyle','--','LineWidth',pW);

load('walkingFrontal105HFB.mat')
subplot(3,2,2)
area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
area([0.725 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.725 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

ldz = desiredMomentumRateLinearZ;

hold on;
p1=plot(t(i0:end)-3.92,ldz(i0:end),'Color','b','LineStyle','-','LineWidth',pW);
axis([0 0.85 -800 800])

set(gca,'FontSize',fS)
load('walkingFrontal105DEF.mat')
ldz = desiredMomentumRateLinearZ;
plot(t(i0:end)-3.92,ldz(i0:end),'Color','k','LineStyle','-','LineWidth',pW);

load('walkingFrontal105HFB.mat')
subplot(3,2,4)
area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
area([0.725 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.725 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

z = estimatedCenterOfMassPositionZ;
zmax=zMaxHeightCtrl;

hold on;
p1=plot(t(i0:end)-3.92,z(i0:end),'Color','b','LineStyle','--','LineWidth',pW);
p2=plot(t(i0:end)-3.92,zmax(i0:end),'Color','r','LineStyle','-','LineWidth',pW);
p3=plot(t(i0:end)-3.92,0.88*ones(1,length(zmax(i0:end))),'Color','r','LineStyle','-','LineWidth',pW);

axis([0 0.85 0.86 1.12])
set(gca,'FontSize',fS)
load('walkingFrontal105DEF.mat')
z = estimatedCenterOfMassPositionZ;
plot(t(i0:end)-3.92,z(i0:end),'Color','k','LineStyle','--','LineWidth',pW);



load('walkingBack053HFB.mat')
subplot(3,2,5)
area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
area([0.725 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.725 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

icpd = desiredICPX;
icp=capturePointX;

hold on;
p1=plot(t(i0:end)-3.92,icpd(i0:end),'Color','b','LineStyle','-','LineWidth',pW);
plot(t(i0:end)-3.92,icp(i0:end),'Color','b','LineStyle','--','LineWidth',pW);
axis([0 0.85 1.5 2.1])

set(gca,'FontSize',fS)
load('walkingBack053DEF.mat')
icpd = desiredICPX;
icp=capturePointX;
p1=plot(t(i0:end)-3.92,icpd(i0:end),'Color','k','LineStyle','-','LineWidth',pW);
plot(t(i0:end)-3.92,icp(i0:end),'Color','k','LineStyle','--','LineWidth',pW);

% load('walkingBack053HFB.mat')
% subplot(4,2,7)
% area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
% hold on;
% area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
% area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
% hold on;
% area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
% area([0.725 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
% hold on;
% area([0.725 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
% 
% icpd = desiredICPY;
% icp=capturePointY;
% 
% hold on;
% p1=plot(t(i0:end)-3.92,icpd(i0:end),'Color','b','LineStyle','-','LineWidth',pW);
% plot(t(i0:end)-3.92,icp(i0:end),'Color','b','LineStyle','--','LineWidth',pW);
% axis([0 0.85 -800 800])
% ylabel('$\dot{\mathbf{l}}_{z,d}$ [N]','FontSize',fS)
% set(gca,'FontSize',fS)
% 
% load('walkingBack053DEF.mat')
% icpd = desiredICPY;
% icp=capturePointY;
% p1=plot(t(i0:end)-3.92,icpd(i0:end),'Color','k','LineStyle','-','LineWidth',pW);
% plot(t(i0:end)-3.92,icp(i0:end),'Color','k','LineStyle','--','LineWidth',pW);
% 
% axis([0 0.85 -0.1 0.1])
ylabel('$\xi_x$ [m]','FontSize',fS)
xlabel('Time [s]','FontSize',fS)
set(gca,'FontSize',fS)
load('walkingBack053DEF.mat')
z = estimatedCenterOfMassPositionZ;
plot(t(i0:end)-3.92,z(i0:end),'Color','k','LineStyle','--','LineWidth',pW);

load('walkingFrontal105HFB.mat')
subplot(3,2,6)
area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
area([0.725 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.725 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

icpd = desiredICPX;
icp=capturePointX;

hold on;
p1=plot(t(i0:end)-3.92,icpd(i0:end),'Color','b','LineStyle','-','LineWidth',pW);
plot(t(i0:end)-3.92,icp(i0:end),'Color','b','LineStyle','--','LineWidth',pW);
axis([0 0.8 1.4 2])

set(gca,'FontSize',fS)
load('walkingFrontal105DEF.mat')
icpd = desiredICPX;
icp=capturePointX;
p1=plot(t(i0:end)-3.92,icpd(i0:end),'Color','k','LineStyle','-','LineWidth',pW);
plot(t(i0:end)-3.92,icp(i0:end),'Color','k','LineStyle','--','LineWidth',pW);

% load('walkingFrontal105HFB.mat')
% subplot(4,2,8)
% area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
% hold on;
% area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
% area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
% hold on;
% area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
% area([0.725 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
% hold on;
% area([0.725 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
% 
% icpd = desiredICPY;
% icp=capturePointY;
% 
% hold on;
% p1=plot(t(i0:end)-3.92,icpd(i0:end),'Color','b','LineStyle','-','LineWidth',pW);
% plot(t(i0:end)-3.92,icp(i0:end),'Color','b','LineStyle','--','LineWidth',pW);
% axis([0 0.85 -800 800])
% ylabel('$\dot{\mathbf{l}}_{z,d}$ [N]','FontSize',fS)
% set(gca,'FontSize',fS)
% 
% load('walkingFrontal105DEF.mat')
% icpd = desiredICPY;
% icp=capturePointY;
% p1=plot(t(i0:end)-3.92,icpd(i0:end),'Color','k','LineStyle','-','LineWidth',pW);
% plot(t(i0:end)-3.92,icp(i0:end),'Color','k','LineStyle','--','LineWidth',pW);
% 
% axis([0 0.85 -0.1 0.1])
xlabel('Time [s]','FontSize',fS)
set(gca,'FontSize',fS)
load('walkingBack053DEF.mat')
z = estimatedCenterOfMassPositionZ;
plot(t(i0:end)-3.92,z(i0:end),'Color','k','LineStyle','--','LineWidth',pW);

opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
exportfig(gcf,'walkingplot.eps', opts)