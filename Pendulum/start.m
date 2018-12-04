% Voorbeeldje om een diff.verg. te gebruiken i.c.m. optimalisatiefunctie.
% Hier wordt gekeken voor welke startsnelheid een auto met alleen air
% resistance en rolling resistance precies tot stilstand komt na 500m.


%Voorbeeld van hoe de diff.verg. oplost:
tspan=[0:0.001:10];
a = 2.4;
zmin = 0.9;
zmax =1.064;

for i=1:1
    a = 2.4
% Nu optimaliseren naar die vijfhonderd meter: voor welke startsnelheid?
% options = saoptimset('PlotFcns',{@saplotbestx,...
%           @saplotbestf,@saplotx,@saplotf}); %Voor de niceheid

upperBnd = -0.2; %maximale upper bound snelheid [m/s]
lowerBnd = -0.4;  %minimale lower bound snelheid [m/s]

eersteGok = -0.35; %Eerste gok: dit is dus anders dan de initial condition
% zoals bedoeld wordt in de diff.verg. ode45()

%Uitvoeren van de optimalistatiefunctie. Zie hier dat de 
[s,fval] = simulannealbnd(@(s) afstandOptimFun(s,a,zmin,zmax),eersteGok,lowerBnd,upperBnd,options);

%Nu nog laten zien dat de gevonden waarde uitstekend past:
[tsol,xsol] = ode45(@(tsol,xsol) penDynFcn(tsol,xsol,a,zmin,zmax),tspan,[s ,1.0,1.0,0.0]);

figure; 
plot(xsol(:,1),xsol(:,3));
axis([-0.4 0 0.5 1.3]);

xcp = xsol(1,1)
position0velocity= xsol(find(xsol(:,2)<0.0001,1),1)

end

%%
prevCost=NaN;
for i=1:10000
    x0= -0.2+0.0002*i;
    cost = afstandOptimFun2(x0,a,zmin,zmax);
    if(prevCost<cost)
        break;
    end
    prevCost = cost;
end