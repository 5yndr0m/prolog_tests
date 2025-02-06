%Q1.
reverse_list(L,L):-reverse_list(L,L,[]).
reverse_list([H|T],Z,Acc) :- reverse_list(T,Z,[H|Acc]).
reverse_list([],Z,Z).

is_palindrome(L) :- reverse_list(L,L).

%Q2.
insert_at(X,[X|_],1).
insert_at(X,[_|L],K) :- K > 1, K1 is K - 1, insert_at(X,L,K1).

%Q3.
appendlist([],A,A). 
appendlist([H|T],A,[H|U]):-appendlist(T,A,U). 

%Q4.
compress([],[]).
compress([X],[X]).
compress([X,X|Xs],Zs) :- compress([X|Xs],Zs).
compress([X,Y|Ys],[X|Zs]) :- X \= Y, compress([Y|Ys],Zs).

%Q5.
dupli([],[]).
dupli([X|Xs],[X,X|Ys]) :- dupli(Xs,Ys).

%Q6.
split_list(L,0,[],L).
split_list([X|Xs],N,[X|Ys],Zs) :- N > 0, N1 is N - 1, split_list(Xs,N1,Ys,Zs).

%Q7.
addtoend(H,[],[H]). 
addtoend(X,[H|T],[H|T1]):-addtoend(X,T,T1). 
rotate_list([H|T],L1):-addtoend(H,T,L1).

%Q8.
memberx(N,[N|T]). 
memberx(N,[X|T]):-memberx(N,T). 
delete_unique([],[]). 
delete_unique([H|T],[H|Y]):-memberx(H,T),!,delete_unique(T,Y). 
delete_unique([H|T],Y):-delete_unique(T,Y).

%Q9.
takeout(X,[X|R],R).  
takeout(X,[F|R],[F|S]) :- takeout(X,R,S).
perm([X|Y],Z) :- perm(Y,W), takeout(X,Z,W).  
perm([],[]).

%Q10.
morethan(_,[],[]). 
morethan(K,[H|T],[H|U]):- H>=K, morethan(K,T,U),!. 
morethan(K,[H|T],U):- morethan(K,T,U). 

%Q11.
memberx(N,[N|T]). 
memberx(N,[X|T]):-memberx(N,T). 
deleteall(N,[],[]). 
deleteall(N,[N|T],U):-!,deleteall(N,T,U). 
deleteall(N,[H|T],[H|U]):-deleteall(N,T,U). 
make_unique([],[]). 
make_unique([H|T],[H|Y]):-memberx(H,T),!,deleteall(H,T,T1),make_unique(T1,Y). 
make_unique([H|T],[H|Y]):-make_unique(T,Y).

%Q12.
deleteall(N,[],[]). 
deleteall(N,[N|T],U):-!,deleteall(N,T,U). 
deleteall(N,[H|T],[H|U]):-deleteall(N,T,U). 

count(N,[],0). 
count(N,[N|T],U):-!,count(N,T,U1), U is U1+1. 
count(N,[H|T],U):-count(N,T,U). 

occurrences([],[]). 
occurrences([H|T],[[H,X]|Y]):-count(H,[H|T],X), deleteall(H,T,T1), occurrences(T1,Y).

%Q13 bubble_sort.
swap([X,Y|R],[Y,X|R]):-X>Y.
swap([Z|R],[Z|R1]):-swap(R,R1).

bubblesort([],[]).
bubblesort([X],[X]).
bubblesort(List, Sorted):-swap(List,List1),bubblesort(List1,Sorted).
bubblesort(Sorted,Sorted).

%Q14 merge_sort.
msort([First,Second|Rest],Result) :-partition([First,Second|Rest],L1,L2),
    					msort(L1,SL1),
    					msort(L2,SL2),
    					merge(SL1,SL2,Result).
msort(List,List).

partition([],[],[]).
partition([X],[X],[]).
partition([First,Second|Rest],[First|F],[Second|S]) :-partition(Rest,F,S).

%Q15 quick_sort.
quicksort([],[]).
quicksort([X],[X]).
quicksort([H|T],SL):-split(H,T,Sml,Bl),
    quicksort(Sml,SSml),
    quicksort(Bl,SBl),
    concatenate(SSml,[H|SBl],SL).

split(X,[],[],[]).
split(X,[H1|T1],[H1|Sml],Bl):-X>H1,
    split(X,T1,Sml,Bl).

split(X,[H1|T1],Sml,[H1|Bl]):-
    split(X,T1,Sml,Bl).


concatenate([],L,L).
concatenate([X|L1],L2,[X|L3]):-concatenate(L1,L2,L3).
