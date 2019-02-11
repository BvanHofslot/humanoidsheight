F_MATRIX = zeros(33,12);

dt = 0.0117;
% i1= round(23.5/dt);
% i2= round(25/dt);
% % i1= round(30/dt);
% % i2= round(31.5/dt);
% figure;
% subplot(3,4,1)
% t = table2array(hardwareTestDEF302shrink(:,1));
% F = table2array(hardwareTestDEF302shrink(:,2))-1;
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF30impuls = trapz(t,F)
% F_MATRIX(:,1)=F;
% 
% hold on;
% axis([0 0.5 -10 400])
% title(DEF30impuls)
% 
% subplot(3,4,2)
% i1= round(40/dt);
% i2= round(41/dt);
% t = table2array(hardwareTestDEF312shrink(:,1));
% F = table2array(hardwareTestDEF312shrink(:,2))-3;
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF31impuls = trapz(t,F)
% axis([0 0.5 -10 400])
% title(DEF31impuls)
% F_MATRIX(:,2)=F;
% 
% subplot(3,4,3)
% i1= round(9.5/dt);
% i2= round(11/dt);
% t = table2array(hardwareTestDEF322shrink(:,1));
% F = table2array(hardwareTestDEF322shrink(:,2));
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF32impuls = trapz(t,F)
% hold on;
% axis([0 0.5 -10 400])
% title(DEF32impuls)
% F_MATRIX(:,3)=F;
% 
% subplot(3,4,4)
% i1= round(22/dt);
% i2= round(24/dt);
% t = table2array(hardwareTestDEF332shrink(:,1));
% F = table2array(hardwareTestDEF332shrink(:,2));
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF33impuls = trapz(t,F)
% hold on;
% axis([0 0.5 -10 400])
% title(DEF33impuls)
% F_MATRIX(:,4)=F;
% 
% subplot(3,4,5)
% dt = 0.0117;
% i1= round(16.5/dt);
% i2= round(18/dt);
% t = table2array(hardwareTestDEF402shrink(:,1));
% F = table2array(hardwareTestDEF402shrink(:,2));
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF40impuls = trapz(t,F)
% hold on;
% title(DEF40impuls)
% axis([0 0.5 -10 400])
% F_MATRIX(:,5)=F;
% 
% subplot(3,4,6)
% i1= round(32/dt);
% i2= round(33.5/dt);
% t = table2array(hardwareTestDEF412shrink(:,1));
% F = table2array(hardwareTestDEF412shrink(:,2))-2;
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF41impuls = trapz(t,F)
% hold on;
% title(DEF41impuls)
% axis([0 0.5 -10 400])
% F_MATRIX(:,6)=F;
% 
% subplot(3,4,7)
% i1= round(12.5/dt);
% i2= round(14/dt);
% t = table2array(hardwareTestDEF422shrink(:,1));
% F = table2array(hardwareTestDEF422shrink(:,2));
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF42impuls = trapz(t,F)
% hold on;
% title(DEF42impuls)
% axis([0 0.5 -10 400])
% F_MATRIX(:,7)=F;
% 
% subplot(3,4,8)
% i1= round(16.5/dt);
% i2= round(18/dt);
% t = table2array(hardwareTestDEF432shrink(:,1));
% F = table2array(hardwareTestDEF432shrink(:,2));
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF43impuls = trapz(t,F)
% hold on;
% title(DEF43impuls)
% axis([0 0.5 -10 400])
% F_MATRIX(:,8)=F;
% 
% subplot(3,4,9)
% i1= round(11.5/dt);
% i2= round(13/dt);
% t = table2array(hardwareTestDEF442shrink(:,1));
% F = table2array(hardwareTestDEF442shrink(:,2));
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF44impuls = trapz(t,F)
% hold on;
% title(DEF44impuls)
% axis([0 0.5 -10 400])
% F_MATRIX(:,9)=F;
% 
% subplot(3,4,10)
% i1= round(15.5/dt);
% i2= round(17/dt);
% t = table2array(hardwareTestDEF452shrink(:,1));
% F = table2array(hardwareTestDEF452shrink(:,2));
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF45impuls = trapz(t,F)
% hold on;
% title(DEF45impuls)
% axis([0 0.5 -10 400])
% F_MATRIX(:,10)=F;
% 
% subplot(3,4,11)
% i1= round(11/dt);
% i2= round(12/dt);
% t = table2array(hardwareTestDEF462shrink(:,1));
% F = table2array(hardwareTestDEF462shrink(:,2))+2;
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF46impuls = trapz(t,F)
% hold on;
% title(DEF46impuls)
% axis([0 0.5 -10 400])
% F_MATRIX(:,11)=F;
% 
% subplot(3,4,12)
% i1= round(14.5/dt);
% i2= round(16/dt);
% t = table2array(hardwareTestDEF472shrink(:,1));
% F = table2array(hardwareTestDEF472shrink(:,2));
% s = find(gradient(F(i1:i2))>5,1);
% t = t(i1+s-2:i1+s+30)-t(i1+s-2);
% F = F(i1+s-2:i1+s+30);
% plot(t,F) %30.195
% DEF47impuls = trapz(t,F)
% hold on;
% title(DEF47impuls)
% axis([0 0.5 -10 400]) 
% F_MATRIX(:,12)=F;
% 
% F_MATRIX1=F_MATRIX;
% figure;
% F_VAR =[];
% F_MEAN=[];
% for i=1:33
%     F_VAR(i) = std(F_MATRIX(i,:));
%     F_MEAN(i) = mean(F_MATRIX(i,:));
% end
% F_LO=F_MEAN-F_VAR;
% F_HI=F_MEAN+F_VAR;
% fill([t;flipud(t)],[F_LO';flipud(F_HI')],[.9 .9 .9],'linestyle','none');
% hold on;
% plot(t,F_MEAN)
% DEFimpuls = trapz(t,F_MEAN);
% title(DEFimpuls)
% axis([0 0.35 -100 500])


