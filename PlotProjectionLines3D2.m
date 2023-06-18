function PlotProjectionLines3D2(VP,V,VN)
% r - size 
%---------------------------------------
N=size(V,2);  % number of points
if VP(4)==0;  % Parallel projection
   for k=1:N;
      ck=V(:,k); pk=VN(:,k); C=[ck,pk];      
      plot3(C(1,:), C(2,:), C(3,:),'--ko','LineWidth',1,...
      'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',0.1);   
      hold on
   end  
else          % Perspective projection
   for k=1:N;
     pk=VN(:,k); C=[VP',pk];  
     plot3(C(1,:), C(2,:), C(3,:),'--ko','LineWidth',1,...
     'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',0.1);   
     hold on
   end
end   
end

