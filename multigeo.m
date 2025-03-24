function [k]=multigeo(A,l,toll)
%Input:
%   A matrice quadrata reale o complessa di cui si vogliono calcolare le dimensioni dell’ autospazio;
%   l scalare complesso, è l’autovalore di cui si vuole calcolare la molteplicità algebrica;
%   toll scalare reale positivo utilizzato per verificare la condizione di nullità degli elementi diagonali della U
%Output:
%   k naturale positivo, dimensione dell’autospazio
%Tale function deve chiamare la fattorizzazione LU di matlab e calcolare quanti elementi diagonali di U 
% risultano essere in modulo sotto la soglia passata dall’utente
[L,U] = lu(A);
k=0;
i=1;
while i<=size(U,1)
    if abs(U(i,i)) <toll
        k=k+1;
    end
end