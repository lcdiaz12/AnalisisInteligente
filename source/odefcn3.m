function dydt = odefcn2(t,y,~,u)

% constant model values
a=0.01;
L=0.05;
R=20;
b=540;
k=20;
m=0.5;
bp=1200;
kp=410;
mp=90.5;
beta=1.64e9;
ro=830.612;
cd=0.7;
w=0.024;
Ps=3.5e4;
A=0.001855;
V0=3.1e-4;



dydt = zeros(6,1);
dydt(1) = ((a+y(2))/(L*y(2)))*(u-y(1)*R-((y(1)*a*L)/(a+y(2))^2)*y(3));
dydt(2) = (y(3));
dydt(3) = ((y(1)^2*a*L)/(2*m*(a+y(2))^2))-(k/m)*y(2)-(b/m)*y(3);
dydt(4) = (beta/(V0+A*y(5)))*cd*w*y(2)*sqrt((Ps-sign(y(2))*y(4))/ro);
dydt(5) = y(6);
dydt(6) = (A/mp)*y(4)-(kp/mp)*y(5)-(bp/mp)*y(6);




end