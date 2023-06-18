function PlotPlane3D2(P,K,ax,cole,colv,colf,r,we,WS)
% Plot a plane P=[A,B,C,D] in 3d with Oxy (optional)
% 
x0=WS(1); x1=WS(2); y0=WS(3); y1=WS(4); z0=WS(5); z1=WS(6);
%-------- Coordinates of vertices ---------------------------------
p1=[x0,y1,z1,1]; p2=[x1,y1,z1,1]; p3=[x1,y0,z1,1]; p4=[x0,y0,z1,1];
p5=[x0,y1,z0,1]; p6=[x1,y1,z0,1]; p7=[x1,y0,z0,1]; p8=[x0,y0,z0,1];
%-------- Arrays of vertices and edges ----------------------------
V = [p1; p2; p3; p4; p5; p6; p7; p8];
E=[1,2; 2,3; 3,4; 4,1; 1,5; 5,6; 2,6; 6,7; 3,7; 7,8; 4,8; 8,5];
%-------------- Oxy ------------------------------------
s=5;             % length of axes arrows
Ox=s*K(1,1:3);
Oy=s*K(2,1:3);
O=K(3,1:3);
dx = 0.1; dy=0.1; dz=0.1; %d=0.3;  
ts0='\fontsize{16}\bf\color{black}';
if ax==1;
    quiver3(O(1),O(2),O(3),Ox(1),Ox(2),Ox(3),0,...
              'k','LineWidth',2,'MarkerEdgeColor','k',...
                'MarkerFaceColor','k','MarkerSize',1);   %Ox
    text(Ox(1)+O(1)+dx, Ox(2)+O(2)+dy, Ox(3)+O(3)+dz, [ts0,'x']);        
    hold on            
    quiver3(O(1),O(2),O(3),Oy(1),Oy(2),Oy(3),0,...
              'm','LineWidth',2,'MarkerEdgeColor','k',...
               'MarkerFaceColor','m','MarkerSize',1);    %Oy 
    text(Oy(1)+O(1)+dx, Oy(2)+O(2)+dy, Oy(3)+O(3)+dz, [ts0,'y']);         
    hold on
    plot3(O(1),O(2),O(3),'-bo','LineWidth',1,'MarkerEdgeColor','k',...
                  'MarkerFaceColor','b','MarkerSize',8);  %O  
    %text(O(1)-0.3, O(2)-0.3, O(3)+0.2, [ts0,'O']);          
end;
%------------------------------------------------------------------
IP=zeros(12,4);
k=0;
for e=1:12;
    [ok,X]=SegmentXPlane(V(E(e,1),:),V(E(e,2),:),P); 
    if ok==1; k=k+1; IP(k,:)=X; end;
end;
k=k+1;
IP(k,:)=IP(1,:);
XP=IP(1:k,1); YP=IP(1:k,2); ZP=IP(1:k,3);
%-------- Visualization -------------------------------------------
col=strcat('-',cole,'o');
plot3(XP, YP, ZP, col,... 
              'LineWidth',we,'MarkerEdgeColor',colv,...  %we=4
              'MarkerFaceColor',colv,'MarkerSize',r);    %r=8
hold on  
fill3(XP,YP,ZP,colf);
%-------------- Axes ------------------------------------
%ts1='\fontsize{20}\bf\color{red}';
ts3='\fontsize{16}\bf\color{black}';
%ts4='\fontsize{16}\bf\color{blue}';
set(gcf,'Color','w')
set(gca,'XColor','b','YColor','b','ZColor','b',...
        'fontsize',14,'FontWeight','bold');
%title([ts1,Name]);  
xlabel([ts3,'x']); ylabel([ts3,'y']); zlabel([ts3,'z']);
axis(WS);
axis square; 
%view([1,2,1])
grid on
end

