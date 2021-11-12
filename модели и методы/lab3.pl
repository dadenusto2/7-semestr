int_pow(_, 0, 1):-!.
int_pow(A, B, Pow):-
    B > 0, !, TailB is B - 1,
    int_pow(A, TailB, TailPow),
    Pow is TailPow * A.
int_pow(A, B, Pow):-
    B < 0, !, TailB is B - 1,
    int_pow(A, TailB, TailPow),
    Pow is TailPow / A.

abs(X, P):-(X<0 -> P is -X; P is X).
% 1
max2(X, Y, Z):- (X<Y -> Z = Y; Z = X), write(Z).

% 2
max3(X, Y, U, Z):- (X < Y ->
                        (U<Y ->
                            Z = Y; Z = U
                            );
                        (U<X ->
                            Z = X; Z = U
                            )), write(Z).

% 3
fact1(N,X):-fact1(1,N,X1),X is X1, write(X).
fact1(N1,N,X):-(N1<N -> fact1(N1+1,N,X1),X is X1*N1;X is N1).

% 4
fact2(N,X):-fact2(N,1,X1),X is X1, write(X).
fact2(N1,N,X):-(N1>N -> fact2(N1-1,N,X1),X is X1*N1;X is N1).

% 5
fib1(1,1).
fib1(2,1).
fib1(N,X):-fib1(3,N,1,1,X1),X is X1, write(X).
fib1(N1,N,S2,S1,X):-(N1<N -> S3 is S1+S2,N2 is N1+1,fib1(N2,N,S3,S2,X1),X is X1;X is S1+S2).

% 6
fib2(1,1).
fib2(N,X):-fib2(N,1,0,X1),X is X1, write(X).
fib2(N,S2,S1,X):-(2<N -> S3 is S1+S2,fib2(N-1,S3,S2,X1),X is X1;X is S1+S2).

% 7
sum1(N,X):-abs(N, N1),del1(N1,0,10,X1),X is X1, write(X).
del1(N,X1,N1,X):-N2 is (N1-1),(N>N2 -> M is (N mod N1), X2 is (X1 + M), D is (N div N1),del1(D,X2,N1,X); X is X1 + N).

% 8
sum2(N,X):-abs(N, N1),count(N1, 0, C),del2(N1,C,0,10,X1),X is X1, write(X).
count(N, X1, C):-N1 is 10, N2 is (N1-1),(N>N2 -> X2 is X1+1, D is (N div N1), count(D, X2, C);C is X1+1).
del2(N,C,X1,N1,X):-N2 is (N1-1),(N>N2 -> int_pow(10, C, P), D is (N div P), X2 is (X1 + D), M is (N mod P),C1 is C - 1, del2(M,C1,X2,N1,X); X is X1 + N).

% 9.11
maxN1(N,X):-abs(N, N1),del3(N1,0,10,X1),X is X1, write(X).
del3(N,X1,N1,X):-N2 is (N1-1),(N>N2 -> M is (N mod N1), (M > X1, X2 is M; X2 is X1), D is (N div N1),del3(D,X2,N1,X); (N > X1, X is N; X is X1)).

% 10.11
maxN2(N,X):-abs(N, N1),count(N1, 0, C),del4(N1,C,0,10,X1),X is X1, write(X).
del4(N,C,X1,N1,X):-N2 is (N1-1),(N>N2 -> int_pow(10, C, P),D is (N div P),(D > X1, X2 is D; X2 is X1), M is (N mod P),C1 is C - 1, del4(M,C1,X2,N1,X); (N > X1, X is N; X is X1)).

% 11.11
minOdd1(N,X):-abs(N, N1),delOdd1(N1,9,10,2,X1),X is X1, write(X).
delOdd1(N,X1,N1,N3,X):-
                    N2 is (N1-1),
                    (N>N2 -> 
                        M is N mod N1,
                        O is M mod N3,
                        (M < X1, M mod N3 > 0 ->
                            X2 is M;
                            X2 is X1),
                        D is (N div N1),
                        delOdd1(D,X2,N1,N3,X);
                        (N < X1, N mod N3 > 0 ->
                            X is N; X is X1)).

minOdd2(N,X):-abs(N, N1),count(N1, 0, C),delOdd2(N1,C,9,10,2,X1),X is X1, write(X).
delOdd2(N,C,X1,N1,N3,X):-
                    N2 is (N1-1),
                    (N>N2 -> 
                        int_pow(10, C, P),
                        D is (N div P),
                        (D < X1, D mod N3 > 0 ->
                            X2 is D;
                            X2 is X1),
                        M is (N mod P),
                        C1 is C - 1,
                        delOdd2(M,C1,X2,N1,N3,X);
                        (N < X1, N mod N3 > 0 ->
                            X is N; X is X1)).