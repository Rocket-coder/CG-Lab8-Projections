function [V,A,B,Name]=CubeData; 
% The description of a convex polytope in 3D
%
Name='Cube'; 
%-------- Coordinates of vertices ---------------------------------
V=[-1, 1, 1, 1;
    1, 1, 1, 1;
    1,-1, 1, 1; 
   -1,-1, 1, 1;
   -1, 1,-1, 1;
    1, 1,-1, 1;
    1,-1,-1, 1;
   -1,-1,-1, 1];
V=V'; 
%--------- The adjacency matrix of the polytope sceleton ----------
%  1 2 3 4 5 6 7 8
A=[0 1 0 1 1 0 0 0; %1
   1 0 1 0 0 1 0 0; %2
   0 1 0 1 0 0 1 0; %3
   1 0 1 0 0 0 0 1; %4
   1 0 0 0 0 1 0 1; %5
   0 1 0 0 1 0 1 0; %6
   0 0 1 0 0 1 0 1; %7
   0 0 0 1 1 0 1 0];%8
if A~=A'; error([Name,': wrong adjacency matrix']); end;
%---------- The list of faces -------------------------------------
B=[4,1,2,3,4;
   4,1,2,6,5;
   4,2,3,7,6;
   4,3,4,8,7;
   4,1,4,8,5;
   4,5,6,7,8];
%------------------------------------------------------------------
N=size(V,2);                      % number of vertices 
NE=sum(A(:))/2;                   % number of edges
NF=size(B,1);                     % number of faces
S=[' has ',int2str(N),' vertices, ',int2str(NE),' edges,',...
   ' and ',int2str(NF),' faces.'];
printstring(Name,S);
for k=1:NF;
    vf=B(k,1);
    S=['Face ',int2str(k),' has ',int2str(vf),' vertices: '];
    printstring(S, vector2str(B(k,2:vf+1),4,1));
end

