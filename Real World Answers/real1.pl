% ------------------farmer, wolf, goat, cabbage

initial_state(state(right,right,right,right)).

%---------------- F ,   W,   G,   C
goal_state(state(left,left,left,left)).

%--------- F -> Left , W -> Right, G -> Right, C -> Left
unsafe(state(L,R,R,L)):-notequal(L,R).

%-------- F -> Left, W -> Left, G -> Right, C -> Right
unsafe(state(L,L,R,R)):-notequal(L,R).

notequal(left,right).
notequal(right,left).

% ---------Farmer moves alone
write_action(move1(Place1,Place2)):-write('Farmer goes from '),write(Place1),write(' to '),write(Place2),nl.
%--------Farmer moves with Goat
write_action(move2(Place1,Place2)):-write('Farmer with Goat, goes from '),write(Place1),write(' to '),write(Place2),nl.
%--------Farmer moves with Wolf
write_action(move3(Place1,Place2)):-write('Farmer with Wolf, goes from '),write(Place1),write(' to '),write(Place2),nl.
%--------Farmer moves with Cabbage
write_action(move4(Place1,Place2)):-write('Farmer with Cabbage, goes from '),write(Place1),write(' to '),write(Place2),nl.

%----------Farmer travels alone
travel(state(Place1,A,B,C),move1(Place1,Place2),state(Place2,A,B,C)):-notequal(Place1,Place2),not(unsafe(state(Place2,A,B,C))).
%-----------Farmer travels with Goat
travel(state(Place1,A,Place1,B),move2(Place1,Place2),state(Place2,A,Place2,B)):-notequal(Place1,Place2),not(unsafe(state(Place2,A,Place2,B))).
%-----------Farmer travels with Wolf
travel(state(Place1,Place1,A,B),move3(Place1,Place2),state(Place2,Place2,A,B)):-notequal(Place1,Place2),not(unsafe(state(Place2,Place2,A,B))).
%-----------Farmer travels with Cabbage
travel(state(Place1,A,B,Place1),move4(Place1,Place2),state(Place2,A,B,Place2)):-notequal(Place1,Place2),not(unsafe(state(Place2,A,B,Place2))).

%----------write action list
write_action_list([]).
write_action_list([H|T]):-write_action(H),write_action_list(T),!.

can(S,S,_,[]).
can(S1,S2,V,[A|L]):-travel(S1,A,T),not(member(T,V)),can(T,S2,[T|V],L).

go:-initial_state(S),goal_state(G),can(S,G,[S],L),write_action_list(L),!.