%%
dt = 0.0117;
i1= round(24.5/dt);
i2= round(26/dt);
t = table2array(hardwareTestHFB322shrink(:,1));
F = table2array(hardwareTestHFB322shrink(:,2));
figure;
subplot(3,4,1)
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB321impuls = trapz(t,F)
axis([0 0.5 -10 400])
hold on;
title(HFB321impuls)
F_MATRIX(:,1)=F;

subplot(3,4,2)
i1= round(27.5/dt);
i2= round(29/dt);
t = table2array(hardwareTestHFB322shrink(:,1));
F = table2array(hardwareTestHFB322shrink(:,2));
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB322impuls = trapz(t,F)
axis([0 0.5 -10 400])
title(HFB322impuls)
F_MATRIX(:,2)=F;

subplot(3,4,3)
i1= round(31.5/dt);
i2= round(33/dt);
t = table2array(hardwareTestHFB332shrink(:,1));
F = table2array(hardwareTestHFB332shrink(:,2));
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB331impuls = trapz(t,F)
axis([0 0.5 -10 400])
title(HFB331impuls)
F_MATRIX(:,3)=F;

subplot(3,4,4)
i1= round(38/dt);
i2= round(39.5/dt);
t = table2array(hardwareTestHFB332shrink(:,1));
F = table2array(hardwareTestHFB332shrink(:,2));
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB332impuls = trapz(t,F)
axis([0 0.5 -10 400])
title(HFB332impuls)
F_MATRIX(:,4)=F;

subplot(3,4,5)
dt = 0.0117;
i1= round(18.5/dt);
i2= round(20/dt);
t = table2array(hardwareTestHFB523shrink(:,1));
F = table2array(hardwareTestHFB523shrink(:,2))+1;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB521impuls = trapz(t,F)
hold on;
title(HFB521impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,5)=F;

subplot(3,4,6)
i1= round(47.5/dt);
i2= round(49/dt);
t = table2array(hardwareTestHFB523shrink(:,1));
F = table2array(hardwareTestHFB523shrink(:,2))+1;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB522impuls = trapz(t,F)
hold on;
title(HFB522impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,6)=F;

subplot(3,4,7)
i1= round(75.5/dt);
i2= round(77/dt);
t = table2array(hardwareTestHFB523shrink(:,1));
F = table2array(hardwareTestHFB523shrink(:,2));
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB523impuls = trapz(t,F)
hold on;
title(HFB523impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,7)=F;

subplot(3,4,8)
i1= round(78.5/dt);
i2= round(80/dt);
t = table2array(hardwareTestHFB523shrink(:,1));
F = table2array(hardwareTestHFB523shrink(:,2));
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB524impuls = trapz(t,F)
hold on;
title(HFB524impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,8)=F;

subplot(3,4,9)
i1= round(71/dt);
i2= round(72.5/dt);
t = table2array(hardwareTestHFB523shrink(:,1));
F = table2array(hardwareTestHFB523shrink(:,2));
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB525impuls = trapz(t,F)
hold on;
title(HFB525impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,9)=F;

