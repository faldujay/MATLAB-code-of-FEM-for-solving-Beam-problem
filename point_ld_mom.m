function  F_1 = point_ld_mom(nele,F,P_load,P_moment)

    a=zeros((nele+1)*2,1);
    
    if size(P_load,1) ~= 0
        for i=1:size(P_load,1)
            a(P_load(i,1)*2 - 1) = P_load(i,2);
        end
    end
    
    if size(P_moment,1) ~= 0    
        for i=1:size(P_moment,1)
            a(P_moment(i,1)*2) = P_moment(i,2);
        end
    end
    
    F_1 = F + a;
    
end
        
