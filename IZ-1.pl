/*������� ����� d, ������� 1000, ��� �������� ���������� �����
1/d �������� ����� ������� ������.*/

/*������ ����� ����� ������� � ������������������ ��������. ����� ����, � ���� ������������������ ��� ������������ ������������� ����� ��������, � ���������� ����� ����� �� ����� d. ������� ���������� ����� (d+1)-�� ���� ������������������ �������� � ����� ����������� k, ��� ������� (d+1+k)-�� ���� ��������� � (d+1)-��.*/

findNumber(1000,Kol,Res,_,_,Res,Kol):-!.
findNumber(X,LenMax,Max,L,R,Res,Kol):-
    X1 is X+1,
    findR(X1,L,R,T),
    C is T,not(C=0),
    R1 is 10*T mod X1,
    findKol(X1,C,R1,1,M),
    M1 is M,
    (LenMax>M1 ->  findNumber(X1,LenMax,Max,0,1,Res,Kol);findNumber(X1,M1,X1,0,1,Res,Kol)).
findNumber(X,LenMax,Max,L,R,Res,Kol):- X1 is X+1, findNumber(X1,LenMax,Max,L,R,Res,Kol).

findR(X,X,R,R):-!.
findR(X,L,R,T):-L1 is L+1, R1 is 10*R mod X, findR(X,L1,R1,T).

findKol(_,C,C,K,K):-!.
findKol(X,C,R,K,M):-R1 is 10*R mod X, K1 is K+1, findKol(X,C,R1,K1,M).

go:-
    findNumber(1,0,1,0,1,Res,Kol),
    write("�����: "), write(Res), nl,
    write("����� �������: "),write(Kol).
