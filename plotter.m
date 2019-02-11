% 
% dt = 0.0117;
% i1= round(23.8/dt);
% i2= round(25/dt);
% % i1= round(30/dt);
% % i2= round(31.5/dt);
% t = table2array(hardwareTestHFB234shrink(:,1));
% F = table2array(hardwareTestHFB234shrink(:,2));
% figure;plot(t(i1:i2)-23.81,F(i1:i2)) %30.195
% HFBimpuls = trapz(t(i1:i2),F(i1:i2))
% hold on;
% 
% i1= round(26.5/dt);
% i2= round(28/dt);
% t = table2array(hardwareTestDEF204shrink(:,1));
% F = table2array(hardwareTestDEF204shrink(:,2));
% plot(t(i1:i2)-26.94,F(i1:i2))
% title('HFBpeak1vsDEFFail');
% DEFimpuls = trapz(t(i1:i2),F(i1:i2))
% axis([0 0.5 -10 300]);
% 
% % t = table2array(hardwareTestDEF12(:,1));
% % F = table2array(hardwareTestDEF12(:,2));
% % figure;plot(t,F)
% % title('DEF12');

%%
upb= 0.3;

dt = 0.0117;
i1= round(23.5/dt);
i2= round(25/dt);
% i1= round(30/dt);
% i2= round(31.5/dt);
t = table2array(hardwareTestDEF302shrink(:,1));
F = table2array(hardwareTestDEF302shrink(:,2));
figure;
subplot(3,4,1)
plot(t(i1:i2)-23.9,F(i1:i2)) %30.195
DEF30impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
axis([0 0.5 -10 400])
title(DEF30impuls)

subplot(3,4,2)
i1= round(40/dt);
i2= round(41/dt);
t = table2array(hardwareTestDEF312shrink(:,1));
F = table2array(hardwareTestDEF312shrink(:,2));
plot(t(i1:i2)-39.2,F(i1:i2))
DEF31impuls = trapz(t(i1:i2),F(i1:i2))
axis([0 0.5 -10 400])
title(DEF31impuls)

subplot(3,4,3)
i1= round(9.5/dt);
i2= round(11/dt);
t = table2array(hardwareTestDEF322shrink(:,1));
F = table2array(hardwareTestDEF322shrink(:,2));
plot(t(i1:i2)-9.9,F(i1:i2)) %30.195
DEF32impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
axis([0 0.5 -10 400])
title(DEF32impuls)

subplot(3,4,4)
i1= round(22/dt);
i2= round(24/dt);
t = table2array(hardwareTestDEF332shrink(:,1));
F = table2array(hardwareTestDEF332shrink(:,2));
plot(t(i1:i2)-23,F(i1:i2)) %30.195
DEF33impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
axis([0 0.5 -10 400])
title(DEF33impuls)

subplot(3,4,5)
dt = 0.0117;
i1= round(16.5/dt);
i2= round(18/dt);
t = table2array(hardwareTestDEF402shrink(:,1));
F = table2array(hardwareTestDEF402shrink(:,2));
plot(t(i1:i2)-17,F(i1:i2)) %30.195
DEF40impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(DEF40impuls)
axis([0 0.5 -10 400])

subplot(3,4,6)
i1= round(32/dt);
i2= round(33.5/dt);
t = table2array(hardwareTestDEF412shrink(:,1));
F = table2array(hardwareTestDEF412shrink(:,2))-2;
plot(t(i1:i2)-32.1,F(i1:i2)) %30.195
DEF41impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(DEF41impuls)
axis([0 0.5 -10 400])

subplot(3,4,7)
i1= round(12.5/dt);
i2= round(14/dt);
t = table2array(hardwareTestDEF422shrink(:,1));
F = table2array(hardwareTestDEF422shrink(:,2));
plot(t(i1:i2)-12.9,F(i1:i2)) %30.195
DEF42impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(DEF42impuls)
axis([0 0.5 -10 400])

subplot(3,4,8)
i1= round(16.5/dt);
i2= round(18/dt);
t = table2array(hardwareTestDEF432shrink(:,1));
F = table2array(hardwareTestDEF432shrink(:,2));
plot(t(i1:i2)-16.6,F(i1:i2)) %30.195
DEF43impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(DEF43impuls)
axis([0 0.5 -10 400])

