% родители
parent(sasha, masha).
parent(olya, masha).
parent(olya, pasha).
parent(petya, kolya).
parent(dasha, kolya).
parent(kolya, sima).
parent(masha, sima).
parent(masha, son).
parent(son, liza).
% отношение дети - обратные родители
child(Y, X):-parent(X, Y).
% пол
male(sasha).
male(kolya).
male(pasha).
male(son).
male(petya).
male(sima).
female(dasha).
female(olya).
female(masha).
female(liza).
% отношение мать, отец
mother(X, Y):-parent(X, Y), female(X).
father(X, Y):-parent(X, Y), male(X).
% дочь
douther(X, Y):-child(X, Y), female(X).
% сестра
sister(X, Y):-parent(Z, X), parent(Z, Y), female(X), dif(X, Y).

% 4.11
son(X, Y):-child(X, Y), male(X).
son(X):-son(Y, X), write(Y).
% 5
brother(X, Y):-parent(Z, X), parent(Z, Y), male(X), dif(X, Y).
brothers(X):-parent(Z, X), parent(Z, Y), male(Y), dif(X, Y), write(Y).
% 6.11
husband(X, Y):-parent(X, Z), parent(Y, Z), male(X), female(Y).
husband(X):-parent(X, Z), parent(Y, Z), male(Y), female(X), write(Y).
% 7
b_s(X, Y):-parent(Z, X), parent(Z, Y).
b_s(X):-parent(Z, X), parent(Z, Y), write(Y).
% 8
grand_pa(X, Y):-parent(X, Z), parent(Z, Y), male(X).
grand_pa(X):-parent(X, Z), parent(Z, Y), male(X), write(Y).
% 9.11
grand_da(X, Y):-parent(Y, Z), parent(Z, X), female(X).
grand_dats(X):-parent(Y, Z), parent(Z, X), female(X), write(Y).
% 10
grand_pa_and_son(X, Y):-parent(Y, Z), parent(Z, X), male(X), male(Y); parent(X, Z), parent(Z, Y), male(X), male(Y).
% 11.11
grand_pa_and_da(X, Y):-parent(Y, Z), parent(Z, X), female(X), female(Y);parent(X, Z), parent(Z, Y), female(X), female(Y).
% 12
uncle(X, Y):-parent(Y, Z),brother(X, Z).
uncle(X):-parent(X, Z),brother(Y, Z), write(Y).
% 13.11
niece(X, Y):-parent(Z, X), parent(W, Z), parent(W, Y), female(X).
niece(X):-parent(Z, Y), parent(W, Z), parent(W, X), female(Y), write(Y).