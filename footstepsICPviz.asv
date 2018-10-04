clc;
clear all;
close all;
load('dataFor3Footsteps.mat');

ICPx= root.atlas.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerFactory.HighLevelControlManagerFactory.BalanceManager.desiredICPX; 
ICPy= root.atlas.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerFactory.HighLevelControlManagerFactory.BalanceManager.desiredICPY;

CoMx = root.atlas.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassX;
CoMy = root.atlas.DRCSimulation.DRCControllerThread.DRCMomentumBasedController.HumanoidHighLevelControllerManager.HighLevelHumanoidControllerToolbox.CommonHumanoidReferenceFramesVisualizer.centerOfMassY;
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
plot(CoMx(3.96/DT),CoMy(3.96/DT),'r*','Color','k');
plot(ICPx(3.96/DT),ICPy(3.96/DT),'r*','Color','k');

plot(CoMx(4.096/DT),CoMy(4.096/DT),'r*','Color','g');
plot(ICPx(4.096/DT),ICPy(4.096/DT),'r*','Color','g');

plot(CoMx(4.336/DT),CoMy(4.336/DT),'r*','Color','b');
plot(ICPx(4.336/DT),ICPy(4.336/DT),'r*','Color','b');

plot(CoMx(4.696/DT),CoMy(4.696/DT),'r*','Color','c');
plot(ICPx(4.696/DT),ICPy(4.696/DT),'r*','Color','c');
exportfig(gcf,'ICPplan.eps', opts)