subplot(3,4,10)
dt = 0.0117;
i1= round(16/dt);
i2= round(17/dt);
t = table2array(hardwareTestHFB533shrink(:,1));
F = table2array(hardwareTestHFB533shrink(:,2));
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB531impuls = trapz(t,F)
hold on;
title(HFB531impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,10)=F;

subplot(3,4,11)
dt = 0.0117;
i1= round(20.5/dt);
i2= round(21.5/dt);
t = table2array(hardwareTestHFB533shrink(:,1));
F = table2array(hardwareTestHFB533shrink(:,2));
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB532impuls = trapz(t,F)
hold on;
title(HFB532impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,11)=F;

subplot(3,4,12)
dt = 0.0117;
i1= round(29.5/dt);
i2= round(30.5/dt);
t = table2array(hardwareTestHFB533shrink(:,1));
F = table2array(hardwareTestHFB533shrink(:,2));
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB533impuls = trapz(t,F)
hold on;
title(HFB533impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,12)=F;

F_MATRIX2=F_MATRIX;

figure;
F_VAR =[];
F_MEAN=[];
for i=1:33
    F_VAR(i) = std(F_MATRIX(i,:));
    F_MEAN(i) = mean(F_MATRIX(i,:));
end
F_LO=F_MEAN-F_VAR;
F_HI=F_MEAN+F_VAR;
fill([t;flipud(t)],[F_LO';flipud(F_HI')],[.9 .9 .9],'linestyle','none');
hold on;
plot(t,F_MEAN)
DEFimpuls = trapz(t,F_MEAN);
title(DEFimpuls)
axis([0 0.35 -100 500])

%%
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');
figure;
dt = 0.0117;
subplot(3,4,1)
i1= round(12.5/dt);
i2= round(14.5/dt);
t = table2array(hardwareTestDEF412shrink(:,1));
F = table2array(hardwareTestDEF412shrink(:,2))-2;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF411impuls = trapz(t,F)
hold on;
title(SDEF411impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,1)=F;

subplot(3,4,2)
dt = 0.0117;
i1= round(17/dt);
i2= round(18.5/dt);
t = table2array(hardwareTestDEF412shrink(:,1));
F = table2array(hardwareTestDEF412shrink(:,2))-2;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF412impuls = trapz(t,F)
hold on;
title(SDEF412impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,2)=F;

subplot(3,4,3)
dt = 0.0117;
i1= round(21.5/dt);
i2= round(23/dt);
t = table2array(hardwareTestDEF412shrink(:,1));
F = table2array(hardwareTestDEF412shrink(:,2))-2;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF413impuls = trapz(t,F)
hold on;
title(SDEF413impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,3)=F;

subplot(3,4,4)
dt = 0.0117;
i1= round(28/dt);
i2= round(29.5/dt);
t = table2array(hardwareTestDEF412shrink(:,1));
F = table2array(hardwareTestDEF412shrink(:,2))-4;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF414impuls = trapz(t,F)
hold on;
title(SDEF414impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,4)=F;

dt = 0.0117;
subplot(3,4,5)
i1= round(10.5/dt);
i2= round(12/dt);
t = table2array(hardwareTestDEF402shrink(:,1));
F = table2array(hardwareTestDEF402shrink(:,2))-1;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF401impuls = trapz(t,F)
hold on;
title(SDEF401impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,5)=F;

subplot(3,4,6)
i1= round(15/dt);
i2= round(17/dt);
t = table2array(hardwareTestDEF402shrink(:,1));
F = table2array(hardwareTestDEF402shrink(:,2))-2;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF402impuls = trapz(t,F)
hold on;
title(SDEF402impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,6)=F;

subplot(3,4,7)
i1= round(6/dt);
i2= round(7.5/dt);
t = table2array(hardwareTestDEF422shrink(:,1));
F = table2array(hardwareTestDEF422shrink(:,2))-2.8;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF421impuls = trapz(t,F)
hold on;
title(SDEF421impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,7)=F;

subplot(3,4,8)
i1= round(9.5/dt);
i2= round(11.5/dt);
t = table2array(hardwareTestDEF452shrink(:,1));
F = table2array(hardwareTestDEF452shrink(:,2))-1;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF451impuls = trapz(t,F)
hold on;
title(SDEF451impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,8)=F;

subplot(3,4,9)
i1= round(13/dt);
i2= round(14.5/dt);
t = table2array(hardwareTestDEF452shrink(:,1));
F = table2array(hardwareTestDEF452shrink(:,2))+1;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF452impuls = trapz(t,F)
hold on;
title(SDEF452impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,9)=F;

