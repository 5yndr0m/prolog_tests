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

