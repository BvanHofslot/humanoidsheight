set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');

t0 =1.5;
tf=5.3;
fS=22;

figure('rend','painters','pos', [0 0 600 200]);
set(gcf,'color','w');
hold on;
box on;
load('valHWHFBvideo.mat')
zh=desiredMomentumRateLinearZ;
load('valHWDEFvideo.mat')
zd=desiredMomentumRateLinearZ;
dz = zd(1)-zh(1);
zh=zh+dz;
anih = animatedline('LineWidth',2,'Color','b','LineStyle','-');
anid = animatedline('LineWidth',2,'Color','k','LineStyle','-');
set(gca,'XLim',[0 3.5],'YLim',[-400 400]);
xlabel('Time [s]')
ylabel('$\dot{\mathbf{l}}_{d,z}$ [N]')
set(gca,'FontSize',fS)
for i=1:length(zd)
        addpoints(anih,i*0.002,zh(i));
        addpoints(anid,i*0.002,zd(i));
        head=scatter(i*0.002,zh(i),'filled','MarkerFaceColor','b','MarkerEdgeColor','b');
        head1=scatter(i*0.002,zd(i),'filled','MarkerFaceColor','k','MarkerEdgeColor','k');
        drawnow update
        F(i) =getframe(gcf);
        pause(0.0002)
        i
        delete(head)
        delete(head1)
end

video = VideoWriter('valdz.avi','Uncompressed AVI')
open(video)
writeVideo(video,F)
close(video)

%%
figure('rend','painters','pos', [0 0 600 200]);
set(gcf,'color','w');
hold on;
box on;
load('valHWHFBvideo.mat')
zf=estimatedCenterOfMassPositionZ;
zh=zf(1:1750);
load('valHWDEFvideo.mat')
zd=estimatedCenterOfMassPositionZ;
anih = animatedline('LineWidth',2,'Color','b','LineStyle','--');
anid = animatedline('LineWidth',2,'Color','k','LineStyle','--');
set(gca,'XLim',[0 3.5],'YLim',[1.0 1.08]);
xlabel('Time [s]')
ylabel('$z$ [m]')
set(gca,'FontSize',fS)
plot([0 4], (1.065)*[1 1],'Color','r','LineWidth',2)
str = "$z_{max}$";
text(0.2,1.075,str,'FontSize',fS,'Color','r')
for i=1:length(zd)
        addpoints(anih,i*0.002,zh(i));
        addpoints(anid,i*0.002,zd(i));
         head=scatter(i*0.002,zh(i),'filled','MarkerFaceColor','b','MarkerEdgeColor','b');
        head1=scatter(i*0.002,zd(i),'filled','MarkerFaceColor','k','MarkerEdgeColor','k');
        drawnow update
        F(i) =getframe(gcf);
        pause(0.0002)
        i
         delete(head)
        delete(head1)
end

video = VideoWriter('valz.avi','Uncompressed AVI')
open(video)
writeVideo(video,F)
close(video)

%%
figure('rend','painters','pos', [0 0 600 200]);
set(gcf,'color','w');
hold on;
box on;
load('valHWHFBvideo.mat')
zh=sign(leftAnklePitchTauDesired).*sqrt(leftAnklePitchTauDesired.^2+rightAnklePitchTauDesired.^2);
zh2=sign(leftAnklePitchTauMeasured).*sqrt(leftAnklePitchTauMeasured.^2+rightAnklePitchTauMeasured.^2);
load('valHWDEFvideo.mat')
zd=sign(leftAnklePitchTauDesired).*sqrt(leftAnklePitchTauDesired.^2+rightAnklePitchTauDesired.^2);
zd2=sign(leftAnklePitchTauMeasured).*sqrt(leftAnklePitchTauMeasured.^2+rightAnklePitchTauMeasured.^2);
anih = animatedline('LineWidth',2,'Color','b','LineStyle','-');
anid = animatedline('LineWidth',2,'Color','k','LineStyle','-');
anih2 = animatedline('LineWidth',2,'Color','b','LineStyle','--');
anid2 = animatedline('LineWidth',2,'Color','k','LineStyle','--');
set(gca,'XLim',[0 3.5],'YLim',[0 200]);
xlabel('Time [s]')
ylabel('$\tau_{ak,y}$ [Nm]')
set(gca,'FontSize',fS)
for i=1:length(zd)
        addpoints(anih,i*0.002,zh(i));
        addpoints(anid,i*0.002,zd(i));
           addpoints(anih2,i*0.002,zh2(i));
        addpoints(anid2,i*0.002,zd2(i));
        head=scatter(i*0.002,zh(i),'filled','MarkerFaceColor','b','MarkerEdgeColor','b');
        head1=scatter(i*0.002,zd(i),'filled','MarkerFaceColor','k','MarkerEdgeColor','k');
         head2=scatter(i*0.002,zh2(i),'MarkerEdgeColor','b');
        head3=scatter(i*0.002,zd2(i),'MarkerEdgeColor','k');
        drawnow update
        F(i) =getframe(gcf);
        pause(0.0002)
        i
        delete(head)
        delete(head1)
        delete(head2)
        delete(head3)
end

video = VideoWriter('valtauaky.avi','Uncompressed AVI')
open(video)
writeVideo(video,F)
close(video)

%%
figure('rend','painters','pos', [0 0 600 600]);
set(gcf,'color','w');
hold on;
box on;
load('valHWHFBvideo.mat')
zh=sign(estimatedCenterOfMassPositionX).*sqrt((estimatedCenterOfMassPositionX-estimatedCenterOfMassPositionX(1)).^2+(estimatedCenterOfMassPositionY-estimatedCenterOfMassPositionY(1)).^2);
zh2=sign(estimatedCenterOfMassVelocityX).*sqrt((estimatedCenterOfMassVelocityX).^2+(estimatedCenterOfMassVelocityY).^2);
load('valHWDEFvideo.mat')
zd=-sign(estimatedCenterOfMassPositionX).*sqrt((estimatedCenterOfMassPositionX-estimatedCenterOfMassPositionX(1)).^2+(estimatedCenterOfMassPositionY-estimatedCenterOfMassPositionY(1)).^2);
zd2=-sign(estimatedCenterOfMassVelocityX).*sqrt((estimatedCenterOfMassVelocityX).^2+(estimatedCenterOfMassVelocityY).^2);
anih = animatedline('LineWidth',2,'Color','b','LineStyle','-');
anid = animatedline('LineWidth',2,'Color','k','LineStyle','-');
set(gca,'XLim',[0 0.1],'YLim',[-0.2 0.25]);
xlabel('$x$ [m]')
ylabel('$\dot{x}$ [m/s]')
set(gca,'FontSize',fS)
for i=1:length(zd)
        addpoints(anih,zh(i),zh2(i));
        addpoints(anid,zd(i),zd2(i));
        head=scatter(zh(i),zh2(i),'filled','MarkerFaceColor','b','MarkerEdgeColor','b');
        head1=scatter(zd(i),zd2(i),'filled','MarkerFaceColor','k','MarkerEdgeColor','k');
        drawnow update
        F(i) =getframe(gcf);
        pause(0.0002)
        i
        delete(head)
        delete(head1)
  
end

video = VideoWriter('valphase1.avi','Uncompressed AVI')
open(video)
writeVideo(video,F)
close(video)