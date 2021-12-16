vertex(1). 
vertex(2). 
vertex(3). 
vertex(4). 
vertex(5). 
vertex(6).
vertex(7).

edge(1,2).
edge(1,5).
edge(5,2).
edge(2,3).
edge(4,5).
edge(4,6).
edge(4,3).
edge(1,7).

count([],_,0).
count([H|T],E,N):- H=E,count(T,E,N1),N is N1+1; not(H=E),count(T,E,N1),N is N1.

del_all(X,E,L):-(member(E,X)->(delete(X,E,X1),del_all(X1,E,L)); append(X,[],L)).
del_all1(X,E,L):-(member(e(E, _),X)->(delete(X,e(E, _),X1),del_all(X1,e(E, _),L));append(X,[],L)).
del_all2(X,E,L):-(member(e(_, E),X)->(delete(X,e(_, E),X1),del_all(X1,e(_, E),L));append(X,[],L)).

vertexList(List):- 
    findall(X, vertex(X), List).

edgesList(List):- 
    findall(e(X, Y), (edge(X, Y)), List).

 %4
secondVertexCount(_, _, [], 0).
secondVertexCount(EL, V, [H|T], N):- ((member(e(V, H), EL) ; member(e(H, V), EL))-> secondVertexCount(EL, V, T, N1), N is N1+1;secondVertexCount(EL, V, T, N1), N is N1).

vertexInEdgesCount([], _, _, CL, CL1):-append(CL, [], CL1).
vertexInEdgesCount([H|T], EL, VL, CL, CL1):-
    secondVertexCount(EL, H, VL, N),
    append(CL, [N], NewCL),
    vertexInEdgesCount(T, EL, VL, NewCL, CL2),
    append(CL2, [], CL1).

ex4:-vertexList(VL), edgesList(EL), ex4(VL, EL, [], Y), write(Y).
ex4(_, [], X, Y):-append(X, [], Y).
ex4(VL, EL, X, Y):-
    vertexInEdgesCount(VL, EL, VL, [], CL1),
    max_list(CL1, MAX),
    nth0(NMAX,CL1,MAX),
    nth0(NMAX,VL,NMAX1),
    del_all(VL, NMAX1, NewVL),
    del_all1(EL,NMAX1, NewEL),
    del_all2(NewEL, NMAX1, NewEL2),
    append(X, [NMAX1], X1),
    ex4(NewVL, NewEL2, X1, X2),
    append(X2, [], Y).

%5
finish(6).

replace(I, L, E, K) :-
  nth0(I, L, _, R),
  nth0(I, K, E, R).

emptyList(K, N, L):-(K<N->(K1 is K+1, emptyList(K1, N, L1),append([-1], L1, L)); append([], [], L)).

emptyListAdd([], _, _, _,CV, FCV):-append(CV, [], FCV).
emptyListAdd([H|T], VC, VL, K, CV, FCV):-
    nth0(IND,VL,H), 
    nth0(IND,VC,V),
    (not(V>0)->replace(IND, VC, K, NVC),(emptyListAdd(T, NVC, VL, K, NVC, FCV));
    (append([], VC, NVC), emptyListAdd(T, VC, VL, K, VC, FCV))).

ex5:-vertexList(VL), edgesList(EL),
    length(VL, N), 
    emptyList(0, N, VO),
    append([1], [], STR),
    append(STR, [], VC),
    emptyListAdd(STR, VO, VL, 0, CV, FCV),
    finish(FIN),
    ex5(EL, STR, STR, FIN, VL, VC, FCV, FL, 0),
    list_to_set(FL, FS).

way(STR, FIN, VL, VC, EL, W).

ex5(EL, [H|T], STR, FIN, VL, VC, VO, FL, K):-
    vertexInEdges(EL, [H|T], VL, VC, VL, FL),
    K1 is K+1,
    write("Порядок "),write(K1),write(FL),nl,
    emptyListAdd(FL, VO, VL, K1, CV, FCV),
    append(VC, FL, NFCV),
    write(FCV),nl,
    (not(member(FIN, FL))->ex5(EL, FL, STR,FIN, VL, NFCV, FCV, NFL, K1)).

vertexInEdges(_, [], _, _, _, []).
vertexInEdges(EL, [H|T], VL, VC, VL, FL):-
    vertexChild(EL, H, VL, VC, VL, L),
    append(L, [], NL),
    vertexInEdges(EL, T, VL, VC, VL, NL2),
    append(NL, NL2, FL).

vertexChild(_, _, [], _, _, L):-append([], [], L).
vertexChild(EL, V, [H|T], VC, VL, L):- ( ((member(e(V, H), EL) ; member(e(H, V), EL)), not(member(H, VC))) -> (vertexChild(EL, V, T, VC, VL, L1), append([H], L1, L));(vertexChild(EL, V, T, VC, VL, L1), append([], L1, L))).