subplot(3,4,9)
i1= round(11.5/dt);
i2= round(13/dt);
t = table2array(hardwareTestDEF442shrink(:,1));
F = table2array(hardwareTestDEF442shrink(:,2));
plot(t(i1:i2)-11.8,F(i1:i2)) %30.195
DEF44impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(DEF44impuls)
axis([0 0.5 -10 400])

subplot(3,4,10)
i1= round(15.5/dt);
i2= round(17/dt);
t = table2array(hardwareTestDEF452shrink(:,1));
F = table2array(hardwareTestDEF452shrink(:,2));
plot(t(i1:i2)-15.9,F(i1:i2)) %30.195
DEF45impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(DEF45impuls)
axis([0 0.5 -10 400])

subplot(3,4,11)
i1= round(11/dt);
i2= round(12/dt);
t = table2array(hardwareTestDEF462shrink(:,1));
F = table2array(hardwareTestDEF462shrink(:,2))+2;
plot(t(i1:i2)-11.2,F(i1:i2)) %30.195
DEF46impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(DEF46impuls)
axis([0 0.5 -10 400])

subplot(3,4,12)
i1= round(14.5/dt);
i2= round(16/dt);
t = table2array(hardwareTestDEF472shrink(:,1));
F = table2array(hardwareTestDEF472shrink(:,2));
plot(t(i1:i2)-14.6,F(i1:i2)) %30.195
DEF47impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(DEF47impuls)
axis([0 0.5 -10 400]) 
%%
dt = 0.0117;
i1= round(24.5/dt);
i2= round(26/dt);
t = table2array(hardwareTestHFB322shrink(:,1));
F = table2array(hardwareTestHFB322shrink(:,2));
figure;
subplot(3,4,1)
plot(t(i1:i2)-24.9,F(i1:i2)) %30.195
HFB321impuls = trapz(t(i1:i2),F(i1:i2))
axis([0 0.5 -10 400])
hold on;
title(HFB321impuls)

subplot(3,4,2)
i1= round(27.5/dt);
i2= round(29/dt);
t = table2array(hardwareTestHFB322shrink(:,1));
F = table2array(hardwareTestHFB322shrink(:,2));
plot(t(i1:i2)-27.83,F(i1:i2)) %30.195
HFB322impuls = trapz(t(i1:i2),F(i1:i2))
axis([0 0.5 -10 400])
title(HFB322impuls)

subplot(3,4,3)
i1= round(31.5/dt);
i2= round(33/dt);
t = table2array(hardwareTestHFB332shrink(:,1));
F = table2array(hardwareTestHFB332shrink(:,2));
plot(t(i1:i2)-31.6,F(i1:i2)) %30.195
HFB331impuls = trapz(t(i1:i2),F(i1:i2))
axis([0 0.5 -10 400])
title(HFB331impuls)

subplot(3,4,4)
i1= round(38/dt);
i2= round(39.5/dt);
t = table2array(hardwareTestHFB332shrink(:,1));
F = table2array(hardwareTestHFB332shrink(:,2));
plot(t(i1:i2)-38.1,F(i1:i2)) %30.195
HFB332impuls = trapz(t(i1:i2),F(i1:i2))
axis([0 0.5 -10 400])
title(HFB332impuls)

subplot(3,4,5)
dt = 0.0117;
i1= round(18.5/dt);
i2= round(20/dt);
t = table2array(hardwareTestHFB523shrink(:,1));
F = table2array(hardwareTestHFB523shrink(:,2))+1;
plot(t(i1:i2)-18.7,F(i1:i2)) %30.195
HFB521impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(HFB521impuls)
axis([0 0.5 -10 400])

subplot(3,4,6)
i1= round(47.5/dt);
i2= round(49/dt);
t = table2array(hardwareTestHFB523shrink(:,1));
F = table2array(hardwareTestHFB523shrink(:,2))+1;
plot(t(i1:i2)-46.7,F(i1:i2)) %30.195
HFB522impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(HFB522impuls)
axis([0 0.5 -10 400])

subplot(3,4,7)
i1= round(75.5/dt);
i2= round(77/dt);
t = table2array(hardwareTestHFB523shrink(:,1));
F = table2array(hardwareTestHFB523shrink(:,2));
plot(t(i1:i2)-74.2,F(i1:i2)) %30.195
HFB523impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(HFB523impuls)
axis([0 0.5 -10 400])

