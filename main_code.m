clc
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input_file_beam_prob_a

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
disp('globle stiffness matrix and globle load vector before implementing point load and point moment')
[K,F]=stiff_load(nele,ngauss,coord,xivec,wvec,E,Ie,q_load)

disp('---------------------------------------------------------------------------------------------')
disp('Global load vector after implementing point load and point moment')
F_1 = point_ld_mom(nele,F,P_load,P_moment)

disp('---------------------------------------------------------------------------------------------')
disp('reduced stiffness matrix and load vector')
[K_reduce,F_reduce]=impose_BC(nele,BC_data,K,F_1)

disp('---------------------------------------------------------------------------------------------')
disp('reduced displacement vector')
u_reduce = K_reduce^-1*F_reduce

disp('---------------------------------------------------------------------------------------------')
disp('final displacement vector')
u_final = BC_update(nele,u_reduce,BC_data)

disp('---------------------------------------------------------------------------------------------')
disp('reaction load vector')
F_reaction = K*u_final

%{
error_R1= -R1 - F_reaction(1)
error_M1= -M1 - F_reaction(2)
error_deflection = delta - u_final(nele*2+1)
error_rotation = theta - u_final(nele*2+2)
%}

[xnume, unume,unume1] = postprocessing(nele,coord,u_final);

% Ploting:
h = figure(1);

plot(xnume,unume,'b-','linewidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',8);

% Labelling Axes
xlabel('x (m)','fontsize',18);
ylabel('u (m)','fontsize',18);

title('FEM Comparison of deflections')
legend({'2 Elements sol','6 Elements sol'},'Location','northwest')

saveas(h,'Deflection comparison que3','png')
hold on

h=figure(2)
plot(xnume,unume1,'b-','linewidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',8);

% Labelling Axes
xlabel('x (m)','fontsize',18);
ylabel('u (rad)','fontsize',18);

title('FEM Comparison of slopes')
legend({'2 Elements sol','6 Elements sol'},'Location','northwest')

% Saving the figure
saveas(h,'Slope comparison que3','png')
hold on

% % ==============================================
% %% Printing Intermediate Result to The Output File
% % ------------------------------------------------

fid=fopen('output_q3_2ele.txt','w');

fprintf(fid,'\n\nThe Final Solution\n');
fprintf(fid,'=========================\n\n');
fprintf(fid,'u_final\n');
fprintf(fid,'--\n');
for i = 1:2*(nele+1)
   fprintf(fid,'%12.4e\n\n',u_final(i));
end

fprintf(fid,'\n\nThe Reaction Forces can be found from\n');
fprintf(fid,'=========================================\n\n');
fprintf(fid,'F = K*u_final\n');
fprintf(fid,'---------\n');
for i = 1:2*(nele+1)
   fprintf(fid,'%12.4e\n\n',F_reaction(i));
end
%save('filename111','fid')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input_file_beam_prob_a6

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('globle stiffness matrix and globle load vector before implementing point load and point moment')
[K,F]=stiff_load(nele,ngauss,coord,xivec,wvec,E,Ie,q_load)

disp('---------------------------------------------------------------------------------------------')
disp('Global load vector after implementing point load and point moment')
F_1 = point_ld_mom(nele,F,P_load,P_moment)

disp('---------------------------------------------------------------------------------------------')
disp('reduced stiffness matrix and load vector')
[K_reduce,F_reduce]=impose_BC(nele,BC_data,K,F_1)

disp('---------------------------------------------------------------------------------------------')
disp('reduced displacement vector')
u_reduce = K_reduce^-1*F_reduce

disp('---------------------------------------------------------------------------------------------')
disp('final displacement vector')
u_final = BC_update(nele,u_reduce,BC_data)

disp('---------------------------------------------------------------------------------------------')
disp('reaction load vector')
F_reaction = K*u_final

[xnume, unume,unume1] = postprocessing(nele,coord,u_final);

%{
error_R1= -R1 - F_reaction(1)
error_M1= -M1 - F_reaction(2)
error_deflection = delta - u_final(nele*2+1)
error_rotation = theta - u_final(nele*2+2)
%}


% Ploting:
h = figure(1);

plot(xnume,unume,'r-','linewidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',8);

% Labelling Axes
xlabel('x (m)','fontsize',18);
ylabel('u (m)','fontsize',18);

title('FEM Comparison of deflections')
legend({'2 Elements sol','6 Elements sol'},'Location','northwest')

saveas(h,'Deflection comparison que3','png')
hold on

h=figure(2)
plot(xnume,unume1,'r-','linewidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',8);

% Labelling Axes
xlabel('x (m)','fontsize',18);
ylabel('u (rad)','fontsize',18);

title('FEM Comparison of slopes')
legend({'2 Elements sol','6 Elements sol'},'Location','northwest')

% Saving the figure
saveas(h,'Slope comparison que3','png')
hold on

fid=fopen('output_q3_6ele.txt','w');

fprintf(fid,'\n\nThe Final Solution\n');
fprintf(fid,'=========================\n\n');
fprintf(fid,'u_final\n');
fprintf(fid,'--\n');
for i = 1:2*(nele+1)
   fprintf(fid,'%12.4e\n\n',u_final(i));
end

fprintf(fid,'\n\nThe Reaction Forces can be found from\n');
fprintf(fid,'=========================================\n\n');
fprintf(fid,'F = K*u_final\n');
fprintf(fid,'---------\n');
for i = 1:2*(nele+1)
   fprintf(fid,'%12.4e\n\n',F_reaction(i));
end
%save('filename111','fid')



    






