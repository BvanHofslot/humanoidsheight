% MAIN.m
%
% Solve the cart-pole swing-up problem

clc; clear;
addpath ../../

p.m = 1;
p.g = 9.81;  % (m/s^2) gravity

maxForce =inf;  %Maximum actuator forces
x0 = -0.29;   %-0.319275
z0 = 1.0;
dx0 = 1.0;
dz0 = 0.0;
duration = 2;

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                     Set up function handles                             %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

problem.func.dynamics = @(t,x,u)( dynamics(x,u,p) );
problem.func.pathObj = @(t,x,u) ( (x(4,:).^2) );  %Force-squared cost function
% problem.func.bndObj = @(t0,x0,tF,xF) (xF(3)^2);
% problem.func.pathCst = @(t,x,u) (legLengthConstraint(x(:,1),x(:,2)));

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                     Set up problem bounds                               %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

problem.bounds.initialTime.low = 0;
problem.bounds.initialTime.upp = 0;
problem.bounds.finalTime.low = duration;
problem.bounds.finalTime.upp = duration;

problem.bounds.initialState.low = [x0;z0;dx0;dz0];
problem.bounds.initialState.upp = [x0;z0;dx0;dz0];
problem.bounds.finalState.low = [0;z0;0;-1.0];
problem.bounds.finalState.upp = [0;z0;dx0;0];

problem.bounds.state.low = [2*x0;0;-inf;-inf];
problem.bounds.state.upp = [-2*x0;1.2*z0;inf;inf];

problem.bounds.control.low = 0;
problem.bounds.control.upp = maxForce;

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%                    Initial guess at trajectory                          %
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

problem.guess.time = [0,duration];
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
t = linspace(soln.grid.time(1), soln.grid.time(end), 150);
q = soln.interp.state(t);
u = soln.interp.control(t);

%%%% Plots:

%%%% Draw Trajectory:
figure();
plot(q(1,:),q(2,:))
axis([-0.5 0.05 0.0 1.5])
figure;
plot(q(1,:),u)


