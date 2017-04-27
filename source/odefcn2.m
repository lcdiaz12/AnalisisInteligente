function dydt = odefcn2(t,y,~,u)

% constant model values
m=74; %Kg
ks=1610; %N/m
bd=310; %N/(m/s)
A=3.26e-4; %m^2
M=300; %N
alpha=1.51e10; %N/m^3
beta=1; %1/s
Ps=1.03e7; %pa
T=0.0017;
K=0.947;
gamma=7.28e8; %kg^0.5/m^1.5s^2
Fr=0;
%u=0.01;
an=2.4315e5;
bn=6.2529e2;
cn=2.5676e5;



dydt = zeros(4,1);
dydt(1) = y(2);
dydt(2) = (1/m)*(-ks*y(1)-bd*y(2)+A*y(3)-Fr-M);
dydt(3) = -alpha*y(2)-beta*y(3)+(gamma*sqrt(Ps-sign(y(4))*y(3)))*y(4);
dydt(4) = -(1/T)*y(4)+(K/T)*u;
%dydt(5) = -cn*y(4)-bn*y(5)+an*u;




end