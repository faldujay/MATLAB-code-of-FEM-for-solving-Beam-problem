function [K,F]=stiff_load(nele,ngauss,coord,xivec,wvec,Ee,Ie,q_load)

    q_load_1=zeros(nele,4);
    for x=1:size(q_load,1)
        
        q_load_1(q_load(x,1),:)= q_load(x,:);
        
    end

    K=zeros(((nele-1)*2 + 4),((nele-1)*2 + 4));
    F=zeros(((nele-1)*2 + 4),1);
    
for j=1:nele
le = coord(j+1,2) - coord(j,2);
%ke(j)=0;
%fe(j)=0;
for i=1:ngauss
     xi=xivec(i);
     w=wvec(i);

    B1 = 3*xi/2;
    B2 = le*(3*xi - 1)/4;
    B3 = -3*xi/2;
    B4 = le*(3*xi + 1)/4;

    B = (4/le^2)*[B1 B2 B3 B4];
 
    q = q_load_1(j,:)*[0;1;xi;xi^2];
     
    N1=0.25*(1-xi)^2*(2+xi);
    N2=0.25*(1-xi)^2*(1+xi);
    N3=0.25*(1+xi)^2*(2-xi);
    N4=0.25*(1+xi)^2*(xi-1);

    N=[N1 0.5*le*N2 N3 0.5*le*N4];
    
    K((2*j - 1):(2*j + 2),(2*j - 1):(2*j + 2)) = K((2*j - 1):(2*j + 2),(2*j - 1):(2*j + 2)) + (Ee(j)*Ie(j)*le/2)*(B'*B)*w;;
    F((2*j - 1):(2*j + 2),1) = F((2*j - 1):(2*j + 2),1) + N'*q*le*0.5;
    
end

end
 
end
    
    