%Q1.
valid(1).
valid(2).
valid(3).
valid(4).
valid(5).
valid(6).
return_dice(A,A,Sum):-valid(A),Sum is 2*(2*A),!.
return_dice(A,B,Sum):-valid(A),valid(B),Sum is A+B.

%Q2.
num_word(1,one).
num_word(2,two).
num_word(3,three).
num_word(4,four).
return_num_word(N):-N>4,write('Too Large').
return_num_word(N):-N<1,write('Too Small'),!.
return_num_word(N):-num_word(N,S),write(S).

%Q3.
pirate_and_gold(P,G):- P+G < 100,!.
go:-write("Enter number of pirates:"),read(P)
    ,write("Enter number of golds:"),read(G),
    (G>P,pirate_and_gold(P,G) -> write('Success') ;write('Fail')) .

%Q4.
print_num(L,L):-(L mod 7=\=0 -> write(L),!;!).
print_num(F,L):-(F mod 7=\=0 -> (write(F),nl,F1 is F+1,print_num(F1,L));
                (F1 is F+1,print_num(F1,L))).
%Q5.
fizzbuzz(N):-((N mod 3=:=0 ,N mod 5=:=0) -> write('FizzBuzz!'),nl;
             (N mod 3=:=0 -> write('Fizz!'),nl;(N mod 5=:=0 -> write('Buzz!'),nl;write(N),nl))).

printfizzbuzz(L,L):-fizzbuzz(L),!.
printfizzbuzz(F,L):-fizzbuzz(F),F1 is F+1,printfizzbuzz(F1,L).

%Q6.
collaz(0):-write('invalid number!'),!.
collaz(1):-!.
collaz(N):-(N mod 2 =:=0 -> N1 is N/2;N1 is (N*3)+1),
           write(N1),nl,collaz(N1).
