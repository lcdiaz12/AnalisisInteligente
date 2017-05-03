function [x,time,u]=piston2(xk,ref,K,Ki,T,Tsol,M)
%% Datos del sistema

%xk=zeros(4,1); % definicion del valor actual como las condiciones inicales
%xk = [1 0 6e6 0 0];
%xk=[0 ;0];
%ut_1=[0;0]; % valor inicial de parametro adicional (señal de control u)
u=1e-6;
% K=1e-2;
% Ki=1e-7;
int=0;
%ref=0.5;
% u1=zeros(1,10000);
% u2=zeros(1,10000);
% u1(1000:4000)=1;
% u1(5000:8000)=-1;


%% solución al sistema para encontrar su comportamiento
%T=1/100; % periodo de muestreo de los datos
for k=1:1:Tsol/T
    time(k)=k*T; %tiempo en cada iteración
    tSpan=[0 T];% intervalo de solucion
    [tt,xx]=ode45('odefcn2',tSpan,xk,[],u(k),M);%[](no opciones),para(argumentos adicionales)
    xk=xx(length(xx),:); % A/D
    x(k,:)=xk; %th(k)=xk(1);%guarada valor de la variable de estado1
    error(k)=ref-xk(1);
    int(k+1)=int(k)+error(k);
    u(k+1)=(K*error(k)+Ki*int(k));
    %u=(K*error)+Ki*int;
    %ut(k)=u;
    %ut_1=[0;0];
end


% 
% h1=figure(1);
% axes1 = axes('Parent',h1,'FontSize',15);
% set(gcf, 'Position', get(0,'Screensize'))% ampliar la gráfica a toda la pantalla
% %set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 50 30])
% % print('-depsc2', 'test.eps');
% xlim(axes1,'auto'); % definicion de los limites del eje x 
% ylim(axes1,'auto'); % definicion de los limites del eje y 
% box(axes1,'on');% grafica el borde de los ejes al rededor de la gráfia
% hold(axes1,'all'); %acotar los ejes a los limites definidos(aplicar axes1)
% plot(time,x(:,1),'g',time,x(:,2),'linewidth',2);
% xlabel('Tiempo [s]','Interpreter','latex','FontSize',22);
% ylabel('Magnitud','Interpreter','latex','FontSize',22);
% title('Resultado posicion y velocidad','Interpreter','latex','LineWidth',1,'FontSize',22);
% legend('pos','vel')
% 
% 
% 
% h2=figure(2);
% axes1 = axes('Parent',h2,'FontSize',15);
% set(gcf, 'Position', get(0,'Screensize'))% ampliar la gráfica a toda la pantalla
% %set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 50 30])
% % print('-depsc2', 'test.eps');
% xlim(axes1,'auto'); % definicion de los limites del eje x 
% ylim(axes1,'auto'); % definicion de los limites del eje y 
% box(axes1,'on');% grafica el borde de los ejes al rededor de la gráfia
% hold(axes1,'all'); %acotar los ejes a los limites definidos(aplicar axes1)
% plot(time,x(:,3),'g','linewidth',2);
% xlabel('Tiempo [s]','Interpreter','latex','FontSize',22);
% ylabel('presiom [psi]','Interpreter','latex','FontSize',22);
% title('presion','Interpreter','latex','LineWidth',1,'FontSize',22);
% %legend('Valor deseado','Velocidad resultante')
end


