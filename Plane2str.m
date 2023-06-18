function PName=Plane2str(P,m,n);
% Plane Ax+By+Cz=D to LaTeX string
% P=[A,B,C,D]  
%-------------------------------------------------------
PName='';
if (min(size(P))~=1)||(max(size(P))~=4);  
   error('Wrong format of data'); 
end; 
if max(abs(P(1:3)))==0; % all coefficients are 0
    error('All coefficients are 0'); 
end; 
% k=1 -------------------------------------
a=P(1);  as=number2str(a,m,n);  
if     a== 0;  S=  '';  
elseif a== 1;  S= 'x';  
elseif a==-1;  S='-x'; 
elseif a~= 0;  S=[as,'x']; 
end; 
% k=2 -----------------------------------   
b=P(2); bs=number2str(b,m,n); 
if length(S)>0; 
   if     b== 0;  S=S;
   elseif b== 1;  S=[S,'+y'];  
   elseif b==-1;  S=[S,'-y']; 
   elseif (b>0)&(abs(b)~=1); 
                  S=[S,'+',bs,'y'];
   else           S=[S,bs,'y'];  
   end;
else
   if     b== 0;  S=S;  
   elseif b== 1;  S= 'y';  
   elseif b==-1;  S='-y'; 
   elseif b~= 0;  S=[bs,'y']; 
   end; 
end;  
% k=3 -----------------------------------   
c=P(3); cs=number2str(c,m,n);    
if length(S)>0; 
   if     c== 0;  S=S;
   elseif c== 1;  S=[S,'+z'];  
   elseif c==-1;  S=[S,'-z']; 
   elseif (c>0)&(abs(c)~=1); 
                  S=[S,'+',cs,'z'];
   else           S=[S,cs,'z'];    
   end;
else
   if     c== 0;  S=S;  
   elseif c== 1;  S= 'z';  
   elseif c==-1;  S='-z'; 
   elseif c~= 0;  S=[cs,'z']; 
   end; 
end;   
%----------------------------------------
S=[S,'=',number2str(P(4),m,n);]; 
PName=S; 
end

