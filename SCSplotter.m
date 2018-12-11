
figure('rend','painters','pos', [0 0 1600 800]);
load('AtlasStraightLegFrontalPushSucceed.mat')
ar1 = area([1009*DT 1015*DT],[10 10]); 
hold on;
ar2=area([1009*DT 1015*DT],[-10 -10]); 
ar1.FaceColor='blue';ar2.FaceColor='blue';
ar1.EdgeColor='blue';ar2.EdgeColor='blue';
ar1.FaceAlpha=0.3;ar2.FaceAlpha=0.3; 
ar1.EdgeAlpha=0.3;ar2.EdgeAlpha=0.3; 
hold on;  
ndata = size(root.atlas.ExactCoMCalcualtor.exactCenterOfMassAccelerationZ);
t=[];
for i0=1:ndata(2)
   t(i0)=i0*DT; 
end
hold on;
plot(t,root.atlas.ExactCoMCalcualtor.exactCenterOfMassAccelerationZ,'color','r','LineWidth',1.4);
xlabel('t','Fontsize',40);
ylabel('Exact CoM acceleration Z','Fontsize',40);
grid on;
opts.Format = 'eps';
opts.color = 'CMYK';
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
set(gca,'fontsize',20);
exportfig(gcf,'AtlasStraightLegFrontalPushSucceed.eps', opts)


figure('rend','painters','pos', [0 0 1600 800]);
load('AtlasNormalFrontalPushFail.mat');
ar1 = area([1025*DT 1031*DT],[10 10]); 
hold on;
ar2=area([1025*DT 1031*DT],[-10 -10]); 
ar1.FaceColor='blue';ar2.FaceColor='blue';
ar1.EdgeColor='blue';ar2.EdgeColor='blue';
ar1.FaceAlpha=0.3;ar2.FaceAlpha=0.3; 
ar1.EdgeAlpha=0.3;ar2.EdgeAlpha=0.3; 
hold on;  
ndata = size(root.atlas.ExactCoMCalcualtor.exactCenterOfMassAccelerationZ);
t=[];
for i0=1:ndata(2)
   t(i0)=i0*DT; 
end
hold on;
plot(t,root.atlas.ExactCoMCalcualtor.exactCenterOfMassAccelerationZ,'color','r','LineWidth',1.4);
xlabel('t','Fontsize',40);
ylabel('Exact CoM acceleration Z','Fontsize',40);
grid on;
opts.Format = 'eps';
opts.color = 'CMYK';
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
set(gca,'fontsize',20);
exportfig(gcf,'AtlasNormalFrontalPushFail.eps', opts)

%%
clc; clear all; close all;
load('AngMomentumNormal055.mat');
tau_yn = root.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateAngularY;
zn = root.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassZ;
start = 2.0/DT;
final = 3.012/DT;
LxtoTurnNormal = 0;
for i0= start:final
    Fx_Angn = tau_yn(i0)/zn(i0);
    LxtoTurnNormal = LxtoTurnNormal - Fx_Angn;
end
velocityNormal = LxtoTurnNormal/127.2996
load('AngMomentumHeight055.mat');
tau_y = root.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateAngularY;
z = root.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassZ;
start = 2.0/DT;
final = 2.596/DT;
LxtoTurnHeight = 0;
for i0= start:final
    Fx_Ang = tau_y(i0)/z(i0);
    LxtoTurnHeight = LxtoTurnHeight - Fx_Ang;
end
velocityHeight = LxtoTurnHeight/127.2996
figure;
hold on;
plot(tau_y);plot(tau_yn);

%%
set(groot,'defaulttextinterpreter','latex');  
dx = rootNormal.valkyrie.ExactCoMCalcualtor.exactCenterOfMassVelocityX;
x = rootNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassX;
z =rootNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassZ;
i0 = 4.5/DT;
figure;
plot3(x(i0:end),dx(i0:end),z(i0:end),'Color','k');


dx = rootHFBonNormal.valkyrie.ExactCoMCalcualtor.exactCenterOfMassVelocityX;
x = rootHFBonNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassX;
z =rootHFBonNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassZ;
i0 = 4.5/DT;
hold on;
plot3(x(i0:end),dx(i0:end),z(i0:end),'Color','b');
grid on;
view(0,10)


pw=1.3;
fS=12;
set(groot,'defaulttextinterpreter','latex');  
dx = rootNormal.valkyrie.ExactCoMCalcualtor.exactCenterOfMassVelocityX;
x = rootNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassX;
i0 = 4.5/DT;
figure('rend','painters','pos', [0 0 600 200]);
plot(x(i0:end),dx(i0:end),'Color','k','LineWidth',pW);


