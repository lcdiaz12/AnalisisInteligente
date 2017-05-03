function dx=consensus_model(t,x,~,a,r,alpha,bvalue)
% consensus_model  Es una función que toma los valores de estado (x),
% parámetros adicionales (a,r) y entrega los valores de las dinámicas del
% sistema (dx). usualmente es usada en la solución de ecuaciones
% diferenciales.

dx=zeros(6,1); %inicialización derivadas

for i=1:1:6 % recorre estados generando \dot{x}
    sum=0; %definicion del valor inicial e la sumatoria
    b=0;
    for j=1:1:6 % recorre los agentes vecinos
        if a(i,j)~=0
            sum=sum+a(i,j)*(x(j)-x(i));
            
        end        
    end
    dx(i)=(sum+a(i,7)*(r-x(i)))*alpha+ barrier(x,bvalue,i); %dínamicas de consesus follower leader
end



