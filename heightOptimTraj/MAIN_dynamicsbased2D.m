% MAIN.m
%
% Solve the cart-pole swing-up problem

clc; clear all; close all;
addpath ../../

p.m = 1;
p.g = 9.81;  % (m/s^2) gravity
w1 = 100000;
nSteps=2;
nSegments=100000000000000;

maxForce =inf;  %Maximum actuator forces
x0 = -0.31;   %-0.319275
z0 = 1.0;
dx0 = 1.0;
dz0 = 0.0;
duration = 1;

xinit=x0;
zinit=z0;
dxinit=dx0;
dzinit=dz0;

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                     Set up function handles                             %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

problem.func.dynamics = @(t,x,u)( dynamics(x,u,p) );
problem.func.pathObj = @(t,x,u) ( u.^2 );  %Force-squared cost function (1-(x(2,:)).^2)
problem.func.bndObj = @(t0,x0,tF,xF) (w1*xF(3)^2);

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                     Set up problem bounds                               %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

problem.bounds.initialTime.low = 0;
problem.bounds.initialTime.upp = 0;
problem.bounds.finalTime.low = duration-0.9;
problem.bounds.finalTime.upp = duration+0.9;

problem.bounds.initialState.low = [x0;z0;dx0;dz0];
problem.bounds.initialState.upp = [x0;z0;dx0;dz0];
problem.bounds.finalState.low = [0;z0;0;0];
problem.bounds.finalState.upp = [0;z0;0.001;0];

problem.bounds.state.low = [x0;1.0;-inf;-inf];
problem.bounds.state.upp = [0;1.1*z0;inf;inf];

problem.bounds.control.low = -5;
problem.bounds.control.upp = 5;

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                    Initial guess at trajectory                          %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

problem.guess.time = [0,duration];
finalStateGuess= (problem.bounds.finalState.low+problem.bounds.finalState.upp)/2;
problem.guess.state = [problem.bounds.initialState.low, problem.bounds.finalState.low];
problem.guess.control = [0,0];


%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                         Solver options                                  %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

problem.options.nlpOpt = optimset(...
    'Display','iter',...
    'MaxFunEvals',1e5);

% problem.options.method = 'trapezoid';
problem.options.method = 'hermiteSimpson';
problem.options.defaultAccuracy = 'high';
problem.options.hermiteSimpson.nSegments = nSegments;
% problem.options.method = 'rungeKutta';
% problem.options.method = 'chebyshev';

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                            Solve!                                       %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

soln = optimTraj(problem);




%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                        Display Solution                                 %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

%%%% Unpack the simulation
t = linspace(soln.grid.time(1), soln.grid.time(end), 20);
q = soln.interp.state(t);
u = soln.interp.control(t);

%%%% get final state
qf=soln.grid.state(:,end);
xNew=-(sqrt(qf(2)/9.81)*qf(3))*0.94;
q02=[xNew; qf(2);qf(3);qf(4)];

x02 = q02(1);   %-0.319275
z02 = q02(2);
dx02 = q02(3);
dz02 = q02(4);

if (dx02>0.01)

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                     Set up function handles                             %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

problem2.func.dynamics = @(t2,x2,u2)( dynamics(x2,u2,p) );
problem2.func.pathObj = @(t2,x2,u2) (  (x2(4,:).*u2).^2 );  %Force-squared cost function (1-(x(2,:)).^2)
problem2.func.bndObj = @(t02,x02,tF2,xF2) (w1*xF2(3)^2);

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                     Set up problem bounds                               %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

problem2.bounds.initialTime.low = 0;
problem2.bounds.initialTime.upp = 0;
problem2.bounds.finalTime.low = duration-1.9;
problem2.bounds.finalTime.upp = duration+1.8;

problem2.bounds.initialState.low = [x02;z02;dx02;dz02];
problem2.bounds.initialState.upp = [x02;z02;dx02;dz02];
problem2.bounds.finalState.low = [0;z0;0;0];
problem2.bounds.finalState.upp = [0;z0;dx02;0];



problem2.bounds.state.low = [x02;0;-inf;-inf];
problem2.bounds.state.upp = [0;1.1*z0;inf;inf];

problem2.bounds.control.low = 0;
problem2.bounds.control.upp = maxForce;

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                    Initial guess at trajectory                          %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

problem2.guess.time = [0,duration];
problem2.guess.state = [problem2.bounds.initialState.low,problem2.bounds.finalState.low];
problem2.guess.control = [0,0];


%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                         Solver options                                  %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

problem2.options.nlpOpt = optimset(...
    'Display','iter',...
    'MaxFunEvals',1e5);

% problem.options.method = 'trapezoid';
problem2.options.method = 'hermiteSimpson';
problem2.options.defaultAccuracy = 'high';
problem2.options.hermiteSimpson.nSegments = nSegments;
% problem.options.method = 'rungeKutta';
% problem.options.method = 'chebyshev';

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                            Solve!                                       %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

soln2 = optimTraj(problem2);




%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                        Display Solution                                 %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

%%%% Unpack the simulation
t2 = linspace(soln2.grid.time(1), soln2.grid.time(end), 150);
q2 = soln2.interp.state(t2);
u2 = soln2.interp.control(t2);

qf2=soln2.grid.state(:,end);
end

%%%% Draw Trajectory:
figure();
plot(q(1,:),q(2,:),'Color','b','linewidth',2);
hold on;
x=[0,0];
z=[0,qf(2)];
line(x,z,'LineStyle','--','Color','r','linewidth',2);
x=[xinit,0];
z=[zinit,0];
hold on;
line(x,z,'LineStyle','--','Color','r','linewidth',2);
axis([-0.4 0.4 0.0 1.5])
xlabel('x','FontSize', 35)
ylabel('z','FontSize', 35)
grid off;

if (dx02>0.01)
plot(q2(1,:)-x02,q2(2,:),'Color','b','linewidth',2);
x=[0,-x02];
z=[z02,0];
hold on;
line(x,z,'LineStyle','--','Color','r','linewidth',2);
x=[-x02,-x02];
z=[0,qf2(2)];
line(x,z,'LineStyle','--','Color','r','linewidth',2);
end

opts.Format = 'eps';
opts.color = 'CMYK';
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'optimTraj03untuned.eps', opts)

figure;
subplot(1,2,1)
plot(q(1,:),q(2,:),'Color','b','linewidth',2);
xlabel('x','FontSize', 35)
ylabel('z','FontSize', 35)
subplot(1,2,2)
plot(q(1,:),u,'Color','b','linewidth',2)
xlabel('x','FontSize', 35)
ylabel('u','FontSize', 35)
opts.Format = 'eps';
opts.color = 'CMYK';
set(gca,'LineWidth',1)
set(gca,'GridAlpha',0.4)
exportfig(gcf,'weirdInput.eps', opts)



