fsum(X,Y,Sum):-Sum is X + Y.

is_odd(X):-X mod 2 =\= 0, write("Odd").
is_even(X):-X mod 2 =:= 0, write("Even").

odd_or_even(X):-is_odd(X);is_even(X).

enter_word:-write("Enter Word : "), nl, read(Word), nl, write("Word entered is : "),write(Word).

perform_action(X,Y,'+'):-Result is X + Y, write("Result : "),write(Result).
perform_action(X,Y,'-'):-Result is X - Y, write("Result : "),write(Result).
perform_action(X,Y,'*'):-Result is X * Y, write("Result : "),write(Result).
perform_action(X,Y,'/'):-Y \= 0, Result is X / Y, write("Result : "),write(Result).

let_calculate:-write("Enter number 1 : "), nl, 
		read(Num1), nl, 
		write("Enter number 2 : "), nl, 
		read(Num2), nl, 
		write("Enter operator : "), nl, 
		read(Op), nl,
		perform_action(Num1, Num2, Op).

first2last(F,L):-F>L, write("First number need to be smaller than Last").
first2last(F,L):-F=<L, write(F), nl, N is F + 1, first2last(N,L).

sum_to(1,1).
sum_to(N,Sum):-N>1, N1 is N - 1, sum_to(N1,PSum), Sum is PSum + N.

squares(0).
squares(N):-N>0, Sq is N * N, N1 is N - 1, squares(N1), write(Sq), nl.


process_term(end):-write("Input Completed"), nl.
process_term(Term):- Term \= end, write("You entered : "), write(Term), nl, read_terms.
read_terms:-write("Enter a term : "), nl, read(Term), process_term(Term).

factorial(0,1).
factorial(N,R):-N>0, N1 is N - 1, factorial(N1,SR), R is N * SR.