dx = rootHFBonNormal.valkyrie.ExactCoMCalcualtor.exactCenterOfMassVelocityX;
x = rootHFBonNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassX;
i0 = 4.5/DT;
hold on;
plot(x(i0:end),dx(i0:end),'Color','b','LineWidth',pW);

dx = rootNormalonHFB.valkyrie.ExactCoMCalcualtor.exactCenterOfMassVelocityX;
x = rootNormalonHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassX;
i0 = 4.5/DT;
hold on;
plot(x(i0:end),dx(i0:end),'Color','k','LineWidth',pW,'LineStyle',':');

dx = rootHFB.valkyrie.ExactCoMCalcualtor.exactCenterOfMassVelocityX;
x = rootHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassX;
i0 = 4.5/DT;
hold on;
plot(x(i0:end),dx(i0:end),'Color','b','LineWidth',pW,'LineStyle',':');

axis([0.03 0.13 -0.2 0.3])
xlabel('$x$ [m]','FontSize',fS)
ylabel('$\dot{x}$ [m/s]','FontSize',fS)
legend({'Default','Vertical Motion'},'FontSize',fS)
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'valcomparephase.eps', opts)


pW=1.3;
fS=12;
kGray=0.85;
lastP= 1800;
iF = length(x(i0:lastP));
m=127.2996;
t=[];
for k=1:iF
   t(k)=k*DT; 
end
figure('rend','painters','pos', [0 0 600 1000]);
subplot(6,1,1)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

ldz = rootNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.desiredMomentumRateLinearZ;
laz = rootNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateLinearZ;
p1=plot(t,ldz(i0:lastP),'Color','k','LineStyle','-','LineWidth',pW);
hold on;
p2=plot(t,laz(i0:lastP),'Color','k','LineStyle','-.','LineWidth',pW);

ldz = rootHFBonNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.desiredMomentumRateLinearZ;
laz = rootHFBonNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateLinearZ;
plot(t,ldz(i0:lastP),'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t,laz(i0:lastP),'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 2.5 -500 500])
ylabel('$\dot{\mathbf{l}}_z$ [N]','FontSize',fS)

subplot(6,1,2)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

ldx = rootNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.desiredMomentumRateLinearX;
lax = rootNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateLinearX;
plot(t,ldx(i0:lastP),'Color','k','LineStyle','-','LineWidth',pW);
hold on;
plot(t,lax(i0:lastP),'Color','k','LineStyle','-.','LineWidth',pW);

ldx = rootHFBonNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.desiredMomentumRateLinearX;
lax = rootHFBonNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateLinearX;
plot(t,ldx(i0:lastP),'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t,lax(i0:lastP),'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 2.5 -150 50])
ylabel('$\dot{\mathbf{l}}_x$ [N]','FontSize',fS)

subplot(6,1,3)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

aay = rootNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateAngularY;
plot(t,aay(i0:lastP),'Color','k','LineStyle','-.','LineWidth',pW);
hold on;

aay = rootHFBonNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateAngularY;
plot(t,aay(i0:lastP),'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 2.5 -80 20])
ylabel('$\dot{\mathbf{k}}_y$ [Nm]','FontSize',fS)

subplot(6,1,4);
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
z =rootNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassZ;
plot(t,z(i0:lastP),'Color','k','LineStyle','--','LineWidth',pW);
hold on;
z =rootHFBonNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassZ;
plot(t,z(i0:lastP),'Color','b','LineStyle','--','LineWidth',pW);
plot([0 2.5],1.065*[1 1],'Color','r');
axis([0 2.5 0.98 1.08])
ylabel('$z$ [m]','FontSize',fS)

subplot(6,1,5);
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
torsoY=rootNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControllerCore.WholeBodyFeedbackController.FeedbackControllerToolbox.torsoErrorRotationVectorY;
p3=plot(t,torsoY(i0:lastP),'Color','k','LineStyle','--','LineWidth',pW);
hold on;

torsoY=rootHFBonNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControllerCore.WholeBodyFeedbackController.FeedbackControllerToolbox.torsoErrorRotationVectorY;
plot(t,torsoY(i0:lastP),'Color','b','LineStyle','--','LineWidth',pW);
axis([0 2.5 -0.08 0.02])
ylabel('Torso Rotation Y [-]','FontSize',fS)

subplot(6,1,6)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
lAnkleY =rootNormal.valkyrie.tau_leftAnklePitch;
rAnkleY =rootNormal.valkyrie.tau_rightAnklePitch;
plot(t,lAnkleY(i0:lastP),'Color','k','LineStyle','--','LineWidth',pW);
hold on;

lAnkleY =rootHFBonNormal.valkyrie.tau_leftAnklePitch;
rAnkleY =rootHFBonNormal.valkyrie.tau_rightAnklePitch;
plot(t,lAnkleY(i0:lastP),'Color','b','LineStyle','--','LineWidth',pW);
axis([0 2.5 0 150])
xlabel('Time [s]','FontSize',fS)
ylabel('Ankle Torque Y [Nm]','FontSize',fS)

lgd = legend([p1 p2 p3],{'Desired','Achieved','Measured'},'FontSize',fS,'Interpreter','latex');
lgd.Location='north';
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'valcomparetime3.eps', opts)

