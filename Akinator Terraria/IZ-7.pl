/*
	Внимание!
	Для удобства программа использует относительные пути! Для корректной работе запускайте
	Prolog из консоли в необходимой вам папке, в которой так же будет расположен файл IZ-7-Base!
	В нее же будет записана обновленная база.
*/

:- consult("IZ-7-Base").

updateClause(Q, _) :-
	Q = 3.

updateClause(Q, R) :-
	not(Q = 3),
	Q = R.

findEnemy(Q1, Q2, Q3, Q4, Q5, Q6, Q7, Enemy) :-
	hardmode(Enemy, Q1),
	boss(Enemy, Q2),
	rare(Enemy, Q3),
	callable(Enemy, Q4),
	timeSpan(Enemy, Q5),
	event(Enemy, Q6),
	classic(Enemy, Q7).

akinator :-
	write('Встерчается ли ваш враг только после убийства стены плоти?'), nl,
	write('1. Да'), nl,
	write('0. Нет'), nl,
	write('3. Не знаю'), nl,
	read(Q1),
	updateClause(Q1, Answer1),

	write('Ваш враг является боссом, мини-боссом или боссом события?'), nl,
	write('1. Да'), nl,
	write('0. Нет'), nl,
	write('3. Не знаю'), nl,
	read(Q2),
	updateClause(Q2, Answer2),

	write('Ваш враг является редким противником? [боссы - редкие!]'), nl,
	write('1. Да'), nl,
	write('0. Нет'), nl,
	write('3. Не знаю'), nl,
	read(Q3),
	updateClause(Q3, Answer3),

	write('Может ли игрок призвать данного противника какими-либо своими действиями, помимо использования соответствующей статуи?'), nl,
	write('1. Да'), nl,
	write('0. Нет'), nl,
	write('3. Не знаю'), nl,
	read(Q4),
	updateClause(Q4, Answer4),

	write('Имеет ли противник ограничения на появление во время какого-либо времени суток? Например, только ночью или только днем'), nl,
	write('1. Да'), nl,
	write('0. Нет'), nl,
	write('2. Частично'), nl,
	write('3. Не знаю'), nl,
	read(Q5),
	updateClause(Q5, Answer5),

	write('Имеется ли событие, как-либо связанное с вашим противником?'), nl,
	write('1. Да'), nl,
	write('0. Нет'), nl,
	write('3. Не знаю'), nl,
	read(Q6),
	updateClause(Q6, Answer6),

	write('Враг был в классическое террарии? То есть, до версии 1.1'), nl,
	write('1. Да'), nl,
	write('0. Нет'), nl,
	write('3. Не знаю'), nl,
	read(Q7),
	updateClause(Q7, Answer7),

	dynamic(result/1),
	forall(
		(
			findEnemy(Answer1, Answer2, Answer3, Answer4, Answer5, Answer6, Answer7, SomeEnemy)
		),

		(
			not(result(SomeEnemy)),
			assert(result(SomeEnemy)),
			write(SomeEnemy)
		)
	),

	forall(
		(
			result(X)
		),

		(
			write("Ваш враг очень похож на "), write(X), write("! Это он?"), nl,
			write("1. Да"), nl,
			write("2. Нет"), nl,
			read(IsIt),
			IsIt = 1,
			abolish(result/1),
			write("Угадал!"),
			fail
		)
	),

	write("Я не знаю, кто это! Кто ваш враг? "), read(MyEnemyIs),
	save('newBase.pl', Q1, Q2, Q3, Q4, Q5, Q6, Q7, MyEnemyIs),
	abolish(result/1).

save(Path, Q1, Q2, Q3, Q4, Q5, Q6, Q7, MyEnemyIs) :-
	(
		not(Q1 = 3),
		not(Q2 = 3),
		not(Q3 = 3),
		not(Q4 = 3),
		not(Q5 = 3),
		not(Q6 = 3),
		not(Q7 = 3),
		assert(hardmode(MyEnemyIs, Q1)),
		assert(boss(MyEnemyIs, Q2)),
		assert(rare(MyEnemyIs, Q3)),
		assert(callable(MyEnemyIs, Q4)),
		assert(timeSpan(MyEnemyIs, Q5)),
		assert(event(MyEnemyIs, Q6)),
		assert(classic(MyEnemyIs, Q7)),
		write("Враг был добавлен в базу данных!"),
		save(Path)
	);
	(
		(
			Q1 = 3;
			Q2 = 3;
			Q3 = 3;
			Q4 = 3;
			Q5 = 3;
			Q6 = 3;
			Q7 = 3
		),
		write("Враг не был добавлен в базу данных, так как вы не знали один из ответов!")
	).

save(Path) :-
	tell(Path),
	forall(
		(
			hardmode(Enemy, _)
		),

		(
			hardmode(Enemy, Q1),
			boss(Enemy, Q2),
			rare(Enemy, Q3),
			callable(Enemy, Q4),
			timeSpan(Enemy, Q5),
			event(Enemy, Q6),
			classic(Enemy, Q7),

			write(":- assert(hardmode(\""),       write(Enemy), write("\", "), write(Q1), write("))."), nl,
			write(":- assert(boss(\""),           write(Enemy), write("\", "), write(Q2), write("))."), nl,
			write(":- assert(rare(\""),           write(Enemy), write("\", "), write(Q3), write("))."), nl,
			write(":- assert(callable(\""),       write(Enemy), write("\", "), write(Q4), write("))."), nl,
			write(":- assert(timeSpan(\""),       write(Enemy), write("\", "), write(Q5), write("))."), nl,
			write(":- assert(event(\""),          write(Enemy), write("\", "), write(Q6), write("))."), nl,
			write(":- assert(classic(\""),        write(Enemy), write("\", "), write(Q7), write("))."), nl,
			nl
		)
	),
	told.
