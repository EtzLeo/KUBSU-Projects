% ��� ����������������� ����. ����� ����� ������� ������������ �����.

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-	I1 is I+1,read(X),append(List,[X],List1),
						read_list(List1,A,I1,N).

listLen(List, Result) :- listLen(List, Result, 0).
listLen([], Acc, Acc) :- !.
listLen([H|T], Result, Acc) :- AccN is Acc + 1, listLen(T, Result, AccN).

% ���������� ������� ��������� � ������ ������� ���������
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

% uniq_el(A,B) � �������� ������ � ��� ��������
unique_elems([], []):- !.
unique_elems([H|T], List2):- unique_elems([H|T], List2, []).
unique_elems([], CurList, CurList):- !.
unique_elems([H|T], List, []):- unique_elems(T, List, [H]), !.
unique_elems([H|T], List, CurList):-
	not(contains(CurList, H)), append(CurList, [H], NewList), unique_elems(T, List, NewList), !.
unique_elems([_|T], List, CurList):- unique_elems(T, List, CurList).

% ������� ��� Elem � ������
count(_, [], 0):-!.
count(Elem, List, X):- count(Elem, List, 0, X).
count(_, [], Count, Count):- !.
count(Elem, [Elem|T], Count, X):- Count1 is Count + 1, count(Elem, T, Count1, X), !.
count(Elem, [_|T], Count, X):- count(Elem, T, Count, X).

inputEdges(0) :- !.
inputEdges(EdgesNumber) :-
	write('Enter first vertex name: '), read(FVertexName),
	write('Enter second vertex name: '), read(SVertexName),
	write('You enter undirected edge: '), write(FVertexName), write(' <-> '), write(SVertexName), nl, nl,
	assert(edge(FVertexName, SVertexName)),
	assert(edge(SVertexName, FVertexName)),
	EdgesNumber_ is EdgesNumber - 1,
	inputEdges(EdgesNumber_).

% �������� R ��������� � ���������� L ���������� �� �������.
isEqual(L, R) :-
	isEqual(L, L, R),
	isEqual(R, R, L).

isEqual([], _, _) :- !.
isEqual([H|T], L, R) :-
	count(H, L, LCount),
	count(H, R, RCount),
	LCount = RCount,
	isEqual(T, L, R).

% ���������� ������ ������ ������� � V
getAllAdjVertexes(V, [], Acc, Result) :- Result = Acc, !.
getAllAdjVertexes(V, [H|T], Acc, Result) :-
	(
		edge(V, H);
		edge(H, V)
	),
	getAllAdjVertexes(V, T, [H|Acc], Result), !.

getAllAdjVertexes(V, [H|T], Acc, Result) :-
	not(
		edge(V, H);
		edge(H, V)
	),
	getAllAdjVertexes(V, T, Acc, Result), !.

% ��� �� ������� �� S, ������ � ��������� �� Vertexes?
isConnectedToAll(S, Vertexes) :-
	isConnectedToAll_(S, Vertexes, [], R),
	append(R, S, RS), % �� ����, ��� ��� � S �������
	unique_elems(RS, RClear),
	isEqual(RClear, Vertexes).

isConnectedToAll_([], Vertexes, Acc, Result) :- Result = Acc, !.
isConnectedToAll_([SH|ST], Vertexes, Acc, Result) :-
	getAllAdjVertexes(SH, Vertexes, [], R),
	append(R, Acc, AccButCoolNowSoooBig),
	isConnectedToAll_(ST, Vertexes, AccButCoolNowSoooBig, Result).

% ������� ��� �������� result � ������ L
resultsToList(L) :- resultsToList([], L).

resultsToList(Acc, L) :-
	result(X),
	not(in_list(Acc, X)),
	resultsToList([X|Acc], L), !.

resultsToList(Acc, Acc).

% ���� ����������� ������� � L
minimalItem(L, Res) :- minimalItem(L, 10000, Res).
minimalItem([H|T], Acc, Res) :- H < Acc, minimalItem(T, H, Res).
minimalItem([H|T], Acc, Res) :- H > Acc, minimalItem(T, Acc, Res).
minimalItem([], Acc, Res) :- Res = Acc.

% ��������� ��� ������������ ������ �� ��� ���, ���� �� ������ �����������. ������ ����������� ����� ������������.
minimumSet(Vertexes) :-
	forall(
		(
			sub_set(S, Vertexes),
			isConnectedToAll(S, Vertexes)
		),

		(
			listLen(S, Size),
			assert(result(Size))
		)
	),

	resultsToList(L),
	minimalItem(L, Minimal),
	write("�����: "), write(Minimal), nl, !.


graphWorker :-
	write('Input vertexes number: '), read(VertexesNumber),
	read_list(Vertexes, VertexesNumber),
	write('Entered vertexes: '), write(Vertexes), nl, nl,

	allVertexesList(L),
	write(L), nl,

	dynamic(edge/2),
	write('Input edges number: '), read(EdgesNumber),
	inputEdges(EdgesNumber),

	dynamic(result/1),
	minimumSet(Vertexes),

	abolish(vertex/1),
	abolish(edge/1),
	abolish(result/1).

% �������� ������
graphWorkerTest :-
	Vertexes = ['a', 'b', 'c', 'd', 'g'],

	dynamic(edge/2),
	assert(edge('a', 'b')),
	assert(edge('a', 'g')),

	assert(edge('b', 'a')),
	assert(edge('b', 'g')),
	assert(edge('b', 'd')),
	assert(edge('b', 'c')),

	assert(edge('c', 'b')),
	assert(edge('c', 'd')),

	assert(edge('g', 'a')),
	assert(edge('g', 'b')),
	assert(edge('g', 'd')),

	assert(edge('d', 'b')),
	assert(edge('d', 'c')),
	assert(edge('d', 'g')),

	dynamic(result/1),
	minimumSet(Vertexes),

	abolish(vertex/1),
	abolish(edge/2),
	abolish(result/1).
