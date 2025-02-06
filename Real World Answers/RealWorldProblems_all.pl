%Q1.
friends( S)  :- 
    S = [p( _, _, _, 1), p( _, _, _, 2), p( _, _, _, 3)],
    member( p( bill, _, _, _), S),
    member( p( _, _, zurich, _), S),
    member( p( michael, doctor, _, RM), S),
    member( p( _, _, bern, RB), S), RM < RB,
    member( p( daniel, _, basel, RD), S),
    member( p( _, officer, _, RBe), S), RD < RBe,
    member( p( _, sport_teacher, _, 1), S).
	
%method 02
	
job(officer).
job(sport_teacher).

city(bern).
city(basel).
city(zurich).

rank(1).
rank(2).
rank(3).
rank(p(_,sport_teacher,_,_),1).
rank(p(michael,doctor,_,RM),RM):-rank(RM),RM=\=1.
rank(p(_,_,bern,_),R1):-rank(p(michael,doctor,_,RM),RM),
						rank(R1),RM<R1.
rank(p(_,officer,_,_),R2):-p(daniel,_,_,RD),
						   rank(R2),rank(RD),RD<R2,R2=\=1.

friends(p(bill,JB,CB,RB),p(michael,doctor,CM,RM),p(daniel,JD,CD,RD)):-
job(JB),job(JD),JB\==JD,city(CB),city(CM),city(CD),CB\==CM,CD\==CM,CB\==CD,
rank(p(bill,JB,CB,RB),RB),rank(p(michael,doctor,CM,RM),RM),
rank(p(daniel,JD,CD,RD),RD).

%Q2.
init_state(state(0,0)).
goal_state(state(2,0)).

write_action(action1):-write('Fill the large jug(4l)'),nl.
write_action(action2):-write('Fill the small jug (3l)'),nl.
write_action(action3):-write('Empty the small jug (3l)'),nl.
write_action(action4):-write('Empty the large jug (4l)'),nl.
write_action(action5):-write('Fill the large jug (4l) transfer from small jug (3l)'),nl.
 write_action(action6):-write('Fill the small jug (3l) transfer from large jug (4l)'),nl.
write_action(action7):-write('Empty the large jug (4l) by filling small jug (3l)'),nl.
write_action(action8):-write('Empty the small jug (3l) by filling large jug (4l)'),nl.

fill(state(L,S),action1,state(4,S)):-L<4.
fill(state(L,S),action2,state(L,3)):-S<3.
fill(state(L,S),action3,state(L,0)):-S>0.
fill(state(L,S),action4,state(0,S)):-L>0.
fill(state(L,S),action5,state(4,T)):-L<4,T is L+S-4,S>0.
fill(state(L,S),action6,state(T,3)):-S<3,T is L+S-3,L>0.
fill(state(L,S),action7,state(0,T)):-L>0,T is S+L,S<3.
fill(state(L,S),action8,state(T,0)):-S>0,T is L+S, L<4.

write_action_list([]).
write_action_list([H|T]):- write_action(H),write_action_list(T),!.

mem(X,[X|_]):-!.
mem(X,[_|L]):-member(X,L).

can_fill(S,S,P,P):-!.
can_fill(S1,S2,M,[A|T]):-fill(S1,A,S3),not(mem(S3,M)),
						can_fill(S3,S2,[S3|M],T),!.

go:-init_state(S),goal_state(G),can_fill(S,G,[S],L),write_action_list(L),!.

%Q3.
adjacent(red,yellow).
adjacent(red,blue).
adjacent(red,green).
adjacent(blue,red).
adjacent(blue,yellow).
adjacent(blue,green).
adjacent(yellow,red).
adjacent(yellow,green).
adjacent(yellow,blue).
adjacent(green,red).
adjacent(green,blue).
adjacent(green,yellow).

coloring([A,B,C,D,E]):-adjacent(A,B),adjacent(A,E),
adjacent(A,D),
adjacent(B,A),
adjacent(B,C),
adjacent(B,D),
adjacent(B,E),
adjacent(C,B),
adjacent(C,D),
adjacent(C,E),
adjacent(D,A),
adjacent(D,B),
adjacent(D,C),
adjacent(D,E),
adjacent(E,A),
adjacent(E,B),
adjacent(E,C),
adjacent(E,D).

%Q4.
%state(monkey-horizontal, monkey-vertical,box location, has/ has not banana).

initial_state(state(door,onfloor,window,hasnot)).
goal_state(state(middle,onbox,middle,has)).

move(state(middle,onbox,middle,hasnot),grasp,state(middle,onbox,middle,has)).
move(state(P,onfloor,P,hasnot),climb,state(P,onbox,P,hasnot)).
move(state(P,onfloor,P,hasnot),push(P,P1),state(P1,onfloor,P1,hasnot)).
move(state(P1,onfloor,B,hasnot),walk(P1,P2),state(P2,onfloor,B,hasnot)).

writeAction(climb):-write('Monkey climb the box'),nl.
writeAction(grasp):-write('Monkey grasp the banana'),nl.
writeAction(walk(A,B)):-write('Monkey walk from ':A:' to ':B:' '),nl.
writeAction(push(A,B)):-write('Monkey push the box from ':A:' to ':B:' '),nl.

