l=0.5
th1=-0.3;
th2=0.01;

x= l*sin(th1)+l*sin(th1+th2)
y= l*cos(th1)+l*cos(th1+th2)

J= [l*cos(th1)+l*cos(th1+th2) l*cos(th1+th2);
    -l*sin(th1)-l*sin(th1+th2) l*sin(th1+th2)]

dotkfront = [x y]'/sqrt(x^2+y^2)
dotkback= [-x y]'/sqrt(x^2+y^2)

qddfront = (J^-1)*dotkfront
qddback = (J^-1)*dotkback