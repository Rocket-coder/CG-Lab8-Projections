function VN=NormalizeCoord(V)
% To normalize homogeneous coordinates
%  
VN=zeros(size(V));
[M,N]=size(V);
for k=1:N;
    if V(M,k)==0; error('The last coordinate is 0'); 
    else 
       for p=1:M-1;
           VN(p,k)=V(p,k)/V(M,k);
       end;
       VN(M,k)=1;
    end;    
end;
end

