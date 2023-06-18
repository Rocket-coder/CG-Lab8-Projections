function [ok,X]=SegmentXPlane(L0,L1,P)
%
% P=[A,B,C,D] in homogeneous coordinates
% L0=[x0,y0,z0,1] - initial point of the segment
% L1=[x1,y1,z1,1] - terminal point of the segment
%
eps=0.0000001;
L01=L1-L0;
q=L01*P';
if abs(q)<eps; %printstring('SegmentXPlane message: ','Segment || plane');
               ok=0; X=[0,0,0,0]; return; end;
s=L0*P';
t=-s/q;
X=t*L01+L0;
if (t>1)||(t<0); ok=0; 
           %printvector('Out of segment: X=',X);
else ok=1; %printvector('Intersection: X=',X);
end;
end

