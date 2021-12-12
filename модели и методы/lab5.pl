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
color(светлый).
color(рыжий).
color(темный).
belokurov(Y):-color(Y), Y=темный.
chernov(Y):-color(Y), not(Y=темный).
ryzhov(Y):-color(Y), not(Y=рыжий).
hair:-belokurov(X),chernov(Y),ryzhov(Z),
        not(X=Y), not(X=Z), not(Y=Z),
        write("У Белокурова цвет волос "),write(X),nl,
        write("У Чернова цвет волос "),write(Y),nl,
        write("У Рыжова цвет волос "),write(Z).

%3
dress_color(синий).
dress_color(зеленый).
dress_color(белый).
shoes_color(синий).
shoes_color(зеленый).
shoes_color(белый).
anya(X, Y):-dress_color(X), shoes_color(Y), X=Y.
valya(X, Y):-dress_color(X), shoes_color(Y), not(X=белый), not(Y=белый).
natasha(X, Y):-dress_color(X), shoes_color(Y), Y=зеленый.
ladys:-anya(A, B), valya(C, D), natasha(E, F),
    not(A=C), not(A=E), not(C=E), not(B=D), not(B=F), not(D=F),
    write("У Ани цвет платья "), write(A), write(", цвет туфель "), write(B),nl,
    write("У Вали цвет платья "), write(C), write(", цвет туфель "), write(D),nl,
    write("У Наташи цвет платья "), write(E), write(", цвет туфель "), write(F),nl.

%4
surname(борисов).
surname(иванов).
surname(семенов).
older(X):-surname(X),X=семенов.
sister(Y):-surname(Y),Y=борисов.
zavod:-surname(X),surname(Y), surname(Z), not(Y = X), not(Z = Y), not(Z = X),
    not(sister(X)),not(older(X)),write("Слесарь - "),write(X),nl,
	not(older(Y)), write("Токарь - "),write(Y),nl,
    write("Cварщик - "),write(Z).

%5
vessel(бутылка).
vessel(стакан).
vessel(кувшин).
vessel(банка).
liquid(молоко).
liquid(лимонад).
liquid(квас).
liquid(вода).
bottle(Y):-liquid(Y),not(Y=вода),not(Y=молоко).
glass(Y):-liquid(Y),not(Y=молоко).
jar(Y):-liquid(Y),not(Y=лимонад),not(Y=квас).
can(Y):-liquid(Y),not(Y=вода),not(Y=лимонад),not(Y=молоко).
liquids:-bottle(Y1),glass(Y2),jar(Y3),can(Y4),
	not(Y1=Y2),not(Y1=Y3),not(Y1=Y4),not(Y2=Y3),not(Y2=Y4),not(Y3=Y4),
	write("В бутылке - "),write(Y1),write(";"),nl,
    write("В стакане - "),write(Y2),write(";"),nl,
	write("В кувшине - "),write(Y3),write(";"),nl,
    write("В банке - "),write(Y4),write(";").

%6
talant(танцор).
talant(художник).
talant(певец).
talant(писатель).
voronov(X):-talant(X), not(X=певец), not(X=писатель).
levitsky(X):-talant(X), not(X=певец).
pavlov(X):-talant(X), not(X=писатель), not(X=художник).
sacharov(X):-talant(X), not(X=писатель).
not_meet(X, Y):-voronov(X), levitsky(Y).
talant:-voronov(V), levitsky(L), pavlov(P), sacharov(S),
    not(V=L), not(V=P),not(V=S),not(L=P),not(L=S),not(P=S),
    not_meet(V, L),
    write("Воронов - "),write(V),nl,
    write("Павлов - "),write(P),nl,
	write("Левицкий - "),write(L),nl,
    write("Сахаров - "),write(S).

%7
name(майкл).
name(саймон).
name(ричард).
sport(баскетбол).
sport(теннис).
sport(крикет).
nation(американец).
nation(израильтянин).
nation(австралиец).
mesto(1).
mesto(2).
mesto(3).
sport:-M=[friends(X,XN,XS,XM),friends(Y,YN,YS,YM),friends(Z,ZN,ZS,ZM)],
	name(X),name(Y),name(Z),not(X=Y),not(X=Z),not(Z=Y),
	sport(XS),sport(YS),sport(ZS),not(XS=YS),not(XS=ZS),not(ZS=YS),
	nation(XN),nation(YN),nation(ZN),not(XN=YN),not(XN=ZN),not(ZN=YN),
	mesto(XM),mesto(YM),mesto(ZM),not(XM=YM),not(XM=ZM),not(ZM=YM),
    member(friends(майкл, _, баскетбол, MM), M),
    member(friends(_, американец, _, AM), M),
        MM < AM,
	member(friends(саймон, израильтянин, _, SM), M),
    member(friends(_, _, теннис, TM), M), 
        SM < TM,
    member(friends(_, _, крикет, 1), M),
    write(M).

%8.11
name1(петр).
name1(вова).
name1(рома).
name1(андрей).
check2(X, Y):-name1(X), X=петр, name1(Y), not(Y=петр), not(Y=андрей).
check2(X, Y):-name1(X), X=вова, name1(Y), Y=петр.
check2(X, Y):-name1(X), X=рома, check2(петр, A), check2(вова, B), name1(A), name1(B), name(Y),not(Y=A), not(Y=B).
check2(X, Y):-name1(X), X=андрей, check2(вова, Y).
flowers:-name1(X1),name1(X2),name1(X3),name1(X4),
    not(X1=X2), not(X1=X3),not(X1=X4),not(X2=X3),not(X2=X4),not(X3=X4),
    check2(X1, Y), check2(X2, Y), check2(X3, Y3), check2(X4, Y4), not(Y=Y3), not(Y=Y4),
    write("Цветы подарил "),write(Y),nl,
    write("Говорят правду "), write(X1),write(", "), write(X2),nl,
    write("Лгут "), write(X3),write(", "), write(X4).
