close all
clear all
clc


% consensus initial values
Tc=0.5; %consensus period
initValuesC=[1;2;1.5;0.5;1.5;0.5]; %valores iniciales
initv=initValuesC; %copia de valores iniciales
refC=4; % posicion de referencia Consensus
alpha=0.2;
a=(ones(7)-eye(7)); %matriz de adyacencia, unos y ceros en la diagonal
Tsol=5; %tiempo de solución

% model values
K=1;
Ki=1e-4;
Ts=0.1;
ini= [0 -5200 -6200 1e5];
times=0;
poss=initValuesC';

%valores iniciales para cada piston
for i=1:1:6
    x(1,:,i)=[initValuesC(i),ini];
end

for i=1:1:Tsol/Tc;
    %%% consensus solution
    
    a(length(initValuesC)+1,:)=0; %valores de la matriz de adyacencia para el lider
    [tt,xx]=ode45('consensus_model',[0 Tc],initValuesC,[],a,refC,alpha);%[](no opciones),para(argumentos adicionales)
    pos=xx(length(xx),:);   
    
    
    
    timec(i)=i*Tc; % saving time values
    posc(i,:)=pos; % saving position values
    
    
    %%% physical system solution
    for j=1:1:6
        [system(:,:,j),time,u(:,j)]=piston(x(:,:,j),pos(j),K,Ki,Ts,Tc);
    end
    
   
    % saving real values solution
    m=length(poss(:,1));
    n=length(system(:,1,1));
    for j=1:1:6
        poss(m+1:m+n,j)=system(1:n,1,j);
        us(m+1:m+n,j)=u(1:n,j);
        x(1,:,j)=system(n,:,j);
        times(m+1:m+n)=[time(1:n)'+ones(1,n)'*times(m)];
    end
    %times=[times;time'+ones(1,n)'*times(m)];
        
    %%% values actualization
    %initValuesC=poss(m+n-1,:); % consensus actualiza a valor de la planta y no de su valor ideal
    initValuesC=pos; %consensus no ve la planta real
end

posc=[initv';posc]; % agregar valor inicial
timec=[0,timec]; % agregar tiempo inicial

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
    plot(timec,posc(:,i),'linewidth',2);
    plot(times,poss(:,i),'--','linewidth',2);
    plot(times,us(:,i),'--','linewidth',2);
    pause
end
%plot(time,pos(:,1),time,pos(:,2),time,pos(:,3),time,pos(:,4),'r','linewidth',2);
xlabel('Tiempo [s]','Interpreter','latex','FontSize',22);
ylabel('Desplazamiento $x(t)$','Interpreter','latex','FontSize',22);
title('Resultado posicion','Interpreter','latex','LineWidth',1,'FontSize',22);
legend('piston1C','piston1','piston2C','piston2','piston3C','piston3','piston4C','piston4','piston5C','piston5','piston6C','piston6')
