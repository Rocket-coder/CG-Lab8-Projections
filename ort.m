function vo=ort(v)
% Normalizing of a vector
if   norm(v)==0; 
     printvector('ERROR: zero-vector: v=', v); vo=v;
else vo=v/norm(v);
end;    
end               