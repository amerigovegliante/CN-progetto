function [f,g]=myobjective(z,A)
%Input:
%   z numero complesso
%   A matrice quadrata invertibile
% Output:
%   fA(x) := det(A − zI)
%   gA(z):= −fA(z)/f′A(z)= −1 / trace[(A − zI)^−1 d/dz(A − zI) = 1 / trace [(A − zI)^−1]
dim=size(A,1);
B=A-z*eye(dim);
[L, U, P]=lu(B);
s=0;
row=1;
for col=1:size(P,2)
    i=row+1;
    while P(row,i)~=1
        i=i+1;
    end
    j=row+1;
    while P(j,col)~=1
        j=j+1;
    end
    if P(row, row)~=1
        s=s+1;
        P(row, row)=1;
        P(row,i)=0;
        P(j,col)=0;
        P(j,i)=1;
    end
end
detP=(-1)^s;
detU=U(i,i);
for i=2:size(U,1)
    detU=detU*U(i,i);
end
detB=detP*detU;
invB=inv(B);
trace(invB)=invB(1,1);
for i=2:size(invB,1)
    trace(invB)=trace(invB)+invB(i,i);
end

f=detB;
g=1/trace(invB);
