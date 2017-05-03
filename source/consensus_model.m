function dx=consensus_model(t,x,~,a,r,alpha,bvalue)
% consensus_model  Es una funci�n que toma los valores de estado (x),
% par�metros adicionales (a,r) y entrega los valores de las din�micas del
% sistema (dx). usualmente es usada en la soluci�n de ecuaciones
% diferenciales.

dx=zeros(6,1); %inicializaci�n derivadas

for i=1:1:6 % recorre estados generando \dot{x}
    sum=0; %definicion del valor inicial e la sumatoria
    b=0;
    for j=1:1:6 % recorre los agentes vecinos
        if a(i,j)~=0
            sum=sum+a(i,j)*(x(j)-x(i));
            
        end        
    end
    dx(i)=(sum+a(i,7)*(r-x(i)))*alpha+ barrier(x,bvalue,i); %d�namicas de consesus follower leader
end



