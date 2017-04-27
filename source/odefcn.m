function dydt = odefcn(t,y,~,u)

% constant model values
m=10;
A1=19.64;
A2=16.49;
FL=1000; % fuerza de la carga
E=1.4e9;
V01=0.02;
V02=0.762;
VOP=0.075;
Vs=0.019;
nuv=0.95;
u1=0;
u2=u;
sAT=0.19;
sAP=0.1;
sBT=0.2;
pT=10e5;
pN=5e5;
sBP=0.15;
QN=0.53;



dydt = zeros(5,1);
dydt(1) = y(2);
dydt(2) = (1/m)*(y(3)*A1-y(4)*A2-FL);

dydt(3) = (E/(V01+A1*y(1)))*(-A1*y(2)-sigma(u2-sBT)*QN*sqrth((y(3)-pT)/pN)...
    +sigma(-u2-sBP)*QN*sqrth((y(5)-y(3))/pN));

dydt(4)= (E/(V02-A2*y(1)))*(A2*y(2)+sigma(u2-sAP)*QN*sqrth((y(5)-y(4))/pN)...
    -sigma(-u2-sAT)*QN*sqrth((y(4)-pT)/pN));

dydt(5)=(E/VOP)*(Vs*nuv*u1-sigma(u2-sAP)*QN*sqrth((y(5)-y(4))/pN)...
    -sigma(-u2-sBP)*QN*sqrth((y(5)-y(3))/pN));



end