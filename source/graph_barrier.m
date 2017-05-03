close all
clear all
clc


load('posc_0.mat')


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
colors=['b','r','g','m','c','y'];
colors2=[1,1,0;1,0,1;0,1,1;1,0,0;0,1,0;0,0,1;1,1,1;0,0,0];
colors3=[0.9,0.9,0;0.9,0,0.9;0,0.9,0.9;0.9,0,0;0,0.9,0;0,0,0.9;0.9,0.9,0.9;0,0,0];
for i=6:1:6
    plot(timec,posc(:,i),'linewidth',2);
    %plot(times,real(poss(:,i)),'Color',colors3(i,:),'LineStyle','--','linewidth',2);
end
%plot(time,pos(:,1),time,pos(:,2),time,pos(:,3),time,pos(:,4),'r','linewidth',2);
xlabel('Tiempo [s]','Interpreter','latex','FontSize',22);
ylabel('Desplazamiento $x(t)$','Interpreter','latex','FontSize',22);
title('Resultado posicion agente 6','Interpreter','latex','LineWidth',1,'FontSize',22);

hold all




load('posc_1e-3.mat')
for i=6:1:6
    plot(timec,posc(:,i),'linewidth',2);
    %plot(times,real(poss(:,i)),'Color',colors3(i,:),'LineStyle','--','linewidth',2);
end
legend('sin barrera','con barrera')