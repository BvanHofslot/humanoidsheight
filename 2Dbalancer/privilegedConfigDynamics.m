function [ddqdtt, rho] = privilegedConfigDynamics(q, dqdt, dhdt_d, motionTasks, q, dq, Wh, Wj,Wrho,Wddq,Wp)
q_ak=q(1);
q_kn=q(2);
q_hp=q_3;

% Function foot to CoM position and orientation;
fx=-ls*sin(q_ak)-lt*sin(q_ak+q_kn)-lb*sin(q_ak+q_kn+q_hp);
fz=-ls*cos(q_ak)-lt*cos(q_ak+q_kn)-lb*cos(q_ak+q_kn+q_hp);
Theta = q_ak+q_kn+q_hp;

% Ankle to CoM Jacobian
f = [fx, fz, Theta];
q = [q_ak, q_kn, q_hp];
J = jacobian(f,q);

% Momentum matrix and linear selector S
S = [1 0 0; 0 1 0; 0 0 0];
A = robotMass*J;
SA= S*A;

%


end

