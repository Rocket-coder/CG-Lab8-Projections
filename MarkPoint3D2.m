function Name=MarkPoint3D2(VP,P,r,colour)
% VP - view point
%  P - viewplane
%  r - size of VP
%----------------------------------
str=vector2str(VP,5,1);
if VP(4)==0;  
   Name=['Parallel projection onto viewplane P:',Plane2str(P,4,1)];
   Name=[Name,' from VP=',str]; 
else   
    Name=['Perspective projection onto viewplane P:',Plane2str(P,4,1)];
    plot3(VP(1),VP(2),VP(3),'-bo','LineWidth',1,'MarkerEdgeColor','k',...
              'MarkerFaceColor',colour,'MarkerSize',r); 
    hold on          
    ts2='\fontsize{14}\bf\color{black}';
    Ttl=[ts2,'The viewpoint VP=',str];
    dx = 0.2; dy=0.2; dz=0.2;   
    text(VP(1)+dx, VP(2)+dy, VP(3)+dz, Ttl);  
    hold on    
end;           
%---------------------------------------------------------
% set(gca,'XColor','b','YColor','b','ZColor','b',...
%             'fontsize',14,'fontweight','b');
% ts1='\fontsize{18}\bf\color{red}';
% title([ts1,Name]);  
% ts3='\fontsize{16}\bf\color{black}';
% xlabel([ts3,'x']); ylabel([ts3,'y']);  zlabel([ts3,'z']); 
% axis(L);
% axis square; 
% grid on
end
%
