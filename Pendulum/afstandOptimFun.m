function [stopafstandVerschil] = afstandOptimFun(startPositie,a,zmin,zmax)
% Hier wordt de optimalisatiefunctie gedefinieerd: we willen het verschil
% tussen stopafstand en 500m minimaliseren.

%Eerst de diff.verg. oplossen om de resultaten te bepalen
tspan=[0:0.001:10];
[t,x] = ode45(@(t,x) penDynFcn(t,x,a,zmin,zmax),tspan,[startPositie,1.0,1.0,0.0]);

%Dan bepalen waar de stopafstand is
s = find(x(:,2) <0.00001,1); %Eerste punt waar de snelheid minimaal is
if(length(s)==0)
    stopafstand=100;
else
stopafstand = x(s,1);   %Dit is daarvoor de afstand
end

stopafstandVerschil = abs(0 - stopafstand); %minimum = 0: dan is de stopafstand gelijk aan 500
end