subplot(3,4,10)
i1= round(7.5/dt);
i2= round(9/dt);
t = table2array(hardwareTestDEF462shrink(:,1));
F = table2array(hardwareTestDEF462shrink(:,2))+2;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF461impuls = trapz(t,F)
hold on;
title(SDEF461impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,10)=F;

subplot(3,4,11)
i1= round(6/dt);
i2= round(8/dt);
t = table2array(hardwareTestDEF472shrink(:,1));
F = table2array(hardwareTestDEF472shrink(:,2))-3;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF471impuls = trapz(t,F)
hold on;
title(SDEF471impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,11)=F;

subplot(3,4,12)
i1= round(11.5/dt);
i2= round(13.5/dt);
t = table2array(hardwareTestDEF472shrink(:,1));
F = table2array(hardwareTestDEF472shrink(:,2))-3;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF472impuls = trapz(t,F)
hold on;
title(SDEF472impuls)
axis([0 0.5 -10 400])
F_MATRIX(:,12)=F;
F_MATRIX3=F_MATRIX;

figure;
F_VAR =[];
F_MEAN=[];
for i=1:33
    F_VAR(i) = std(F_MATRIX(i,:));
    F_MEAN(i) = mean(F_MATRIX(i,:));
end
F_LO=F_MEAN-F_VAR;
F_HI=F_MEAN+F_VAR;
fill([t;flipud(t)],[F_LO';flipud(F_HI')],[.9 .9 .9],'linestyle','none');
hold on;
plot(t,F_MEAN)
DEFimpuls = trapz(t,F_MEAN);
title(DEFimpuls)
axis([0 0.35 -100 500])

%%
set(groot,'defaulttextinterpreter','latex');  
figure('rend','painters','pos', [0 0 600 200]);
subplot(1,2,1)
fS=12;
F_VAR =[];
F_MEAN=[];
for i=1:33
    F_VAR(i) = std(F_MATRIX3(i,:));
    F_MEAN(i) = mean(F_MATRIX3(i,:));
end
F_LO=F_MEAN-F_VAR;
F_HI=F_MEAN+F_VAR;
fill([t;flipud(t)],[F_LO';flipud(F_HI')],[.85 .85 .85],'linestyle','none');
hold on;
p1=plot(t,F_MEAN,'Color','k')
DEFimpuls = trapz(t,F_MEAN);
title(DEFimpuls)
axis([0 0.35 -50 500])
xlabel('Time [s]','FontSize',fS);
ylabel('Force [N]','FontSize',fS);

subplot(1,2,2)
F_VAR =[];
F_MEAN=[];
for i=1:33
    F_VAR(i) = std(F_MATRIX2(i,:));
    F_MEAN(i) = mean(F_MATRIX2(i,:));
end
F_LO=F_MEAN-F_VAR;
F_HI=F_MEAN+F_VAR;
fill([t;flipud(t)],[F_LO';flipud(F_HI')],[.85 .85 .85],'linestyle','none');
hold on;
p2=plot(t,F_MEAN,'Color','b')
DEFimpuls = trapz(t,F_MEAN);
title(DEFimpuls)
xlabel('Time [s]','FontSize',fS);
axis([0 0.35 -50 500])

lgd = legend([p1 p2],{'Default $\int F dt = 35.3$ [Ns]','Vertical Motion $\int F dt = 37.6$ [Ns]'},'FontSize',fS,'Interpreter','latex');
lgd.Location='northoutside';
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'impulsecompare.eps', opts)

%%
pW=1.3;
fS=12;
set(groot,'defaulttextinterpreter','latex');  
figure('rend','painters','pos', [0 0 600 200]);

load('valHardwareHFB31push4FromEnd.mat')
HOR= sqrt((centerOfMassX -0.009).^2 + (centerOfMassY+0.0628).^2)
dHOR= sign(estimatedCenterOfMassVelocityX).*sqrt(estimatedCenterOfMassVelocityX.^2 + estimatedCenterOfMassVelocityY.^2)
a=0;
for i=1:1500
    hor(i)=HOR(i-a);
    dhor(i)=dHOR(i-a);
    a=a+1;
    if(a>4)
        a=0;
    end
end
plot(hor,dhor,'Color','b','LineWidth',pW); hold on;


load('valHardwareDEF42push1.mat')
HOR= sqrt((centerOfMassX+0.0404).^2 + (centerOfMassY+0.1716).^2)-0.004
dHOR= -sign(estimatedCenterOfMassVelocityX).*sqrt(estimatedCenterOfMassVelocityX.^2 + estimatedCenterOfMassVelocityY.^2)
a=0;
for i=1:1500
    hor(i)=HOR(i-a);
    dhor(i)=dHOR(i-a);
    a=a+1;
    if(a>4)
        a=0;
    end
