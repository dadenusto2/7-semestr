min(X,Y,Z):-X<Y -> Z is X;Z is Y.
max(X,Y,Z):-X>Y -> Z is X;Z is Y.
if(A,B,C):-A,B;\+A,C.
abs(X, P):-(X<0 -> P is -X; P is X).
loc_max2(A, B, C, X):-(B>A -> (B>C -> (X is 1);(X is 0));(X is 0)).
% 1
list_read(X):-write("Count of elments:"),nl,read(N)
        ,nl, write("Input element:"),nl,list_read(N,X1),append(X1,[],X),write(X),write('\n').
list_read(0,[]):-!.
list_read(N,X):-N1 is N-1,list_read(N1,X1),read(E),append(X1,[E],X).

% 2
sum_list_down([],0).
sum_list_down([H|T],S):-sum_list_down(T,S1),S is S1+H.

% 3
sum_list_up([],0).
sum_list_up(X,S):-last(X,K),delete(X,K,X1),sum_list_up(X1,S1),S is S1+K.

% 4
list_el_numb(X,E,N):-nth0(N,X,E).
list_el_numb1:-list_read(X),nl,nl,write("������� ������� ��� ��������")
            ,read(E),list_el_numb(X,E,N)
            ,write(N);write("��� ������ ������").


% 5
list_el_numb2:-list_read(X),nl,nl,write("������� ����� ��� ��������")
            ,read(N),list_el_numb(X,E,N)
            ,write(E);write("��� ������ ��������").

% 6
min_list_up([],10000).
min_list_up(X,S):-last(X,K),delete(X,K,X1),min_list_up(X1,S1),min(K,S1,S).

% 7
min_list_down([],10000).
min_list_down([H|T],S):-min_list_down(T,S1),min(H,S1,S).
max_list_down([],-100000).
max_list_down([H|T],S):-max_list_down(T,S1),max(H,S1,S).

% 8
min_list:-list_read(X),min_list_down(X,S),nl,write(S).

% 9
mem:-list_read(X),nl,nl,write("������� ������� ��� ��������")
            ,read(E),member(E,X).

% 10
rev:-list_read(X),reverse(X,L),write(L).

% 11
p(Sub,X):-subset(Sub,X).

% 12
del(L, I, L):-L = [], !; I < 0, !.
del([_H|T], 0, T):-!.
del([H|T], I, [H|TW]):-N is I - 1,del(T, N, TW).

% 13
del_all:-list_read(X),nl,nl,write("������� ������� ��� ��������")
            ,read(E),del_all(X,E,L),write(L).

del_all(X,E,L):-if(member(E,X),(delete(X,E,X1),del_all(X1,E,L)), append(X,[],L)).

% 14
set_is(X):-is_set(X).

% 15
l_s(X):-list_to_set(X,L),nl,write(L).

% 16
count(X,E):-count(X,E,N),nl,write(N).
count([],_,0).
count([H|T],E,N):-H =:= E,count(T,E,N1),N is N1+1; H=\=E,count(T,E,N1),N is N1.

% 17
len(X,N):-length(X,N).


% Вариант11. Задачи 11, 12, 21, 23, 32, 35, 41, 47, 59
% 18.11
get_uniqe:-list_read([H|T]),get_uniqe([H|T]).
get_uniqe([H|T]):-count([H|T], H, N), (N=1->write('\nUniq:'), write(H); get_uniqe(T)).

%18.12
rev_b_min_max:-list_read(X),
               min_list_up(X, MIN),
               max_list_down(X, MAX),
               list_el_numb(X, MIN, NMIN),
               list_el_numb(X, MAX, NMAX),
               list_cutF(X, NMIN, 0, [T|XX]),
               NMIN<NMAX ->
               reverse([T|XX], X2),
               length(X, L),
               NMAX1 is L - NMAX,
               NAMX2 is NMAX1 - 1,
               list_cutF(X2, NAMX2, 0, Z),
               reverse(Z, Z1),
               write('Answer:'),
               write(Z1).

list_cutF([H|T], F, I, [HW|TW]):-
                           (I=F-> 
                                write([H|T]),
                                append([H|T],[], [HW|TW])
                           ;
                                I1 is I+1,
                                list_cutF(T, F, I1, [HW|TW])
                           ).

%18.21
after_max:-list_read(X),
           max_list_down(X, MAX),
           list_el_numb(X, MAX, NMAX),
           I is NMAX+1,
           nth0(I, X, E),
           write('Answer:'),
           write(E).

%18.23
two_min:-list_read(X),
        min_list(X, MIN1),
        delete(X, MIN1, X1),
        min_list(X1, MIN2),   
        write('\nmin1: '),
        write(MIN1),
        write('\n, min2:'),
        write(MIN2).

%18.32
loc_max:-
        list_read(X),
        nth0(0, X, E1), 
        nth0(1, X, E2), 
        (E1>E2->C1 is 1;C1 is 0),
        % write(C1),
        % write('\n'),
        length(X, L),
        L1 is L-1,
        L2 is L-2,
        nth0(L1, X, E3),
        nth0(L2, X, E4),
        (E3>E4->C2 is C1+1;C2 is C1),
        % write(C2),
        write('\nAnswer:'),
        loc_max1(X, 1, L1, C2, Z),
        write(Z).

loc_max1([H|T], I, L, C, X):-
        (I<L ->
        (I1 is I+1,
        I0 is I-1,
        nth0(I0, [H|T], E0),
        nth0(I, [H|T], E),
        nth0(I1, [H|T], E2),
        loc_max2(E0, E, E2, C1),
        C2 is C + C1,
        loc_max1([H|T], I1, L, C2, X));
        X is C
        ).

%18.35
close_elem:-
        write('N:'),
        read(N),
        list_read(X),
        (member(N, X)->write('\nAnswer:'),write(N);search_close(X, N, 1)).

search_close(X, N, I):-
        N0 is N - I,
        N1 is N + I,
        (member(N0, X) , member(N1, X) ->
        (
                (member(N0, X) -> write('\nAnswer:'),write(N0)),
                (member(N1, X) -> write('\nAnswer:'),write(N1))
        );
        I1 is I+1, search_close(X, N, I1)).

%18.41
sum_abs:-list_read(X),
        sum_list_abs(X,S),
        write('\nAnswer:'),
        write(S).

sum_list_abs([],0).
sum_list_abs([H|T],S):-sum_list_abs(T,S1),abs(H, A),S is S1+A.