%POLYTOPEPROJECTIONS;
%
%-------- Window --------------------------------------------------
w=7; 
x0=-w; x1=w; y0=-w; y1=w; z0=-w; z1=w;
%x0=0; x1=w; y0=0;  y1=w; z0=0;  z1=w;
WS=[x0, x1, y0, y1, z0, z1]; 
%----------- Polytope ---------------------------------------------
[V,A,~,Name]=PolytopeData3(0); 
%[V,A,~,Name]=CubeData; 
%--------- Colours ------------------------------------------------  
colors=ColoursList;
%----------- To shift to barycenter and scale ---------------------
N=size(V,2);                      % number of vertices 
bcp=sum(V,2)/N; bc(1:3)=bcp(1:3); % barycenter
sf=1;                             % scale factors
s=sf*[1,1,1];                     
T=[ s(1),    0,    0, -bc(1);...
       0, s(2),    0, -bc(2);...
       0,    0, s(3), -bc(3);...
       0,    0,    0,     1];
V=T*V   
%-------- Projection data -----------------------------------------             
P=[0.2, 0.2, 1,4];         % projection plane (viewplane)
%P=[1,1,1,7];
%VP=[3.5, 1.8, 3.8, 1];    % viewpoint
VP=[3.5, 1.8, 3.8, 0];     % viewpoint at infinity
%VP=[2,2,3,1];
%VP=[2,2,3,0];
%-------- Construction of the projection matrices ----------------- 
I=eye(4);                  % identity 4x4-matrix
T=VP'*P -(P*VP')*I;
VH=T*V;                    % Homogenous coordinated of projections        
VN=NormalizeCoord(VH)      % Normalaized 3D coordinates                         % 2D coordinates in VP plane
[VPC,T2,Oxy]=ViewplaneProjectionCoord(VH,P); 
VPC
%-------- Visualization -------------------------------------------
ax=1;
VPname=[' viewplane P:',Plane2str(P,4,1)];
r=1; we=1; cole='r'; colv='k'; colf=colors(4); %colors(26); %light blue
PlotPlane3D2(P,Oxy,0,cole,colv,colf,r,we,WS)
hold on
points=0; cole='r'; colv='k'; r=5; we=3;
Title=['Sceleton of ',Name,' and the',VPname];
PlotPolytopeSceleton3D(V,A,points,cole,colv,r,we,Title,WS)
hold on 
Name=MarkPoint3D2(VP,P,12,'g');
hold on 
pause
points=0; cole='b'; colv='k'; r=5; we=3;
PlotPolytopeSceleton3D(VN,A,points,cole,colv,r,we,Name,WS)
hold on
PlotProjectionLines3D2(VP,V,VN);
hold on 
ShowMatrix3D(T,11,11);
%cameratoolbar('Show');
hold off
if ax==1;
   Name=['Projection onto',VPname]; 
   pause
   PlotProjection(VPC,A,WS,Name)
   hold on
   Show3x4Matrix(T2,'T2',6.9,6);
end;
hold off 
