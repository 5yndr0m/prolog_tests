adjucent(1,2).
adjucent(1,3).
adjucent(1,5).
adjucent(1,6).
adjucent(2,3).
adjucent(2,4).
adjucent(2,5).
adjucent(2,6).
adjucent(3,4).
adjucent(3,6).
adjucent(5,6).

adjucent_region(X,Y):-adjucent(X,Y).
adjucent_region(X,Y):-adjucent(Y,X).

scheme_1(1,red).
scheme_1(2,blue).
scheme_1(3,green).
scheme_1(4,yellow).
scheme_1(5,yellow).
scheme_1(6,orange).

scheme_2(1,red).
scheme_2(2,brown).
scheme_2(3,blue).
scheme_2(4,black).
scheme_2(5,black).
scheme_2(6,red).

check_scheme1:-adjucent_region(R1,R2),
    scheme_1(R1,Color),
    scheme_1(R2,Color),
    write('Scheme 1 is invalid : Region '),write(R1),write(' and Region '),write(R2), write(' are both '),write(Color),nl.
    
check_scheme2:-adjucent_region(R1,R2),
    scheme_2(R1,Color),
    scheme_2(R2,Color),
    write('Scheme 2 is invalid : Region '),write(R1),write(' and Region '),write(R2),write(' are both '),write(Color),nl.
    
check_coloring:-
    write('Checking Scheme 1 :\n'),
    (check_scheme1 -> true ; write('Scheme valid \n')),
    write('Checking Scheme 2 :\n'),
    (check_scheme2 -> true ; write('Scheme Valid \n')).