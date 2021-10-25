if(A,B,C):-A,B;\+A,C.
% 1
max(X, Y, Z):- (X<Y -> Z = Y; Z = X), write(Z).

% 3
fact1(N,X):-fact1(1,N,X1),X is X1.
fact1(N1,N,X):-if(N1<N,(fact1(N1+1,N,X1),X is X1*N1),X is N1).

% 4
fact2(N,X):-N1 is N-1,fact2(N1,X1),X is X1*N.