%%
pW=1.3;
fS=12;
kGray=0.85;
lastP= 1800;
x = rootNormal.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassX;
iF = length(x(i0:lastP));
m=127.2996;
t=[];
for k=1:iF
   t(k)=k*DT; 
end

x = rootNormalonHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassX;
iF = length(x(i0:end));
m=127.2996;
t1=[];
for k=1:iF
   t1(k)=k*DT; 
end

figure('rend','painters','pos', [0 0 600 1000]);
subplot(6,1,1)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

ldz = rootNormalonHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.desiredMomentumRateLinearZ;
laz = rootNormalonHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateLinearZ;
p1=plot(t1,ldz(i0:end),'Color','k','LineStyle','-','LineWidth',pW);
hold on;
p2=plot(t1,laz(i0:end),'Color','k','LineStyle','-.','LineWidth',pW);

ldz = rootHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.desiredMomentumRateLinearZ;
laz = rootHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateLinearZ;
plot(t,ldz(i0:lastP),'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t,laz(i0:lastP),'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 2.5 -500 500])
ylabel('$\dot{\mathbf{l}}_z$ [N]','FontSize',fS)

subplot(6,1,2)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

ldx = rootNormalonHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.desiredMomentumRateLinearX;
lax = rootNormalonHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateLinearX;
plot(t1,ldx(i0:end),'Color','k','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,lax(i0:end),'Color','k','LineStyle','-.','LineWidth',pW);

ldx = rootHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.desiredMomentumRateLinearX;
lax = rootHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateLinearX;
plot(t,ldx(i0:lastP),'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t,lax(i0:lastP),'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 2.5 -220 50])
ylabel('$\dot{\mathbf{l}}_x$ [N]','FontSize',fS)

subplot(6,1,3)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

aay = rootNormalonHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateAngularY;
plot(t1,aay(i0:end),'Color','k','LineStyle','-.','LineWidth',pW);
hold on;

aay = rootHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.achievedMomentumRateAngularY;
plot(t,aay(i0:lastP),'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 2.5 -80 30])
ylabel('$\dot{\mathbf{k}}_y$ [Nm]','FontSize',fS)

subplot(6,1,4);
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
z =rootNormalonHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassZ;
plot(t1,z(i0:end),'Color','k','LineStyle','--','LineWidth',pW);
hold on;
z =rootHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassZ;
plot(t,z(i0:lastP),'Color','b','LineStyle','--','LineWidth',pW);
plot([0 2.5],1.065*[1 1],'Color','r');
axis([0 2.5 0.98 1.08])
ylabel('$z$ [m]','FontSize',fS)

subplot(6,1,5);
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
torsoY=rootNormalonHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControllerCore.WholeBodyFeedbackController.FeedbackControllerToolbox.torsoErrorRotationVectorY;
p3=plot(t1,torsoY(i0:end),'Color','k','LineStyle','--','LineWidth',pW);
hold on;

torsoY=rootHFB.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControllerCore.WholeBodyFeedbackController.FeedbackControllerToolbox.torsoErrorRotationVectorY;
plot(t,torsoY(i0:lastP),'Color','b','LineStyle','--','LineWidth',pW);
axis([0 2.5 -0.10 0.02])
ylabel('Torso Rotation Y [-]','FontSize',fS)

subplot(6,1,6)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
lAnkleY =rootNormalonHFB.valkyrie.tau_leftAnklePitch;
rAnkleY =rootNormalonHFB.valkyrie.tau_rightAnklePitch;
plot(t1,lAnkleY(i0:end),'Color','k','LineStyle','--','LineWidth',pW);
hold on;

lAnkleY =rootHFB.valkyrie.tau_leftAnklePitch;
rAnkleY =rootHFB.valkyrie.tau_rightAnklePitch;
plot(t,lAnkleY(i0:lastP),'Color','b','LineStyle','--','LineWidth',pW);
axis([0 2.5 0 150])
xlabel('Time [s]','FontSize',fS)
ylabel('Ankle Torque Y [Nm]','FontSize',fS)

lgd = legend([p1 p2 p3],{'Desired','Achieved','Measured'},'FontSize',fS,'Interpreter','latex');
lgd.Location='north';
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'valcomparetime3.eps', opts)