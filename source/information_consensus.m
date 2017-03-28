% Sscript que encuentra el resultado en tiempo para un sistemas de agentes
% unidimensionales que llegan a un consensus en una posición de referencia

clear all;
close all;
clc

T=1/20;% tasa de muestreo 20 sps

%% Datos del sistema
initValues=[1;2;3;3.5;1.5;0]; %valores iniciales
r=4; % posicion de referencia


xk=initValues;
ut=[0;0;0;0;0;0]; % valor inicial de parametro adicional (señal de control u)
a=ones(7)-eye(7); %matriz de adyacencia, unos y ceros en la diagonal
a(7,:)=0; %valores de la matriz de adyacencia para el lider


%% solución al sistema 

for k=1:1:100
    time(k)=k*T; %tiempo en cada iteración
    tSpan=[0 T];% intervalo de solucion
    [tt,xx]=ode45('consensus_model',tSpan,xk,[],a,r);%[](no opciones),para(argumentos adicionales)
    xk=xx(length(xx),:);
    pos(k,1:6)=xk(1:6);
end
pos=[initValues';pos]; % agregar valor inicial
time=[0,time]; % agregar tiempo inicial



%% gráfica de resultados

h1=figure(1);
axes1 = axes('Parent',h1,'FontSize',15);
set(gcf, 'Position', get(0,'Screensize'))% ampliar la gráfica a toda la pantalla
%set(gcf,'PaperUnits','centimeters','PaperPosition',[0 0 50 30])
% print('-depsc2', 'test.eps');
xlim(axes1,'auto'); % definicion de los limites del eje x 
ylim(axes1,'auto'); % definicion de los limites del eje y 
box(axes1,'on');% grafica el borde de los ejes al rededor de la gráfia
hold(axes1,'all'); %acotar los ejes a los limites definidos(aplicar axes1)
hold all
for i=1:1:6
    plot(time,pos(:,i),'linewidth',2);
end
%plot(time,pos(:,1),time,pos(:,2),time,pos(:,3),time,pos(:,4),'r','linewidth',2);
xlabel('Tiempo [s]','Interpreter','latex','FontSize',22);
ylabel('Desplazamiento $x(t)$','Interpreter','latex','FontSize',22);
title('Resultado posicion','Interpreter','latex','LineWidth',1,'FontSize',22);
legend('piston1','piston2','piston3','piston4','piston5','piston6')

savefig('../outputs/consensusTrajectory.fig')


