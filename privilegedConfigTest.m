clc;
clear all;
close all;

ls = 0.4;
lt = 0.3;
lb = 0.25;
lf = 0.16;
lf_1 = 0.2*lf;
lf_2 = 0.8*lf;

syms ls lt lb
syms q_ak q_kn q_hp dq_ak dq_kn dq_hp
syms x dx ddx z dz ddz

% Parameters
g = 9.81;
robotMass = 14;
z0 = 1;
k_xi = 5;
b_1x = 1/sqrt(2);  % basis vectors
b_1z = 1/sqrt(2);
b_1 = [b_1x b_1z]';
b_2 = [-b_1x b_1z]';
W_h = 1; % momentum weight (2x2)
W_j = 1; % task weight (1x1)   
W_ddq = 1; % qdd weight (3x3)
W_rho = 1;  % rho weight (2x2)
W_p = 1;

% Reference
r_copr = 0;
xi_r = 0;

% Function foot to CoM position and orientation;
fx=-ls*sin(q_ak)-lt*sin(q_ak+q_kn)-lb*sin(q_ak+q_kn+q_hp);
fz=ls*cos(q_ak)+lt*cos(q_ak+q_kn)+lb*cos(q_ak+q_kn+q_hp);
Theta = q_ak+q_kn+q_hp;

% Ankle to CoM Jacobian
f = [fx, fz, Theta];
q = [q_ak, q_kn, q_hp];
J = jacobian(f,q);

% Momentum matrix and linear selector S
Sxz = [1 0 0; 0 1 0];
A = robotMass*J;
SxzA= Sxz*A;

% Desired linear momentum rate of change
xi = x + sqrt(z0/g)*dx;
r_copd = r_copr + k_xi*(xi-xi_r);
dhdt_d = robotMass*g*(x-r_copd)/z;

% Motion objective (keep upperbody straight)
Theta_d = 0;
Sth = [ 0 0 1];
SthJ = Sth*J;
SthJd= [dq_ak, dq_kn, dq_hp];

% QP
H = [SxzA' SthJ']*[SxzA; SthJ];






