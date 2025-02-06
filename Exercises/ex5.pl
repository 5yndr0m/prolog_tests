reverse_list(L,L):-reverse_list(L,L,[]).
reverse_list([H|T],Z,Acc):-reverse_list(T,Z,[H|Acc]).
reverse_list([],Z,Z).

is_palindrom(L):-reverse_list(L,L).

insert_at(X,[X|_],1).
insert_at(X,[_|L],K):-K > 1,K1 is K - 1, insert_at(X,L,K1).

	
