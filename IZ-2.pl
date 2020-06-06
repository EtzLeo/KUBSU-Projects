% ƒл€ введенного списка положительных чисел построить список всех
% положительных простых делителей элементов списка без повторений.

readList(A,N):-rL([],A,0,N).
rL(A,A,N,N):-!.
rL(B,A,I,N):-I1 is I+1,read(X),append(B,[X],B1),rL(B1,A,I1,N).

check([H|_],H).
check([_|T],E):-check(T,E).

pr(1):-!,fail.
pr(2):-!.
pr(X):-pr1(2,X).
pr1(X,X):-!.
pr1(I,X):-R is X mod I, R=0,!,fail.
pr1(I,X):- I1 is I+1,pr1(I1,X).

del(X,X,D,D):-!.
del(X,Y,C,D):-
    Y1 is Y+1,
    not(check(C,Y1)),
    R is X mod Y1,R=0,pr(Y1),
    append(C,[Y1],C1),
    del(X,Y1,C1,D).
del(X,Y,C,D):-Y1 is Y+1,del(X,Y1,C,D).

createNewList([],B,B):-!.
createNewList([H|T],B,C):-del(H,0,B,B1),createNewList(T,B1,C).

go:-
    write("¬ведите количество элементов: "), nl,
    read(N),
    write("¬ведите элементы: "), nl,
    readList(A,N),
    createNewList(A,[],C),write(C).
