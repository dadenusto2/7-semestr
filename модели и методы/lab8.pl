% размещение по к c повторений
eval([],_).
eval([H|T],Set):-member(H,Set),eval(T,Set).
permutation_with(Set, N, L):-length(L,N), eval(L,Set).

% перестановки
permutation(List, Permutation):-
  length(List, Length), 
  permutation(List, Length, Permutation).

% размещение по к без повторений
permutation(_List, 0, []):-!.
permutation(List, PermutationLength, [Head|PermutationTail]):-
    select(Head, List, ListTail), 
    PermutationTailLength is PermutationLength - 1,
    permutation(ListTail, PermutationTailLength, PermutationTail).

% подмножества
subset([], []).
subset([E|Tail], [E|NTail]):-
  subset(Tail, NTail).
subset([_|Tail], NTail):-
  subset(Tail, NTail).

% сочетание по к без повторений
comb(_, 0, []).
comb([X|T], N, [X|Comb]) :- N > 0, N1 is N-1, comb(T, N1, Comb).
comb([_|T], N, Comb) :- N > 0, comb(T, N, Comb).

% сочетание по к с повторений
comb(_, 0, []).
comb([X|T], N, [X|Comb]) :- N > 0, N1 is N-1, comb(T, N1, Comb).
comb([_|T], N, Comb) :- N > 0, comb(T, N, Comb).

% 2
later(a).
count([],_,0).
count([H|T],E,N):-H = E,count(T,E,N1),N is N1+1; not(H=E),count(T,E,N1),N is N1.
ex2:-append([], [a,b,c,d,e,f], Set),length(L,5), eval(L,Set), 
later(A), count(L, A, NA), (NA=2-> write(L)).

% 3
laterb(b).
laterc(c).
laterd(d).
latere(e).
laterf(f).
ex3:-append([], [a,b,c,d,e,f], Set),length(L,5), eval(L,Set),
    later(X1), count(L, X1, N1),
    laterb(X2), count(L, X2, N2),
    laterc(X3), count(L, X3, N3),
    laterd(X4), count(L, X4, N4),
    latere(X5), count(L, X5, N5),
    laterf(X6), count(L, X6, N6),
    (N1=2-> (N2<2-> (N3<2-> (N4<2-> (N5<2-> (N6<2->write(L))))))).

% 4
ex4:-append([], [a,b,c,d,e,f], Set),length(L,5), eval(L,Set),
    list_to_set(L,S),
    length(S, N),
    (N=4->write(L)).

% 5
ex5([], _, _,B):-B1 is 1, B is B1.
ex5([H|T], L, K, B):-
    count(L, H, N),
    (N<3->F1 is 1;F1 is 0),
    (N=2-> (not(K=2) ->F is 1;F is 0);F is F1),
    (F=1->K1 is K+1, ex5(T, L, K1, B1);B1 is 0),
    B is B1.
ex5:-append([], [a,b,c,d,e,f], Set),length(L,6), eval(L,Set),
    list_to_set(L,S),
    ex5(S, L, 0, B),
    (B=1->write(L)).

% 6
ex6([], _, K2,K3,B):-(K2=1->(K3=1->B1 is 1;B1 is 0);B1 is 0), B is B1.
ex6([H|T], L, K2, K3, B):-
    count(L, H, N),
    (N=1 -> F1 is 1;F1 is 0),
    (N=2 -> (K2=0 -> NK2 is K2+1, F2 is 1;F2 is 0);NK2 is K2, F2 is F1),
    (N=3 -> (K3=0 -> NK3 is K3+1, F3 is 1;F3 is 0);NK3 is K3,F3 is F2),
    (F3=1->ex6(T, L, NK2, NK3,B1);B1 is 0),
    B is B1.
ex6:-append([], [a,b,c,d,e,f], Set),length(L,7), eval(L,Set),
    list_to_set(L,S),
    ex6(S, L, 0, 0,B),
    (B=1->write(L)).

% 7
ex7([], _, K2,K3,B):-(K2=2->(K3=1->B1 is 1;B1 is 0);B1 is 0), B is B1.
ex7([H|T], L, K2, K3, B):-
    count(L, H, N),
    (N=1 -> F1 is 1;F1 is 0),
    (N=2 -> (K2<3 -> NK2 is K2+1, F2 is 1;F2 is 0);NK2 is K2, F2 is F1),
    (N=3 -> (K3=0 -> NK3 is K3+1, F3 is 1;F3 is 0);NK3 is K3, F3 is F2),
    (F3=1->ex7(T, L, NK2, NK3,B1);B1 is 0),
    B is B1.
ex7:-append([], [a,b,c,d,e,f], Set),length(L,9), eval(L,Set),
    list_to_set(L,S),
    ex7(S, L, 0, 0,B),
    (B=1->write(L)).

% 8
ex8:-append([], [a,b,c,d,e,f], Set),length(L,4), eval(L,Set), 
  later(A), count(L, A, NA), (NA>2-> write(L)).

% 9
ex9:-append([], [a,b,c,d,e,f], Set),length(L,7), eval(L,Set), 
  later(A), count(L, A, NA), (NA>2-> write(L)).

% 10
ex10:-append([], [a,b,c,d,e,f], Set),length(L,7), eval(L,Set), 
  list_to_set(L,S), length(S, NA),(NA=4-> write(L)).

% 11
ex11:-append([], [a,b,c,d,e,f], Set),K is 0,length(L,8), eval(L,Set), 
  list_to_set(L,S), length(S, NA),(NA=3-> write(L)).

%12
ex12:-append([], [a,b,c,d,e,f], Set), eval(L,Set),
    write("N:"),nl,read(N),
    write("K:"),nl,read(K),
    write("M:"),nl,read(M),
    later(A), count(L, A, NA),
    laterb(B), count(L, B, NB),
    laterc(C), count(L, C, NC),
    NBC is NB+NC,
    laterd(D), count(L, D, ND),
    NA=K->NBC=K->ND=M->write(L).

