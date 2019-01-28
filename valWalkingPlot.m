
set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

pW=1.3;
fS=18;
kGray=0.85;
i0=3.92/0.004;
DT=0.004;
t=[]
figure('rend','painters','pos', [0 0 1000 300]);

subplot(2,2,1)
area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
area([0.725 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.725 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

ldz = rootPos.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.desiredMomentumRateLinearZ;

for i=1:length(ldz(i0:end))
    t(i)=i*DT;
end
hold on;
p1=plot(t,ldz(i0:end),'Color','k','LineStyle','-','LineWidth',pW);
axis([0 0.85 -800 800])
ylabel('$\dot{\mathbf{l}}_{z,d}$ [N]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(2,2,3)
area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
area([0.725 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.725 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

z =rootPos.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassZ;
zmax=rootPos.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerFactory.HighLevelControlManagerFactory.BalanceManager.ICPOptimizationLinearMomentumRateOfChangeControlModule.HeightForBalance.zMaxHeightCtrl;

for i=1:length(ldz(i0:end))
    t(i)=i*DT;
end
hold on;
p1=plot(t,z(i0:end),'Color','k','LineStyle','--','LineWidth',pW);
p2=plot(t,zmax(i0:end),'Color','r','LineStyle','-','LineWidth',pW);
p3=plot(t,0.88*ones(1,length(zmax(i0:end))),'Color','r','LineStyle','-','LineWidth',pW);
axis([0 0.85 0.86 1.12])
ylabel('$z$ [m]','FontSize',fS)
xlabel('Time [s]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(2,2,2)
area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
area([0.725 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.725 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

ldz = rootPrep.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.WalkingControllerState.WholeBodyControlCoreToolbox.desiredMomentumRateLinearZ;

t=[]
for i=1:length(ldz(i0:end))
    t(i)=i*DT;
end
hold on;
p1=plot(t,ldz(i0:end),'Color','k','LineStyle','-','LineWidth',pW);
axis([0 0.85 -800 800])

set(gca,'FontSize',fS)

subplot(2,2,4)
area([0 (0.125)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0 (0.125)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
area([0.125 (0.155)],[1000 1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.125 (0.155)],[-1000 -1000], 'FaceColor',[0.1 0.1 0.1],'LineStyle','none','ShowBaseLine','off')
area([0.725 (0.85)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([0.725 (0.85)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')

z =rootPrep.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassZ;
zmax=rootPrep.valkyrie.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerFactory.HighLevelControlManagerFactory.BalanceManager.ICPOptimizationLinearMomentumRateOfChangeControlModule.HeightForBalance.zMaxHeightCtrl;
for i=1:length(ldz(i0:end))
    t(i)=i*DT;
end
hold on;
p1=plot(t,z(i0:end),'Color','k','LineStyle','--','LineWidth',pW);
p2=plot(t,zmax(i0:end),'Color','r','LineStyle','-','LineWidth',pW);
p3=plot(t,0.88*ones(1,length(zmax(i0:end))),'Color','r','LineStyle','-','LineWidth',pW);

axis([0 0.85 0.86 1.12])
xlabel('Time [s]','FontSize',fS)
set(gca,'FontSize',fS)

opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
exportfig(gcf,'walkingplot.eps', opts)