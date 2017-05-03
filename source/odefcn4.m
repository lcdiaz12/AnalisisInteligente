function dydt = odefcn4(t,y,~,u)

% constant model values
m=24; %Kg
ks=1610;
bd=310;
Ps=1.03e7;
Aa=3.26e-4;
alpha=1.51e10;
beta=1;
gamma=7.28e8;
M=300;
an=2.4315e5;
bn=6.2529e2;
Cn=2.5676e5;
Fr=0;
Ka=0.947;
tao=0.0017;


dydt = zeros(4,1);
dydt(1) = y(2);
dydt(2) = (1/m)*(-ks*y(1)-bd*y(2)+Aa*y(3)-Fr-M);
dydt(3) = -alpha*y(2)-beta*y(3)+(gamma*sqrt(Ps-sign(y(4))*y(3))*y(4));
dydt(4) = -1/tao*y(4)+(Ka/tao)*u;
%dydt(5) = -Cn*y(4)-bn*y(5)+an*u;




end