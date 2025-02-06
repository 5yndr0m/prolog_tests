%1.
sum(A,B,SUM):-SUM is A+B.

%2.
odd_num(A):-A mod 2>0,write('Odd').
even_num(A):-A mod 2=:=0,write('even').
check_odd_even(A):-odd_num(A);even_num(A).

%3.
display:-write('Enter your word:'),read(X),
		 write('Entered word is:'),write(X).

%4.
find(A,B,sum,X):- X is A + B.
find(A,B,sub,X):- X is A - B.
find(A,B,div,X):- X is A / B.
find(A,B,mul,X):- X is A * B.
cal(X):-write('Enter the value:'),read(A),nl,
		write('Enter the value:'),read(B),nl,
		write('Enter the Operator(sum,sub,div,mul):'),read(O),
		find(A,B,O,X).

%5.
output_values(Last,Last):- write(Last),nl,
 write('end of example'),nl.
output_values(First,Last):-First=\=Last,write(First),
 nl,N is First+1,output_values(N,Last).

%6.
sumto(1,1).
sumto(N,S):-N>1,N1 is N-1,sumto(N1,S1),S is S1+N.

%7.
writesquares(1):-write(1),nl.
writesquares(N):-N>1,N1 is N-1,writesquares(N1),
Nsq is N*N,write(Nsq),nl.

%8.
go:-loop(start).
loop(end).
loop(X):-X\=end,write('Type end to end'),read(Word),
		write('Input was '),write(Word),nl,loop(Word).

%9.
factorial(1,1).
factorial(N,Nfact):-N1 is N-1,
					factorial(N1,Nfact1),Nfact is N*Nfact1.
