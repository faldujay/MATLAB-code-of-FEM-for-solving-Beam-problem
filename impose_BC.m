function [K_reduce,F_reduce]=impose_BC(nele,BC_data,K,F_1)

    n=(nele+1)*2;
    u=zeros(n,1);
    
    for i=1:size(BC_data,1)
        x=BC_data(i,1)*2 - (2/BC_data(i,2)) + 1;
        u(x) = BC_data(i,3);
    end
    
    FF = F_1 - K*u;
    k1=K;
    f1=FF;
   
    for j=1:size(BC_data,1)
        y(j)=BC_data(j,1)*2 - (2/BC_data(j,2)) + 1;
    end
    
    k1(y,:)=[];
    k1(:,y)=[];
    f1(y,:)=[];
    
    K_reduce = k1;
    F_reduce = f1;
    
end

    