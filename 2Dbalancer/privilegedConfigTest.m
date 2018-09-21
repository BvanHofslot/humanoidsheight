clc;
clear all;
close all;

%syms ls lt lb
%syms q_ak q_kn q_hp dq_ak dq_kn dq_hp
%syms x dx ddx z dz ddz

q_ak = -0.2;
q_kn = 0.4;
q_hp = -0.2;

dq_ak = 0.1;
dq_kn = -0.3;
dq_hp = 0.1;

% Parameters
ls = 0.4;
lt = 0.3;
lb = 0.25;
lf = 0.16;
lf_1 = 0.2*lf;
lf_2 = 0.8*lf;
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
x=-ls*sin(q_ak)-lt*sin(q_ak+q_kn)-lb*sin(q_ak+q_kn+q_hp);
z=ls*cos(q_ak)+lt*cos(q_ak+q_kn)+lb*cos(q_ak+q_kn+q_hp);
Theta = q_ak+q_kn+q_hp;
r_com = [x z Theta]';

% Ankle to CoM Jacobian
f = [x, z, Theta];
q = [q_ak, q_kn, q_hp]';
dq = [dq_ak, dq_kn, dq_hp]';
J = [ - lt*cos(q_ak + q_kn) - ls*cos(q_ak) - lb*cos(q_ak + q_hp + q_kn), - lt*cos(q_ak + q_kn) - lb*cos(q_ak + q_hp + q_kn), -lb*cos(q_ak + q_hp + q_kn);...
 - lt*sin(q_ak + q_kn) - ls*sin(q_ak) - lb*sin(q_ak + q_hp + q_kn), - lt*sin(q_ak + q_kn) - lb*sin(q_ak + q_hp + q_kn), -lb*sin(q_ak + q_hp + q_kn);...
                                                                 1,                                                  1,                           1];
                                                             
dJ = [   lt*(dq_ak+dq_kn)*sin(q_ak + q_kn) + ls*(dq_ak)*sin(q_ak) + lb*(dq_ak+ dq_hp+dq_kn)*sin(q_ak + q_hp + q_kn),...
    lt*(dq_ak+dq_kn)*sin(q_ak + q_kn) + lb*(dq_ak+dq_hp+dq_kn)*sin(q_ak + q_hp + q_kn), ...
    lb*(dq_ak+dq_hp+dq_kn)*sin(q_ak + q_hp + q_kn);...
 - lt*(dq_ak+dq_kn)*cos(q_ak + q_kn) - ls*(dq_ak)*cos(q_ak) - lb*(dq_ak+dq_hp+dq_kn)*cos(q_ak + q_hp + q_kn),...
    - lt*(dq_ak+dq_kn)*cos(q_ak + q_kn) - lb*(dq_ak+dq_hp+dq_kn)*cos(q_ak + q_hp + q_kn),...
    -lb*(dq_ak+dq_hp+dq_kn)*cos(q_ak + q_hp + q_kn);...
     0,    0,            0];

 dr_com = J*dq;
 dx = dr_com(1);
 dz = dr_com(2);
 dTheta = dr_com(3);
 
% Momentum matrix and linear selector S
Sxz = [1 0 0; 0 0 0; 0 0 0];
A = robotMass*J;
dA = robotMass*dJ;
SxzA= Sxz*A;

% Desired linear momentum rate of change
xi = x + sqrt(z0/g)*dx;
r_copd = r_copr + k_xi*(xi-xi_r);
dldtx_d = robotMass*g*(x-r_copd)/z;
dhdt_d = [dldtx_d 0 0]';

% Motion objective (keep upperbody straight)
Theta_d = 0;
Sth = [ 0 0 1];
SthJ = Sth*J;
dSthJ= Sth*dJ;

% QP
p = Theta_d - dSthJ*dq;
b = dhdt_d - dA*dq;
H = [SxzA' SthJ']*[SxzA; SthJ]; % *1/2 in quadprog
f = -(b'*SxzA + p'*SthJ)'; 

x = quadprog(H,f);



