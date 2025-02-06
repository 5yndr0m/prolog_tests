get_value(X,X,Val):-Sum is X * 2, Val is Sum * 2.
get_value(X,Y,Val):-Val is X + Y.

num_pair(1,one).
num_pair(2,two).
num_pair(3,three).
num_pair(4,four).

get_word(X,_):-X < 1, write("too small").
get_word(X,_):-X > 4, write("too large").
get_word(X,Y):-num_pair(X,Y).

trip(P,G):-( P + G > 100 
	-> write("False")
	; ( P =:= G
		-> write("True") ; write("False") ) ).

print_num(L,L):-(L mod 7 =\= 0 -> write(L), !; !).
print_num(F,L):-(F mod 7 =\= 0 -> ( write(F), nl, F1 is F + 1, print_num(F1,L) );
	(F1 is F + 1, print_num(F1,L))).

fizzbuzz(X):-((X mod 3 =:= 0, X mod 5 =:= 0) -> write("FizzBuzz"), nl ;
	(X mod 3 =:= 0 -> write("Fizz"), nl; 
		(X mod 5 =:= 0 -> write("Buzz"), nl))).
print_fizzbuzz(L,L):-fizzbuzz(L),!.
print_fizzbuzz(F,L):-fizzbuzz(F),F1 is F + 1, print_fizzbuzz(F1,L).

ccp(0):-write("Invalid number"),!.
ccp(1):-!.
ccp(X):-(X mod 2 =:= 0 -> X1 is X / 2; X1 is (X * 3) + 1), write(X1), nl, ccp(X1).

lion(simba).
monkey(buchchi).
dog(lucy).

eat_meat(simba).
eat_plant(buchchi).
eat_both(lucy).

carnivorus(X):-eat_meat(X).
herbivorus(X):-eat_plant(X).
omnivorus(X):-eat_both(X).

animal(X):-lion(X).
animal(X):-monkey(X).
animal(X):-dog(X).

animal_type(X,carnivorus):-carnivorus(X).
animal_type(X,herbivorus):-herbivorus(X).
animal_type(X,omnivorus):-omnivorus(X).


word(d,o,g).
word(r,u,n).
word(t,o,p).
word(f,i,v,e).
word(f,o,u,r).
word(l,o,s,t).
word(m,e,s,s).
word(u,n,i,t).
word(b,a,k,e,r).
word(f,o,r,u,m).
word(g,r,e,e,n).
word(s,u,p,e,r).
word(p,r,o,l,g).
word(v,a,n,i,s,h).
word(w,o,n,d,e,r).
word(y,e,l,l,o,w).

solve(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,L14,L15,L16):-
	word(L1,L2,L3,L4,L5),
	word(L9,L10,L11,L12,L13,L14),
	word(L1,L6,L9,L15),
	word(L3,L7,L11),
	word(L5,L8,L13,L16).

find_solution:-
	solve(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,L14,L15,L16),
	write("Solution"), nl,
	write(L1),write(L2),write(L3),write(L4),write(L5), nl,
	write(L9),write(L10),write(L11),write(L12),write(L13),write(L14), nl,
	write(L1),write(L6),write(L9),write(L15), nl,
	write(L3),write(L7),write(L11), nl,
	write(L5),write(L8),write(L13),write(L16).

