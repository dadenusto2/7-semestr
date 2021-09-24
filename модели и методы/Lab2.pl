% пол
male(eren, 1).
male(armin, 1).
male(gan, 1).
male(levi, 1).
male(koni, 1).
male(arvin, 1).
male(zik, 1).
male(hannes, 1).
male(rainer, 1).
male(bertold, 1).
male(porko, 1).
male(micasa, 0).
male(sasha, 0).
male(handji, 0).
male(anni, 0).
male(pik, 0).
male(gabi, 0).
male(historia, 0).
male(lara, 0).
male(imir, 0).
male(elena, 0).
% разведкорпус
reconnaissance_corps(eren, 1).
reconnaissance_corps(armin, 1).
reconnaissance_corps(gan, 1).
reconnaissance_corps(levi, 1).
reconnaissance_corps(koni, 1).
reconnaissance_corps(arvin, 1).
reconnaissance_corps(micasa, 1).
reconnaissance_corps(handji, 1).
reconnaissance_corps(historia, 1).
reconnaissance_corps(sasha, 1).
reconnaissance_corps(rainer, 0).
reconnaissance_corps(bertold, 0).
reconnaissance_corps(porko, 0).
reconnaissance_corps(anni, 0).
reconnaissance_corps(pik, 0).
reconnaissance_corps(gabi, 0).
reconnaissance_corps(lara, 0).
reconnaissance_corps(imir, 0).
reconnaissance_corps(hannes, 0).
reconnaissance_corps(zik, 0).
reconnaissance_corps(elena, 0).
%жив?
alive(eren, 1).
alive(armin, 1).
alive(gan, 1).
alive(levi, 1).
alive(koni, 1).
alive(arvin, 0).
alive(micasa, 1).
alive(handji, 1).
alive(historia, 1).
alive(sasha, 0).
alive(rainer, 1).
alive(bertold, 0).
alive(anni, 1).
alive(pik, 1).
alive(gabi, 1).
alive(lara, 0).
alive(imir, 0).
alive(hannes, 0).
alive(zik, 1).
alive(elena, 1).
alive(porko, 1).
% с острова?
eldian(eren, 1).
eldian(armin, 1).
eldian(gan, 1).
eldian(levi, 1).
eldian(koni, 1).
eldian(arvin, 1).
eldian(micasa, 1).
eldian(handji, 1).
eldian(historia, 1).
eldian(sasha, 1).
eldian(rainer, 0).
eldian(bertold, 0).
eldian(anni, 0).
eldian(pik, 0).
eldian(gabi, 0).
eldian(lara, 0).
eldian(imir, 0).
eldian(hannes, 1).
eldian(zik, 0).
eldian(elena, 0).
eldian(porko, 0).
% титан?
titan(eren, 1).
titan(armin, 1).
titan(gan, 0).
titan(levi, 0).
titan(koni, 0).
titan(arvin, 0).
titan(micasa, 0).
titan(handji, 0).
titan(historia, 0).
titan(sasha, 0).
titan(rainer, 1).
titan(bertold, 1).
titan(anni, 1).
titan(pik, 1).
titan(gabi, 0).
titan(lara, 1).
titan(imir, 0).
titan(hannes, 0).
titan(zik, 1).
titan(elena, 0).
titan(porko, 1).
% темные волосы?
dark_hair(eren, 1).
dark_hair(armin, 0).
dark_hair(gan, 1).
dark_hair(levi, 1).
dark_hair(koni, 0).
dark_hair(arvin, 0).
dark_hair(micasa, 1).
dark_hair(handji, 1).
dark_hair(historia, 0).
dark_hair(sasha, 1).
dark_hair(rainer, 0).
dark_hair(bertold, 1).
dark_hair(anni, 0).
dark_hair(pik, 1).
dark_hair(gabi, 1).
dark_hair(lara, 1).
dark_hair(imir, 1).
dark_hair(hannes, 0).
dark_hair(zik, 0).
dark_hair(elena, 0).
dark_hair(porko, 0).
% участвовал ли в битве за сигансину
sigansina(eren, 1).
sigansina(armin, 1).
sigansina(gan, 1).
sigansina(levi, 1).
sigansina(koni, 1).
sigansina(arvin, 1).
sigansina(micasa, 1).
sigansina(handji, 1).
sigansina(historia, 0).
sigansina(sasha, 1).
sigansina(rainer, 1).
sigansina(bertold, 1).
sigansina(anni, 0).
sigansina(pik, 0).
sigansina(gabi, 0).
sigansina(lara, 0).
sigansina(imir, 0).
sigansina(hannes, 0).
sigansina(zik, 1).
sigansina(elena, 0).
sigansina(porko, 0).
% один из трех главных героев?
main(eren, 1).
main(armin, 1).
main(gan, 0).
main(levi, 0).
main(koni, 0).
main(arvin, 0).
main(micasa, 1).
main(handji, 0).
main(historia, 0).
main(sasha, 0).
main(rainer, 0).
main(bertold, 0).
main(anni, 0).
main(pik, 0).
main(gabi, 0).
main(lara, 0).
main(imir, 0).
main(hannes, 0).
main(zik, 0).
main(elena, 0).
main(porko, 0).

question1(X1):-	write("Какой пол персонажа!"),nl,
				write("1. мужской"),nl,
				write("0. женский"),nl,
				read(X1).

question2(X2):-	write("Ваш персонаж участник разведкорпуса?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X2).

question3(X3):-	write("Жив ли Ваш персонаж?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X3).

question4(X4):-	write("Ваш персонаж воюет за эльдийцев?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X4).

question5(X5):-	write("Ваш персонаж титан?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X5).

question6(X6):-	write("У Вашего персонажа темные волосы?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X6).

question7(X7):-	write("Участвовал ли Ваш персонаж в битве за сигансину?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X7).

question8(X8):-	write("Это один из трех главных персонажей"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X8).



pr:-	question1(X1),question2(X2),question3(X3),question4(X4),
		question5(X5),question6(X6),question7(X7),question7(X8),
		male(X,X1),reconnaissance_corps(X,X2),alive(X,X3),eldian(X,X4),
		titan(X,X5),dark_hair(X,X6),sigansina(X,X7),main(X,X8),
		write(X).