subplot(3,4,8)
i1= round(78.5/dt);
i2= round(80/dt);
t = table2array(hardwareTestHFB523shrink(:,1));
F = table2array(hardwareTestHFB523shrink(:,2));
plot(t(i1:i2)-77.8,F(i1:i2)) %30.195
HFB524impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(HFB524impuls)
axis([0 0.5 -10 400])

subplot(3,4,9)
i1= round(71/dt);
i2= round(72.5/dt);
t = table2array(hardwareTestHFB523shrink(:,1));
F = table2array(hardwareTestHFB523shrink(:,2));
plot(t(i1:i2)-70,F(i1:i2)) %30.195
HFB525impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(HFB525impuls)
axis([0 0.5 -10 400])

subplot(3,4,10)
dt = 0.0117;
i1= round(16/dt);
i2= round(17/dt);
t = table2array(hardwareTestHFB533shrink(:,1));
F = table2array(hardwareTestHFB533shrink(:,2));
plot(t(i1:i2)-15.8,F(i1:i2)) %30.195
HFB531impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(HFB531impuls)
axis([0 0.5 -10 400])

subplot(3,4,11)
dt = 0.0117;
i1= round(20.5/dt);
i2= round(21.5/dt);
t = table2array(hardwareTestHFB533shrink(:,1));
F = table2array(hardwareTestHFB533shrink(:,2));
plot(t(i1:i2)-20.5,F(i1:i2)) %30.195
HFB532impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(HFB532impuls)
axis([0 0.5 -10 400])

subplot(3,4,12)
dt = 0.0117;
i1= round(29.5/dt);
i2= round(30.5/dt);
t = table2array(hardwareTestHFB533shrink(:,1));
F = table2array(hardwareTestHFB533shrink(:,2));
plot(t(i1:i2)-29.3,F(i1:i2)) %30.195
HFB533impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(HFB533impuls)
axis([0 0.5 -10 400])

%% DEFAULT BEST SUCCEEDS
figure;
dt = 0.0117;
subplot(3,4,1)
i1= round(12.5/dt);
i2= round(14.5/dt);
t = table2array(hardwareTestDEF412shrink(:,1));
F = table2array(hardwareTestDEF412shrink(:,2))-2;
plot(t(i1:i2)-13.3,F(i1:i2)) %30.195
SDEF411impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF411impuls)
axis([0 0.5 -10 400])

subplot(3,4,2)
dt = 0.0117;
i1= round(17/dt);
i2= round(18.5/dt);
t = table2array(hardwareTestDEF412shrink(:,1));
F = table2array(hardwareTestDEF412shrink(:,2))-2;
plot(t(i1:i2)-17.4,F(i1:i2)) %30.195
SDEF412impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF412impuls)
axis([0 0.5 -10 400])

subplot(3,4,3)
dt = 0.0117;
i1= round(21.5/dt);
i2= round(23/dt);
t = table2array(hardwareTestDEF412shrink(:,1));
F = table2array(hardwareTestDEF412shrink(:,2))-2;
plot(t(i1:i2)-21.2,F(i1:i2)) %30.195
SDEF413impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF413impuls)
axis([0 0.5 -10 400])

subplot(3,4,4)
dt = 0.0117;
i1= round(28/dt);
i2= round(29.5/dt);
t = table2array(hardwareTestDEF412shrink(:,1));
F = table2array(hardwareTestDEF412shrink(:,2))-4;
plot(t(i1:i2)-28.0,F(i1:i2)) %30.195
SDEF414impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF414impuls)
axis([0 0.5 -10 400])

dt = 0.0117;
subplot(3,4,5)
i1= round(10.5/dt);
i2= round(12/dt);
t = table2array(hardwareTestDEF402shrink(:,1));
F = table2array(hardwareTestDEF402shrink(:,2))-1;
plot(t(i1:i2)-10.3,F(i1:i2)) %30.195
SDEF401impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF401impuls)
axis([0 0.5 -10 400])

subplot(3,4,6)
i1= round(15/dt);
i2= round(17/dt);
t = table2array(hardwareTestDEF402shrink(:,1));
F = table2array(hardwareTestDEF402shrink(:,2))-2;
plot(t(i1:i2)-15.3,F(i1:i2)) %30.195
SDEF402impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF402impuls)
axis([0 0.5 -10 400])

