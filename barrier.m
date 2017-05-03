function out= barrier(x,bvalue,i)

    m=length(x);
    sum=0;
    for j=1:1:m
        if i~=j
            sum=sum+(bvalue/(1-(abs(x(i)-x(j)))));
        end
    end
    
    out=sum;
    
end