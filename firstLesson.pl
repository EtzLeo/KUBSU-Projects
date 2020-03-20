man(anatoly).
man(dimitry).
man(stepan).
woman(zoya).
child(dimitry,anatoly).
child(dimitry,zoya).
child(stepan,anatoly).
child(stepan,zoya).
woman(irina).
woman(larisa).
woman(anya).
woman(tanya).
woman(vika).
man(kolya).
child(anya,stepan).
child(anya,irina).
child(kolya,stepan).
child(kolya,irina).
child(tanya,dimitry).
child(tanya,larisa).
child(vika,dimitry).
child(vika,larisa).
ded(X,Y):-man(Y),child(Z,Y),child(X,Z).
brothers(X,Y):-man(Y),man(X),child(X,Z),child(Y,Z), not(X=Y).
sisters(X,Y):-woman(X),woman(Y),child(X,Z),child(Y,Z), not(X=Y).
sb(X,Y):-woman(X),man(Y),child(X,Z),child(Y,Z).
sb(X,Y):-woman(Y),man(X),child(X,Z),child(Y,Z).
sb:-sisters(X,Y);brothers(X,Y).
family(X,Y):-man(Y),woman(X),child(Z,X),child(Z,Y).
family(X,Y):-man(X),woman(Y),child(Z,X),child(Z,Y).
uncle(X,Y):-man(Y),not(child(X,Y)), family(Y,Z),(child(Y,anatoly);child(Z,anatoly)).
aunt(X,Y):-woman(Y),not(child(X,Y)), family(Y,Z),(child(Y,anatoly);child(Z,anatoly)).
