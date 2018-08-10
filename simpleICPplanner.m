
steptime = 0.5;
cop = 1.0;
xcurr=0.747;
z0=1;
omega = sqrt(9.81/z0);
ICPcurr= 1.1044;
ICPprev = cop +(ICPcurr-cop)*exp(-omega*steptime);
ICPnext = exp(omega*steptime)*(ICPcurr-cop)+cop;

x1=ICPcurr;
%x0 = -0.5*exp(2*omega*steptime)*(ICPprev-cop)+0.25*exp(omega*steptime)*(x1 -cop)+0.5*(ICPprev+cop)

xnext=0.5*exp(omega*steptime)*(ICPcurr-cop)-0.5*exp(-omega*steptime)*(ICPcurr+cop-2*xcurr)+cop