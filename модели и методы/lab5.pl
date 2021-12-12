in_list([_|T],El):-in_list(T,El).
sprava_next(_,_,[_]):-fail.
sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).
sleva_next(_,_,[_]):-fail.
sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).
next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).
el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).
%1
houses:- Houses=[_,_,_,_,_],
		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),
		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),nl,
		write(WHO1),nl,
                write(WHO2),!.

%2
color(�������).
color(�����).
color(������).
belokurov(Y):-color(Y), Y=������.
chernov(Y):-color(Y), not(Y=������).
ryzhov(Y):-color(Y), not(Y=�����).
hair:-belokurov(X),chernov(Y),ryzhov(Z),
        not(X=Y), not(X=Z), not(Y=Z),
        write("� ���������� ���� ����� "),write(X),nl,
        write("� ������� ���� ����� "),write(Y),nl,
        write("� ������ ���� ����� "),write(Z).

%3
dress_color(�����).
dress_color(�������).
dress_color(�����).
shoes_color(�����).
shoes_color(�������).
shoes_color(�����).
anya(X, Y):-dress_color(X), shoes_color(Y), X=Y.
valya(X, Y):-dress_color(X), shoes_color(Y), not(X=�����), not(Y=�����).
natasha(X, Y):-dress_color(X), shoes_color(Y), Y=�������.
ladys:-anya(A, B), valya(C, D), natasha(E, F),
    not(A=C), not(A=E), not(C=E), not(B=D), not(B=F), not(D=F),
    write("� ��� ���� ������ "), write(A), write(", ���� ������ "), write(B),nl,
    write("� ���� ���� ������ "), write(C), write(", ���� ������ "), write(D),nl,
    write("� ������ ���� ������ "), write(E), write(", ���� ������ "), write(F),nl.

%4
surname(�������).
surname(������).
surname(�������).
older(X):-surname(X),X=�������.
sister(Y):-surname(Y),Y=�������.
zavod:-surname(X),surname(Y), surname(Z), not(Y = X), not(Z = Y), not(Z = X),
    not(sister(X)),not(older(X)),write("������� - "),write(X),nl,
	not(older(Y)), write("������ - "),write(Y),nl,
    write("C������ - "),write(Z).

%5
vessel(�������).
vessel(������).
vessel(������).
vessel(�����).
liquid(������).
liquid(�������).
liquid(����).
liquid(����).
bottle(Y):-liquid(Y),not(Y=����),not(Y=������).
glass(Y):-liquid(Y),not(Y=������).
jar(Y):-liquid(Y),not(Y=�������),not(Y=����).
can(Y):-liquid(Y),not(Y=����),not(Y=�������),not(Y=������).
liquids:-bottle(Y1),glass(Y2),jar(Y3),can(Y4),
	not(Y1=Y2),not(Y1=Y3),not(Y1=Y4),not(Y2=Y3),not(Y2=Y4),not(Y3=Y4),
	write("� ������� - "),write(Y1),write(";"),nl,
    write("� ������� - "),write(Y2),write(";"),nl,
	write("� ������� - "),write(Y3),write(";"),nl,
    write("� ����� - "),write(Y4),write(";").

%6
talant(������).
talant(��������).
talant(�����).
talant(��������).
voronov(X):-talant(X), not(X=�����), not(X=��������).
levitsky(X):-talant(X), not(X=�����).
pavlov(X):-talant(X), not(X=��������), not(X=��������).
sacharov(X):-talant(X), not(X=��������).
not_meet(X, Y):-voronov(X), levitsky(Y).
talant:-voronov(V), levitsky(L), pavlov(P), sacharov(S),
    not(V=L), not(V=P),not(V=S),not(L=P),not(L=S),not(P=S),
    not_meet(V, L),
    write("������� - "),write(V),nl,
    write("������ - "),write(P),nl,
	write("�������� - "),write(L),nl,
    write("������� - "),write(S).

%7
name(�����).
name(������).
name(������).
sport(���������).
sport(������).
sport(������).
nation(����������).
nation(������������).
nation(����������).
mesto(1).
mesto(2).
mesto(3).
sport:-M=[friends(X,XN,XS,XM),friends(Y,YN,YS,YM),friends(Z,ZN,ZS,ZM)],
	name(X),name(Y),name(Z),not(X=Y),not(X=Z),not(Z=Y),
	sport(XS),sport(YS),sport(ZS),not(XS=YS),not(XS=ZS),not(ZS=YS),
	nation(XN),nation(YN),nation(ZN),not(XN=YN),not(XN=ZN),not(ZN=YN),
	mesto(XM),mesto(YM),mesto(ZM),not(XM=YM),not(XM=ZM),not(ZM=YM),
    member(friends(�����, _, ���������, MM), M),
    member(friends(_, ����������, _, AM), M),
        MM < AM,
	member(friends(������, ������������, _, SM), M),
    member(friends(_, _, ������, TM), M), 
        SM < TM,
    member(friends(_, _, ������, 1), M),
    write(M).

%8.11
name1(����).
name1(����).
name1(����).
name1(������).
check2(X, Y):-name1(X), X=����, name1(Y), not(Y=����), not(Y=������).
check2(X, Y):-name1(X), X=����, name1(Y), Y=����.
check2(X, Y):-name1(X), X=����, check2(����, A), check2(����, B), name1(A), name1(B), name(Y),not(Y=A), not(Y=B).
check2(X, Y):-name1(X), X=������, check2(����, Y).
flowers:-name1(X1),name1(X2),name1(X3),name1(X4),
    not(X1=X2), not(X1=X3),not(X1=X4),not(X2=X3),not(X2=X4),not(X3=X4),
    check2(X1, Y), check2(X2, Y), check2(X3, Y3), check2(X4, Y4), not(Y=Y3), not(Y=Y4),
    write("����� ������� "),write(Y),nl,
    write("������� ������ "), write(X1),write(", "), write(X2),nl,
    write("���� "), write(X3),write(", "), write(X4).