end
plot(hor,dhor,'Color','k','LineWidth',pW); hold on;

axis([0.0 0.10 -0.2 0.25])
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
DT=0.0002
set(groot,'defaulttextinterpreter','latex'); 
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');
pW=1.3;
fS=18;
kGray=0.85;
lastP= 1800;

load('valHardwareDEF42push1Time.mat');
z = centerOfMassZ;
iF = length(z);

t1=[0:0.002:2.5];

figure('rend','painters','pos', [0 0 1000 1400]);
subplot(6,2,1)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')

load('valHardwareDEF42push1Time.mat');
ldz = desiredMomentumRateLinearZ;
load('valHardwareDEF42push1TimeMODIFYLDOT.mat')
laz = root.LogDataProcessor.LogDataAchievedMomentumRateCalculator.modifiedAchievedMomentumRateLinearZ(144:end);
p1=plot(t1,ldz(1:1251),'Color','k','LineStyle','-','LineWidth',pW);
hold on;
p2=plot(t1,laz(1:1251),'Color','k','LineStyle','-.','LineWidth',pW);

load('valHardwareHFB31push4FromEndTime.mat');
ldz = desiredMomentumRateLinearZ;
load('valHardwareHFB31push4FromEndMODIFYLDOT.mat');
laz = root.LogDataProcessor.LogDataAchievedMomentumRateCalculator.modifiedAchievedMomentumRateLinearZ(144:end);
plot(t1,ldz(1:1251),'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,laz(1:1251),'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 2.5 -500 500])
ylabel('$\dot{\mathbf{l}}_z$ [N]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(6,2,3)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')
% area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
% hold on;
% area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
load('valHardwareDEF42push1Time.mat');
ldx =- sqrt(desiredMomentumRateLinearX.^2+desiredMomentumRateLinearY.^2);
load('valHardwareDEF42push1TimeMODIFYLDOT.mat')
lax = -sqrt(root.LogDataProcessor.LogDataAchievedMomentumRateCalculator.modifiedAchievedMomentumRateLinearX(144:end).^2+root.LogDataProcessor.LogDataAchievedMomentumRateCalculator.modifiedAchievedMomentumRateLinearY(144:end).^2)
plot(t1,ldx(1:1251),'Color','k','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,lax(1:1251),'Color','k','LineStyle','-.','LineWidth',pW);
set(gca,'FontSize',fS)

load('valHardwareHFB31push4FromEndTime.mat');
ldx =- sqrt(desiredMomentumRateLinearX.^2+desiredMomentumRateLinearY.^2);
load('valHardwareHFB31push4FromEndMODIFYLDOT.mat')
lax = -sqrt(root.LogDataProcessor.LogDataAchievedMomentumRateCalculator.modifiedAchievedMomentumRateLinearX(144:end).^2+root.LogDataProcessor.LogDataAchievedMomentumRateCalculator.modifiedAchievedMomentumRateLinearY(144:end).^2)
plot(t1,ldx(1:1251),'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,lax(1:1251),'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 2.5 -170 50])
ylabel('$\dot{\mathbf{l}}_x$ [N]','FontSize',fS)
set(gca,'FontSize',fS)

t1=[0:0.002:3];
subplot(6,2,5)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')
load('valHardwareDEF42push1Time.mat');
aay = sign(achievedMomentumRateAngularX).*sqrt(achievedMomentumRateAngularX.^2 + achievedMomentumRateAngularY.^2);
plot(t1,aay,'Color','k','LineStyle','-.','LineWidth',pW);
hold on;