writeActionList([]).
writeActionList([H|T]):-writeAction(H), writeActionList(T).

canGet(S,S,[]).
canGet(S1,S2,[H|T]):-move(S1,H,S),canGet(S,S2,T).


go:-initial_state(S), goal_state(G), canGet(S,G,L), writeActionList(L).

%Q5.
%Predicate_state_consist_of_the_position_of_farmer_goat_wolf_grass.
initial_state(state(east,east,east,east)).
goal_state(state(west,west,west,west)).

unsafe(state(B,A,A,_)):-notequal(A,B).
unsafe(state(B,A,_,A)):-notequal(A,B).

notequal(east,west).
notequal(west,east).

write_action(move1(P1,P2)):-write('Farmer goes with goat from '),write(P1),write(' to '),write(P2),nl.
write_action(move2(P1,P2)):-write('Farmer goes alone from '),write(P1),write(' to '),write(P2),nl.
write_action(move3(P1,P2)):-write('Farmer goes with wolf from '),write(P1),write(' to '),write(P2),nl.
write_action(move4(P1,P2)):-write('Farmer goes with grass from '),write(P1),write(' to '),write(P2),nl.


travel(state(P1,P1,A,B),move1(P1,P2),state(P2,P2,A,B)):-notequal(P1,P2),not(unsafe(state(P2,P2,A,B))).
travel(state(P1,A,B,C),move2(P1,P2),state(P2,A,B,C)):-notequal(P1,P2),not(unsafe(state(P2,A,B,C))).
travel(state(P1,A,P1,B),move3(P1,P2),state(P2,A,P2,B)):-notequal(P1,P2),not(unsafe(state(P2,A,P2,B))).
travel(state(P1,A,B,P1),move4(P1,P2),state(P2,A,B,P2)):-notequal(P1,P2),not(unsafe(state(P2,A,B,P2))).

write_action_list([]).
write_action_list([H|T]):-write_action(H),write_action_list(T),!.

can(S,S,_,[]).
can(S1,S2,V,[A|L]):-travel(S1,A,T),not(member(T,V)),can(T,S2,[T|V],L).

go:-initial_state(S),goal_state(G),can(S,G,[S],L),write_action_list(L),!.

%Q6.
unsafe(state_w(M, C, _)):- M>0, C>M,!.  %on_the_west
unsafe(state_w(M, C, _)):- M<3, M>C.    %on_the_east_3-C >_3-M >0.

move(state_w(M, C, 1), state_w(M1, C, 0),'A Missionary goes alone from west to east'):-
	M>0,  M1 is M-1.

% M>0 means M>=1, unless there is one missionary, this action is not possible

move(state_w(M, C, 1), state_w(M2, C, 0),'Two Missionaries go  from west to east'):-
	M>1, M2 is M-2.

move(state_w(M, C, 1), state_w(M1, C1, 0),'A cannibal and a Missionary go  from west to east'):-
	C>0, M>0, M1 is M-1, C1 is C-1.

move(state_w(M, C, 1), state_w(M, C1, 0),'A cannibal goes  from west to east'):-
	C>0, C1 is C-1.

move(state_w(M, C, 1), state_w(M, C2, 0),'Two Cannibals go  from west to east'):-
	C>1, C2 is C-2.


% Moves from East to West

move(state_w(M, C, 0), state_w(M1, C, 1),'A Missionary goes alone from east to west'):-
	M<3, M1 is M+1.  %3-M>0

move(state_w(M, C, 0), state_w(M2, C, 1),'Two Missionaries go  from east to west'):-
	M<2, M2 is M+2.  %3-M>1

move(state_w(M, C, 0), state_w(M1, C1, 1),'A cannibal and a Missionary go  from east to west'):-
	C<3, M<3, M1 is M+1, C1 is C+1.   %3-M>0, 3-C >0


move(state_w(M, C, 0), state_w(M, C1, 1),'A cannibal goes  from east to west'):-
	C<3, C1 is C+1.  %3-C > 0

move(state_w(M, C, 0), state_w(M, C2, 1),'Two Cannibals go  from east to west'):-
	C<2, C2 is C+2.  %3-C >1.


find_actions_path(GS,[GS|Path],Actions,Actions,[GS|Path]).

find_actions_path(GS,[CS|PathSf],ActionsSf,ActionPlan,FinalPath):-
	CS\=GS,
	move(CS, NS, Action),
	not(unsafe(NS)),
	not(member(NS, PathSf)),
	find_actions_path(GS,[NS, CS|PathSf],[Action|ActionsSf],ActionPlan, FinalPath).

get_actions_path(CS, GS, ActPlan, Path):-
find_actions_path(GS, [CS], [], ActPlan, Path).


solve:-	get_actions_path(state_w(3,3,1), state_w(0,0,0),AP, P),
        reverse(P, P1),
        reverse(AP, AP1),
		write(P1), nl,
        write('Actions '), nl, write('======='), nl,
	    print_list(AP1).

print_list([H|T]):-write(H), nl,print_list(T).
print_list([]).


print_list_in_reverse([H|T]):-print_list_in_reverse(T),write(H), nl.
print_list_in_reverse([]).

