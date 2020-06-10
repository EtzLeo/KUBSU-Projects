/*
	��������!
	��� �������� ��������� ���������� ������������� ����! ��� ���������� ������ ����������
	Prolog �� ������� � ����������� ��� �����, � ������� ��� �� ����� ���������� ���� IZ-7-Base!
	� ��� �� ����� �������� ����������� ����.
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
	write('����������� �� ��� ���� ������ ����� �������� ����� �����?'), nl,
	write('1. ��'), nl,
	write('0. ���'), nl,
	write('3. �� ����'), nl,
	read(Q1),
	updateClause(Q1, Answer1),

	write('��� ���� �������� ������, ����-������ ��� ������ �������?'), nl,
	write('1. ��'), nl,
	write('0. ���'), nl,
	write('3. �� ����'), nl,
	read(Q2),
	updateClause(Q2, Answer2),

	write('��� ���� �������� ������ �����������? [����� - ������!]'), nl,
	write('1. ��'), nl,
	write('0. ���'), nl,
	write('3. �� ����'), nl,
	read(Q3),
	updateClause(Q3, Answer3),

	write('����� �� ����� �������� ������� ���������� ������-���� ������ ����������, ������ ������������� ��������������� ������?'), nl,
	write('1. ��'), nl,
	write('0. ���'), nl,
	write('3. �� ����'), nl,
	read(Q4),
	updateClause(Q4, Answer4),

	write('����� �� ��������� ����������� �� ��������� �� ����� ������-���� ������� �����? ��������, ������ ����� ��� ������ ����'), nl,
	write('1. ��'), nl,
	write('0. ���'), nl,
	write('2. ��������'), nl,
	write('3. �� ����'), nl,
	read(Q5),
	updateClause(Q5, Answer5),

	write('������� �� �������, ���-���� ��������� � ����� �����������?'), nl,
	write('1. ��'), nl,
	write('0. ���'), nl,
	write('3. �� ����'), nl,
	read(Q6),
	updateClause(Q6, Answer6),

	write('���� ��� � ������������ ��������? �� ����, �� ������ 1.1'), nl,
	write('1. ��'), nl,
	write('0. ���'), nl,
	write('3. �� ����'), nl,
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
			write("��� ���� ����� ����� �� "), write(X), write("! ��� ��?"), nl,
			write("1. ��"), nl,
			write("2. ���"), nl,
			read(IsIt),
			IsIt = 1,
			abolish(result/1),
			write("������!"),
			fail
		)
	),

	write("� �� ����, ��� ���! ��� ��� ����? "), read(MyEnemyIs),
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
		write("���� ��� �������� � ���� ������!"),
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
		write("���� �� ��� �������� � ���� ������, ��� ��� �� �� ����� ���� �� �������!")
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
