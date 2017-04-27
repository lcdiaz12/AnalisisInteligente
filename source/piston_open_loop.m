clear all;
close all;
clc


%% Datos del sistema

%xk=zeros(4,1); % definicion del valor actual como las condiciones inicales
xk = [0 0 -5200 -6200 1e5];
%xk=[0 ;0];
%ut_1=[0;0]; % valor inicial de parametro adicional (señal de control u)
u=0;
u1=0;
u2=0;
ref=4;
K=1;
u1=zeros(1,10000);
u2=zeros(1,10000);
u1(1000:4000)=1;
u1(5000:8000)=-1;
u2(2000:3000)=1;
u2(3000:4000)=-1;
u2(6000:7000)=1;
u2(7000:8000)=-1;



%% solución al sistema para encontrar su comportamiento
T=1/1000; % periodo de muestreo de los datos
for k=1:1:10000
    time(k)=k*T; %tiempo en cada iteración
    tSpan=[0 T];% intervalo de solucion
    [tt,xx]=ode45('odefcn',tSpan,xk,[],u1(k),u2(k));%[](no opciones),para(argumentos adicionales)
    xk=xx(length(xx),:); % A/D
    x(k,:)=xk; %th(k)=xk(1);%guarada valor de la variable de estado1
%     error=ref-xk(1);
%     u=-(K*error);%-0.1*x(2);% asignación de la señal de control
%     if error>0
%         u1=u;
%         u2=u;
%     else
%         u1=u;
%         u2=u;
%     end
        
    % save variables
%    ut(k)=u; %guardar la variable
%    errort(k)=error;
end



h1=figure(1);
axes1 = axes('Parent',h1,'FontSize',15);
set(gcf, 'Position', get(0,'Screensize'))% ampliar la gráfica a toda la pantalla
%set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 50 30])
% print('-depsc2', 'test.eps');
xlim(axes1,'auto'); % definicion de los limites del eje x 
ylim(axes1,'auto'); % definicion de los limites del eje y 
box(axes1,'on');% grafica el borde de los ejes al rededor de la gráfia
hold(axes1,'all'); %acotar los ejes a los limites definidos(aplicar axes1)
plot(time,x(:,1),'g',time,x(:,2),'linewidth',2);
xlabel('Tiempo [s]','Interpreter','latex','FontSize',22);
ylabel('Magnitud','Interpreter','latex','FontSize',22);
title('Resultado posicion y velocidad','Interpreter','latex','LineWidth',1,'FontSize',22);
legend('pos','vel')



h2=figure(2);
axes1 = axes('Parent',h2,'FontSize',15);
set(gcf, 'Position', get(0,'Screensize'))% ampliar la gráfica a toda la pantalla
%set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 50 30])
% print('-depsc2', 'test.eps');
xlim(axes1,'auto'); % definicion de los limites del eje x 
ylim(axes1,'auto'); % definicion de los limites del eje y 
box(axes1,'on');% grafica el borde de los ejes al rededor de la gráfia
hold(axes1,'all'); %acotar los ejes a los limites definidos(aplicar axes1)
plot(time,x(:,3),'r','linewidth',2);
plot(time,x(:,4),'g','linewidth',2);
plot(time,x(:,5),'b','linewidth',2);
xlabel('Tiempo [s]','Interpreter','latex','FontSize',22);
ylabel('presiom [psi]','Interpreter','latex','FontSize',22);
title('presion','Interpreter','latex','LineWidth',1,'FontSize',22);
legend('PA','PB','Pp')


