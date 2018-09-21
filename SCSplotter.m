clear all;
close all;
clc;

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
for i=1:ndata(2)
   t(i)=i*DT; 
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
for i=1:ndata(2)
   t(i)=i*DT; 
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