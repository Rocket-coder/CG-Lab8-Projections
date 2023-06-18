function [V,A,B,Name]=PolytopeData3(showdata); 
% The description of a convex polytope in 3D
%
Name='Square pyramid '; 
%-------- Coordinates of vertices ---------------------------------
V=[0, 0, 0, 1;
   2, 0, 0, 1;
   1, 1, 2, 1; 
   2, 2, 0, 1;
   0 , 2, 0, 1];
V=V'; 
%--------- The adjacency matrix of the polytope sceleton ----------
A=[1 1 1 0 1;...
   1 0 1 1 0;...
   1 1 0 1 1;...
   0 0 1 0 1;...
   0 1 0 1 0;...
   1 0 0 1 1];
%---------- The list of faces -------------------------------------
B=[3,1,2,3,0;...
   3,3,4,5,0;...
   3,2,3,4,0;...
   3,1,3,5,0;...
   4,1,2,4,5];
%------------------------------------------------------------------
if showdata==1
   N=size(V,2);                      % number of vertices 
   NE=sum(A(:))/2;                   % number of edges
   NF=size(B,1);                     % number of faces
   S=[' has ',int2str(N),' vertices, ',int2str(NE),' edges,',...
      ' and ',int2str(NF),' faces.'];
   printstring(Name,S);
   for k=1:NF
       vf=B(k,1);
        S=['Face ',int2str(k),' has ',int2str(vf),' vertices: '];
        printstring(S, vector2str(B(k,2:vf+1),4,1));
   end
   V
end

