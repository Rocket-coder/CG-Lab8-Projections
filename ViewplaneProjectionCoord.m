function [VPC,VC,Oxy]= ViewplaneProjectionCoord(VH,P)
%
A=P(1); B=P(2); C=P(3); D=P(4);
O =[0, 0, -D/C, 1];
Ox=[0,-C,    B, 0];
Oy=[B^2+C^2, -A*B, -A*C, 0];
Ox=ort(Ox); Oy=ort(Oy);
K=[Ox ; Oy; O];
VC=inv(K*K')*K;
VPC=VC*VH;
VPC=NormalizeCoord(VPC);
Oxy=K;
end

