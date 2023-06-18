function PlotProjection(V,A,L,Name)
% 
L=L(1:4);     % window size for 2D
N=size(V,2);  % number of points
Px=V(1,:);  Py=V(2,:);  Px=Px'; Py=Py';
%-------------------------------------------------------
set(gcf,'Color','w') 
subplot(1,1,1)
%-- Corners ---------------------------------------------
plot(L(1),L(3),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(L(2),L(3),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(L(1),L(4),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
            
plot(L(2),L(4),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5); 
hold on             
%-- Projection of the Sceleton ----------------------------
X=zeros(2,1); Y=zeros(2,1); 
for x=1:N; 
    X(1,1)=V(1,x); Y(1,1)=V(2,x);
    for y=x:N;  
       if A(x,y)==1; 
          X(2,1)=V(1,y); Y(2,1)=V(2,y);      
          plot(X,Y,'-bo','LineWidth',3,'MarkerEdgeColor','k',...
               'MarkerFaceColor','k','MarkerSize',1); 
          hold on
       end;
    end;
end;
%-- Sceleton --------------------------------------------
% plot(X,Y,'-bo','LineWidth',3,'MarkerEdgeColor','k',...
%                'MarkerFaceColor','k','MarkerSize',1);     
% hold on 
%------- Axes Oxy ---------------------------------------
s=5;
ts0='\fontsize{16}\bf\color{black}';
O=[0,0]; Ox=s*[1,0]; Oy=s*[0,1];
X=[O(1),Ox(1)]; Y=[O(2),Ox(2)];
arl=1.0;
dX=diff(X); dY=diff(Y);
quiver(X(1:end-1),Y(1:end-1),arl*dX,arl*dY,0,...
             '-k','LineWidth',3,'MarkerEdgeColor','k',...
              'MarkerFaceColor','k','MarkerSize',2); 
text(Ox(1)+0.1, Ox(2), [ts0,'x']);           
hold on 
X=[O(1),Oy(1)]; Y=[O(2),Oy(2)];
arl=1.0;
dX=diff(X); dY=diff(Y);
quiver(X(1:end-1),Y(1:end-1),arl*dX,arl*dY,0,...
             '-m','LineWidth',3,'MarkerEdgeColor','k',...
              'MarkerFaceColor','k','MarkerSize',2); 
text(Oy(1)-0.05, Oy(2)+0.3, [ts0,'y']);           
hold on 
%-- Origin ---------------------------------------------
d = 0.4;
if ((L(1)*L(2)<=0)&(L(3)*L(4)<=0));
    plot(0,0,  '-ko','LineWidth',1,'MarkerEdgeColor','k',...
                     'MarkerFaceColor','k','MarkerSize',10); 
    text(-d, 0, [ts0,'O']);             
end;                 
hold on
%-- Points ----------------------------------------------
d = 0.15;
ts2='\fontsize{16}\bf\color{black}';
for p=0:N-1;
  plot(Px(p+1),Py(p+1),'-ko','LineWidth',1,'MarkerEdgeColor','r',...
                 'MarkerFaceColor','r','MarkerSize',8);   
  ps=int2str(p);
  text(Px(p+1)+d, Py(p+1), [ts2,'P_{',ps,'}']);       
  hold on
end;
%---------------------------------------------------------
set(gca,'XColor','b','YColor','b','fontsize',14,'fontweight','b');
ts1='\fontsize{20}\bf\color{red}';
title([ts1,Name]);  
ts3='\fontsize{16}\bf\color{black}';
xlabel([ts3,'x']); ylabel([ts3,'y']); 
%xlabel([ts3,Slope]); 
axis(L);
axis square; %axis tight; %axis equal 
grid on
%hold off
end
%