subplot(3,4,7)
i1= round(6/dt);
i2= round(7.5/dt);
t = table2array(hardwareTestDEF422shrink(:,1));
F = table2array(hardwareTestDEF422shrink(:,2))-2;
plot(t(i1:i2)-6.4,F(i1:i2)) %30.195
SDEF421impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF421impuls)
axis([0 0.5 -10 400])

subplot(3,4,8)
i1= round(9.5/dt);
i2= round(11.5/dt);
t = table2array(hardwareTestDEF452shrink(:,1));
F = table2array(hardwareTestDEF452shrink(:,2))-1;
plot(t(i1:i2)-10,F(i1:i2)) %30.195
SDEF451impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF451impuls)
axis([0 0.5 -10 400])

subplot(3,4,9)
i1= round(13/dt);
i2= round(14.5/dt);
t = table2array(hardwareTestDEF452shrink(:,1));
F = table2array(hardwareTestDEF452shrink(:,2))+1;
plot(t(i1:i2)-13.5,F(i1:i2)) %30.195
SDEF452impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF452impuls)
axis([0 0.5 -10 400])

subplot(3,4,10)
i1= round(7.5/dt);
i2= round(9/dt);
t = table2array(hardwareTestDEF462shrink(:,1));
F = table2array(hardwareTestDEF462shrink(:,2))+2;
plot(t(i1:i2)-8.3,F(i1:i2)) %30.195
SDEF461impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF461impuls)
axis([0 0.5 -10 400])

subplot(3,4,11)
i1= round(6/dt);
i2= round(8/dt);
t = table2array(hardwareTestDEF472shrink(:,1));
F = table2array(hardwareTestDEF472shrink(:,2))-3;
plot(t(i1:i2)-6.9,F(i1:i2)) %30.195
SDEF471impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF471impuls)
axis([0 0.5 -10 400])

subplot(3,4,12)
i1= round(11.5/dt);
i2= round(13.5/dt);
t = table2array(hardwareTestDEF472shrink(:,1));
F = table2array(hardwareTestDEF472shrink(:,2))-3;
plot(t(i1:i2)-12.4,F(i1:i2)) %30.195
SDEF472impuls = trapz(t(i1:i2),F(i1:i2))
hold on;
title(SDEF472impuls)
axis([0 0.5 -10 400])


%%
DEFmu = mean([DEF47impuls, DEF30impuls, DEF31impuls, DEF32impuls, DEF33impuls, DEF40impuls, DEF41impuls, DEF42impuls, DEF43impuls, DEF44impuls, DEF45impuls, DEF46impuls])
HFBmu = mean([HFB321impuls, HFB322impuls, HFB331impuls, HFB332impuls, HFB521impuls, HFB522impuls, HFB523impuls, HFB524impuls, HFB525impuls, HFB531impuls, HFB532impuls, HFB533impuls])
DEFfails = [DEF47impuls, DEF30impuls, DEF31impuls, DEF32impuls, DEF33impuls, DEF40impuls, DEF41impuls, DEF42impuls, DEF43impuls, DEF44impuls, DEF45impuls, DEF46impuls]';
HFBsuccs = [HFB321impuls, HFB322impuls, HFB331impuls, HFB332impuls, HFB521impuls, HFB522impuls, HFB523impuls, HFB524impuls, HFB525impuls, HFB531impuls, HFB532impuls, HFB533impuls]';
DEFsuccs = [SDEF472impuls, SDEF401impuls, SDEF402impuls, SDEF411impuls, SDEF412impuls, SDEF413impuls, SDEF414impuls, SDEF421impuls, SDEF451impuls, SDEF452impuls, SDEF461impuls, SDEF471impuls]';
SDEFmu= mean(DEFsuccs)

DEFsig=std(DEFfails);
HFBsig=std(HFBsuccs);
SDEFsig=std(DEFsuccs);

figure;
boxplot([DEFsuccs,DEFfails,HFBsuccs],'Labels',{'Recovered DEF','Failed DEF','Recovered HFB'})
% figure;
% plot([1 2 3], [SDEFmu DEFmu  HFBmu] ,'x')
% hold on;
% errorbar(SDEFmu, SDEFsig,'x')
% errorbar(DEFmu,DEFsig,'x')
% errorbar(HFBmu,HFBsig,'x')
% 
%  set(gca,'XTickLabel',{'Recovered HFB','Failed DEF','Recovered HFB'})

