vertex(1). 
vertex(2). 
vertex(3). 
vertex(4). 
vertex(5). 
vertex(6). 

edge(1,2).
edge(1,5).
edge(1,6).
edge(2,3).
edge(3,4).
edge(4,5).
edge(6,5).



transfer([],_,[]).
transfer(Ns,GEs,[GE|TEs]) :- 
   select(GE,GEs,GEs1),        
   incident(GE,X,Y),
   acceptable(X,Y,Ns),
   delete(Ns,X,Ns1),
   delete(Ns1,Y,Ns2),
   transfer(Ns2,GEs1,TEs).

incident(e(X,Y),X,Y).
incident(e(X,Y,_),X,Y).

acceptable(X,Y,Ns) :- memberchk(X,Ns), \+ memberchk(Y,Ns), !.
acceptable(X,Y,Ns) :- memberchk(Y,Ns), \+ memberchk(X,Ns).

is_connected(G) :- 
	s_tree(G,_), !.

s_tree(graph([N|Ns],GraphEdges),graph([N|Ns],TreeEdges)) :- 
   transfer(Ns,GraphEdges,TreeEdgesUnsorted),
   sort(TreeEdgesUnsorted,TreeEdges).
   
vertexList(List) :- 
    findall(X, vertex(X), List).
	
edgesList(List) :- 
    findall(e(X, Y), (edge(X, Y)), List). 
	
ex2():-
	vertexList(X),
	edgesList(Y),
	is_connected(graph(X,Y)).
%Эйлер
edgesList1(List) :- 
    findall([X,Y], (edge(X, Y)), A),
	flatten(A,List).

ifEyler(Graf,Way):- Graf=[Start|_], cycle(Start,Start,Graf,Way), !.

cycle(A,A,[],[A]):- !.
cycle(A,F,Gr,[A|B]):- rp(A,C,Gr,GrN), cycle(C,F,GrN,B).

rp(A,B,[A,B|C],C).
rp(A,B,[B,A|C],C).
rp(A,B,[C,X|D],[C,X|F]):- rp(A,B,D,F).

ex3():-
	edgesList1(Y),
	ifEyler(Y,X),
	write(X).

%устойчивость

noEdge(X, F):-
	findall(Y,edge(X,Y), F1),
	findall(Y,edge(Y,X), F2),
	append(F1,F2,F).
	
chep([],M, M).
chep([H|T], L, M):-
	noEdge(H,F),
	length(F,M1),
	chep(T, L1, M1),
	L is min(L1, M1).

	
ex4():-
	vertexList(X),
	length(X, M),
	chep(X, L, M),
	A is M-L-1,
	write(A).
%база
remove13([],X,[]):-!.
remove13([X|TAIL],X,Y):-
	remove13(TAIL,X,Y),!.
remove13([HEAD|TAIL],X,[HEAD|TAIL1]):-
	remove13(TAIL,X,TAIL1),!.

connected(A,B) :- edge(A,B);edge(B,A).

travel(A,B,P,[B|P]) :- 
    connected(A,B).

travel(A,B,Visited,Path) :-
   connected(A,C),           
   C \== B,
   \+member(C,Visited),
   travel(C,B,[C|Visited],Path). 

path(A,B,Path):-
    travel(A,B,[A],Q), 
    reverse(Q,Path),!.

all_paths(_,[]).
all_paths(X,[H|T]):-
	path(X,H,_),
	all_paths(X, T).
	

base(X):-
	vertex(X),
	vertexList(Y),
	remove13(Y,X,T),
	all_paths(X,T).
	