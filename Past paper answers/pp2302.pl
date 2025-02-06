% Police -> P
% Robbers -> R
% Boat -> B
% Left bank -> Lb
% Right bank -> Rb

% unsafe states
unsafe(state_lb(P,R,_)):- P > 0, R > P, !.
unsafe(state_lb(P,R,_)):- P < 3, P > R.

% left to right moves
move(state_lb(P,R,1), state_lb(P1,R,0), 'A Policeman goes from left to right alone'):- P > 0, P1 is P - 1.
move(state_lb(P,R,1), state_lb(P1,R,0), '2 Policemen go from left to right'):- P > 1, P1 is P - 2.
move(state_lb(P,R,1), state_lb(P1,R1,0), 'A Policeman and a Robber go from left to right'):- P > 0, R > 0, P1 is P - 1, R1 is R - 1.
move(state_lb(P,R,1), state_lb(P,R1,0), 'A Robber goes from left to right'):- R > 0, R1 is R - 1.
move(state_lb(P,R,1), state_lb(P,R1,0), '2 Robbers go from left to right'):- R > 1, R1 is R - 2.

% right to left moves
move(state_lb(P,R,0), state_lb(P1,R,1), 'A Policeman goes from right to left'):- P < 3, P1 is P + 1.
move(state_lb(P,R,0), state_lb(P1,R,1), '2 Policemen go from right to left'):- P < 2, P1 is P + 2.
move(state_lb(P,R,0), state_lb(P1,R1,1), 'A Policeman and a Robber go from right to left'):- P < 3, R < 3, P1 is P + 1, R1 is R + 1.
move(state_lb(P,R,0), state_lb(P,R1,1), 'A Robber goes from right to left'):- R < 3, R1 is R + 1.
move(state_lb(P,R,0), state_lb(P,R1,1), '2 Robbers go from right to left'):- R < 2, R1 is R + 2.

% GS -> Goal_state
% Path
% Actions
% CS -> Current_state
% PathSF -> Path_So_Far
% ActionsSF -> Actions_So_Far
% ActionPlan
% Final_Path
% NS -> New_state

find_action_path(GS,[GS|Path],Actions,Actions,[GS|Path]).
find_action_path(GS,[CS|PathSF],ActionsSF,ActionPlan,Final_Path):- CS \= GS, move(CS, NS, Action), not(unsafe(NS)), not(member(NS, PathSF)), find_action_path(GS,[NS,CS|PathSF],[Action|ActionsSF],ActionPlan,Final_Path).

get_action_path(CS,GS,ActionPlan,Path):- find_action_path(GS,[CS],[],ActionPlan,Path).

solve:-get_action_path(state_lb(3,3,1), state_lb(0,0,0), AP, P), reverse(P,P1), reverse(AP,AP1),write(P1),nl,write(' Actions '),nl,write('-----------'),nl,print_list(AP1).

print_list([]).
print_list([H|T]):-write(H),nl,print_list(T).