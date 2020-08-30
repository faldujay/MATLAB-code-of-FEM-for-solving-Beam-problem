function [xnume, unume ,unume1] = postprocessing(nele,coord,u_final)

    xnume= []; unume = []; unume1=[];
for i=1:nele
        le=coord(i+1,2)-coord(i,2);
        xi=[-1:0.1:1]';
        Nx = [(1-xi)/2, (1+xi)/2];
        
        xe=coord(i:i+1,2);
        
        ue = u_final(2*i-1:2*i+2);
        
        N1=0.25*(1-xi).^2.*(2+xi);
        N2=0.25*(1-xi).^2.*(1+xi);
        N3=0.25*(1+xi).^2.*(2-xi);
        N4=0.25*(1+xi).^2.*(xi-1);
        
        N11 = (-3+3*xi.^2)/4;
        N22 = (-1 -2*xi +3*xi.^2)/4;
        N33 = (3 -3*xi.^2)/4;
        N44 = (-1 + 2*xi + 3*xi.^2)/4;

        N=[N1 0.5*le*N2 N3 0.5*le*N4];
        NN = 2*(1/le)*[N11 le*N22/2 N33 le*N44/2];
        
        xnume = [xnume;Nx*xe];
        unume = [unume;N*ue];
        unume1 = [unume1;NN*ue];
       
end

end