load('valHardwareHFB31push4FromEndTime.mat');
aay = sign(achievedMomentumRateAngularX).*sqrt(achievedMomentumRateAngularX.^2 + achievedMomentumRateAngularY.^2);
plot(t1,aay,'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 2.5 -80 60])
ylabel('$\dot{\mathbf{k}}_y$ [Nm]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(6,2,7);
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')
load('valHardwareDEF42push1Time.mat');
z=centerOfMassZ;
plot(t1,z,'Color','k','LineStyle','--','LineWidth',pW);
hold on;

load('valHardwareHFB31push4FromEndTime.mat');
z=centerOfMassZ;
p3=plot(t1,z,'Color','b','LineStyle','--','LineWidth',pW);
plot([0 2.5],1.065*[1 1],'Color','r');
axis([0 2.5 0.98 1.08])
ylabel('$z$ [m]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(6,2,9)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')
load('valHardwareDEF42push1Time.mat');
aay = -sqrt(pelvisErrorRotationVectorX.^2 + pelvisErrorRotationVectorY.^2)-sqrt(pelvisErrorRotationVectorX(1)^2 + pelvisErrorRotationVectorY(1)^2);
plot(t1,aay,'Color','k','LineStyle','-.','LineWidth',pW);
hold on;

load('valHardwareHFB31push4FromEndTime.mat');
aay = sign(pelvisErrorRotationVectorY).*sqrt(pelvisErrorRotationVectorX.^2 + pelvisErrorRotationVectorY.^2)-sqrt(pelvisErrorRotationVectorX(1)^2 + pelvisErrorRotationVectorY(1)^2);
plot(t1,aay,'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 2.5 -0.10 0.02])
ylabel('$\theta_{pel,y}$ [Nm]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(6,2,11)
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')
load('valHardwareDEF42push1Time.mat');
aay = -sign(torsoErrorRotationVectorY).*sqrt(torsoErrorRotationVectorX.^2 + torsoErrorRotationVectorY.^2)-sqrt(torsoErrorRotationVectorX(1)^2 + torsoErrorRotationVectorY(1)^2);
plot(t1,aay,'Color','k','LineStyle','-.','LineWidth',pW);
hold on;

load('valHardwareHFB31push4FromEndTime.mat');
aay = sign(torsoErrorRotationVectorY).*sqrt(torsoErrorRotationVectorX.^2 + torsoErrorRotationVectorY.^2)-sqrt(torsoErrorRotationVectorX(1)^2 + torsoErrorRotationVectorY(1)^2);
plot(t1,aay,'Color','b','LineStyle','-.','LineWidth',pW);
axis([0 2.5 -0.07 0.01])
xlabel('Time [s]','FontSize',fS)
ylabel('$\theta_{torso,y}$ [Nm]','FontSize',fS)
set(gca,'FontSize',fS)


subplot(6,2,2);
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')
off=0.01;
offz=30;
text(DT+off,offz,'$a$','FontSize',fS)
text(DT+off+0.14*1,offz,'$b$','FontSize',fS)
text(DT+off+0.14*2,offz,'$c$','FontSize',fS)
text(DT+off+0.14*3,offz,'$d$','FontSize',fS)
text(DT+off+0.14*4,offz,'$e$','FontSize',fS)
text(DT+off+0.14*5,offz,'$f$','FontSize',fS)
text(DT+off+0.14*6,offz,'$g$','FontSize',fS)
load('valHardwareDEF42push1Time.mat');
ankleYd= sign(leftAnklePitchTauDesired).*sqrt(leftAnklePitchTauDesired.^2+rightAnklePitchTauDesired.^2);
ankleYm= sign(leftAnklePitchTauMeasured).*sqrt(leftAnklePitchTauMeasured.^2+rightAnklePitchTauMeasured.^2);
max(ankleYm)
plot(t1,ankleYd,'Color','k','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,ankleYm,'Color','k','LineStyle','--','LineWidth',pW);
set(gca,'FontSize',fS)

load('valHardwareHFB31push4FromEndTime.mat');
ankleYd= sign(leftAnklePitchTauDesired).*sqrt(leftAnklePitchTauDesired.^2+rightAnklePitchTauDesired.^2);
ankleYm= sign(leftAnklePitchTauMeasured).*sqrt(leftAnklePitchTauMeasured.^2+rightAnklePitchTauMeasured.^2);
max(ankleYm)
plot(t1,ankleYd,'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,ankleYm,'Color','b','LineStyle','--','LineWidth',pW);
axis([0 2.5 0 200])
ylabel('$\boldmath{\tau}_{ak,y}$ [Nm]','FontSize',fS)
set(gca,'FontSize',fS)


subplot(6,2,4);
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')
load('valHardwareDEF42push1Time2.mat');
z = leftHipPitchTauDesired;
iF = length(z);
m=127.2996;
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
ankleYd= sign(leftKneePitchTauDesired).*sqrt(leftKneePitchTauDesired.^2+rightKneePitchTauDesired.^2);
ankleYm= sign(leftKneePitchTauMeasured).*sqrt(leftKneePitchTauMeasured.^2+rightKneePitchTauMeasured.^2);
max(ankleYm)
plot(t1,ankleYd,'Color','k','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,ankleYm,'Color','k','LineStyle','--','LineWidth',pW);
set(gca,'FontSize',fS)

load('valHardwareHFB31push4FromEndTime2.mat');
z = leftHipPitchTauDesired;
iF = length(z);
m=127.2996;
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
ankleYd= sign(leftKneePitchTauDesired).*sqrt(leftKneePitchTauDesired.^2+rightKneePitchTauDesired.^2);
ankleYm= sign(leftKneePitchTauMeasured).*sqrt(leftKneePitchTauMeasured.^2+rightKneePitchTauMeasured.^2);
max(ankleYm)
plot(t1,ankleYd,'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,ankleYm,'Color','b','LineStyle','--','LineWidth',pW);
axis([0 2.5 -140 40])
ylabel('$\boldmath{\tau}_{kn,y}$ [Nm]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(6,2,6);
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')
load('valHardwareDEF42push1Time2.mat');
z = leftHipPitchTauDesired;
iF = length(z);
m=127.2996;
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
ankleYd= sign(leftHipPitchTauDesired).*sqrt(leftHipPitchTauDesired.^2+rightHipPitchTauDesired.^2);
ankleYm= sign(leftHipPitchTauMeasured).*sqrt(leftHipPitchTauMeasured.^2+rightHipPitchTauMeasured.^2);
max(ankleYm)
plot(t1,ankleYd,'Color','k','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,ankleYm,'Color','k','LineStyle','--','LineWidth',pW);
set(gca,'FontSize',fS)

load('valHardwareHFB31push4FromEndTime2.mat');
z = leftHipPitchTauDesired;
iF = length(z);
m=127.2996;
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
ankleYd= sign(rightHipPitchTauDesired).*sqrt(leftHipPitchTauDesired.^2+rightHipPitchTauDesired.^2);
ankleYm= sign(rightHipPitchTauMeasured).*sqrt(leftHipPitchTauMeasured.^2+rightHipPitchTauMeasured.^2);
max(ankleYm)
plot(t1,ankleYd,'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,ankleYm,'Color','b','LineStyle','--','LineWidth',pW);
axis([0 2.5 -20 120])
ylabel('$\boldmath{\tau}_{hp,y}$ [Nm]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(6,2,8);
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')
load('valHardwareDEF42push1Time2.mat');
z = leftHipPitchTauDesired;
iF = length(z);
m=127.2996;
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
ankleYd= torsoPitchTauDesired;
ankleYm= torsoPitchTauMeasured;
max(ankleYm)
plot(t1,ankleYd,'Color','k','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,ankleYm,'Color','k','LineStyle','--','LineWidth',pW);
set(gca,'FontSize',fS)

load('valHardwareHFB31push4FromEndTime2.mat');
z = leftHipPitchTauDesired;
iF = length(z);
m=127.2996;
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
ankleYd= torsoPitchTauDesired;
ankleYm= torsoPitchTauMeasured;
max(ankleYm)
plot(t1,ankleYd,'Color','b','LineStyle','-','LineWidth',pW);
hold on;
plot(t1,ankleYm,'Color','b','LineStyle','--','LineWidth',pW);
axis([0 2.5 -60 40])
ylabel('$\boldmath{\tau}_{bk,y}$ [Nm]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(6,2,10);
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')
load('valHardwareDEF42push1Time2.mat');
load('valHardwareDEF42push1TimeCoPFix.mat');
z = leftHipPitchTauDesired;
iF = length(z);
m=127.2996;
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
ankleYd= -sign(desiredCMPX).*sqrt(desiredCMPX.^2+desiredCMPY.^2)-sqrt(desiredCMPX(1)^2+desiredCMPY(1)^2);
ankleYm= sqrt((rawLeftFootCoPPositionsInWorldX-rawLeftFootCoPPositionsInWorldX(1)).^2+(rawLeftFootCoPPositionsInWorldY-rawLeftFootCoPPositionsInWorldY(1)).^2)-0.03;
plot(t1,ankleYd,'Color','k','LineStyle','-','LineWidth',pW);
ankleYm=ankleYm(176:end)
iF = length(ankleYm);
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
hold on;
plot(t1,ankleYm,'Color','k','LineStyle','--','LineWidth',pW);
set(gca,'FontSize',fS)

load('valHardwareHFB31push4FromEndTime2.mat');
load('valHardwareHFB31push4FromEndCoPFix.mat');
z = leftHipPitchTauDesired;
iF = length(z);
m=127.2996;
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
ankleYd= -sign(desiredCMPY).*sqrt(desiredCMPX.^2+desiredCMPY.^2)-sqrt(desiredCMPX(1)^2+desiredCMPY(1)^2);
ankleYm= sqrt((rawLeftFootCoPPositionsInWorldX-rawLeftFootCoPPositionsInWorldX(1)).^2+(rawLeftFootCoPPositionsInWorldY-rawLeftFootCoPPositionsInWorldY(1)).^2)-0.03;
plot(t1,ankleYd,'Color','b','LineStyle','-','LineWidth',pW);
ankleYm=ankleYm(176:end)
iF = length(ankleYm);
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
hold on;
plot(t1,ankleYm,'Color','b','LineStyle','--','LineWidth',pW);
axis([0 2.5 -0.04 0.14])
ylabel('$x_{cop}$ [m]','FontSize',fS)
set(gca,'FontSize',fS)

subplot(6,2,12);
area([DT (0.15+DT)],[1000 1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
hold on;
area([DT (0.15+DT)],[-1000 -1000], 'FaceColor',[1 1 1]*kGray,'LineStyle','none','ShowBaseLine','off')
plot([DT DT],[-1000 1000],'Color','k')
hold on;
plot([DT+0.14 DT+0.14],[-1000 1000],'Color','k')
plot([DT+0.14*2 DT+0.14*2],[-1000 1000],'Color','k')
plot([DT+0.14*3 DT+0.14*3],[-1000 1000],'Color','k')
plot([DT+0.14*4 DT+0.14*4],[-1000 1000],'Color','k')
plot([DT+0.14*5 DT+0.14*5],[-1000 1000],'Color','k')
plot([DT+0.14*6 DT+0.14*6],[-1000 1000],'Color','k')
load('valHardwareDEF42push1Time2.mat');
z = leftHipPitchTauDesired;
iF = length(z);
m=127.2996;
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
ankleYm= -sign(icpErrorX).*sqrt(icpErrorX.^2+icpErrorY.^2);
max(ankleYm)
plot(t1,ankleYm,'Color','k','LineStyle','--','LineWidth',pW);
set(gca,'FontSize',fS)

load('valHardwareHFB31push4FromEndTime2.mat');
z = leftHipPitchTauDesired;
iF = length(z);
m=127.2996;
t1=[];
for k=1:iF
   t1(k)=k*0.002; 
end
ankleYm= sign(icpErrorX).*sqrt(icpErrorX.^2+icpErrorY.^2);
max(ankleYm)
plot(t1,ankleYm,'Color','b','LineStyle','--','LineWidth',pW);
axis([0 2.5 -0.04 0.14])
xlabel('Time [s]','FontSize',fS)
ylabel('$\xi_{e,x}$ [m]','FontSize',fS)
set(gca,'FontSize',fS)

%lgd = legend([p1 p2 p3],{'Desired','Achieved','Measured'},'FontSize',fS,'Interpreter','latex');
%lgd.Location='north';
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
exportfig(gcf,'valcomparetimeHW.eps', opts)

%%
load('valHardwareDEF42push1Time.mat');
torsoY = sqrt(pelvisErrorRotationVectorX.^2 +pelvisErrorRotationVectorY.^2);
max(torsoY)
load('valHardwareHFB31push4FromEndTime.mat');
torsoY = sqrt(pelvisErrorRotationVectorX.^2 +pelvisErrorRotationVectorY.^2);
max(torsoY)
%%
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');
fS=10
figure('rend','painters','pos', [0 0 300 215]);
i1= round(31.5/dt);
i2= round(33/dt);
t = table2array(hardwareTestHFB332shrink(:,1));
F = table2array(hardwareTestHFB332shrink(:,2));
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
HFB331impuls = trapz(t,F)
axis([0 0.35 -10 400])
title(HFB331impuls)
hold on;

i1= round(6/dt);
i2= round(7.5/dt);
t = table2array(hardwareTestDEF422shrink(:,1));
F = table2array(hardwareTestDEF422shrink(:,2))-2.8;
s = find(gradient(F(i1:i2))>5,1);
t = t(i1+s-2:i1+s+30)-t(i1+s-2);
F = F(i1+s-2:i1+s+30);
plot(t,F) %30.195
SDEF421impuls = trapz(t,F)
hold on;
title(SDEF421impuls)
axis([0 0.35 -10 500])

xlabel('Time [s]','FontSize',fS);
ylabel('Force [N]','FontSize',fS);
legend({'Vertical Motion','Default'},'FontSize',fS)
opts.Format = 'eps';
opts.Color = 'CMYK';
opts.Resolution = 10000000;
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
set(gca,'FontSize',fS)
exportfig(gcf,'impulsecompare.eps', opts)