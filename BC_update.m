function u_final = BC_update(nele,u_reduce,BC_data);
    
    n=(nele+1)*2;
    u_final=zeros(n,1);
    
    for j=1:size(BC_data,1)
        y(j)=BC_data(j,1)*2 - (2/BC_data(j,2)) + 1;
    end
    
    u_final(y,:)=[BC_data(:,3)];
    
    for i=1:n
       x(i)=i;
    end
    
    x(:,y)=[];
    
    u_final(x,:)=[u_reduce(:,1)];

end