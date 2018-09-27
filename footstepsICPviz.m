clc;
clear all;
close all;
load('dataFor3Footsteps.mat');

ICPx= root.atlas.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerFactory.HighLevelControlManagerFactory.BalanceManager.desiredICPX; 
ICPy= root.atlas.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerFactory.HighLevelControlManagerFactory.BalanceManager.desiredICPY;

CMPx = root.atlas.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerFactory.HighLevelControlManagerFactory.BalanceManager.perfectCMPX;
CMPy = root.atlas.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerFactory.HighLevelControlManagerFactory.BalanceManager.perfectCMPY;

figure;
plot(ICPx(720:1300),ICPy(720:1300), 'LineWidth',3);
hold on;
axis equal
set(gca,'fontsize',13);
opts.Format = 'eps';
opts.color = 'CMYK';
%set(gca,'LineWidth',3)

hold on;
rectangle('Position',[-0.12+1,0.075,0.22,0.1], 'LineWidth',1.5)
rectangle('Position',[-0.12+1.5,-0.075-0.1,0.22,0.1], 'LineWidth',1.5)
rectangle('Position',[-0.12+2,0.075,0.22,0.1], 'LineWidth',1.5)
exportfig(gcf,'ICPplan.eps', opts)