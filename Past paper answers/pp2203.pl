% Initial state
initial_state([h1,h2,h3,w1,w2,w3,boat]).

% Move predicate with descriptive actions
move(State, NewState, Action) :-
    % Remove boat from current state
    select(boat, State, StateWithoutBoat),
    
    % Select two people to move with boat
    select(X, StateWithoutBoat, IntermediateState),
    select(Y, IntermediateState, RemainingState),
    
    % Ensure X and Y are different
    X \= Y,
    
    % Combine moved items
    NewState = [boat, X, Y | RemainingState],
    
    % Determine action description
    (
        (X = h1, Y = w1, Action = "Husband 1 and Wife 1 cross") ;
        (X = h1, Y = w2, Action = "Husband 1 and Wife 2 cross") ;
        (X = h1, Y = w3, Action = "Husband 1 and Wife 3 cross") ;
        (X = h2, Y = w1, Action = "Husband 2 and Wife 1 cross") ;
        (X = h2, Y = w2, Action = "Husband 2 and Wife 2 cross") ;
        (X = h2, Y = w3, Action = "Husband 2 and Wife 3 cross") ;
        (X = h3, Y = w1, Action = "Husband 3 and Wife 1 cross") ;
        (X = h3, Y = w2, Action = "Husband 3 and Wife 2 cross") ;
        (X = h3, Y = w3, Action = "Husband 3 and Wife 3 cross") ;
        (X = h1, Action = "Husband 1 crosses") ;
        (X = h2, Action = "Husband 2 crosses") ;
        (X = h3, Action = "Husband 3 crosses") ;
        (X = w1, Action = "Wife 1 crosses") ;
        (X = w2, Action = "Wife 2 crosses") ;
        (X = w3, Action = "Wife 3 crosses")
    ),
    
    % Safety check (comment out if needed for debugging)
    safe_state(NewState).

% Safety check to prevent inappropriate pairings
safe_state(State) :-
    \+ (
        % H1 cannot be with W2 or W3 if H2 or H3 is not present
        (member(h1, State), member(w2, State), \+ member(h2, State)) ;
        (member(h1, State), member(w3, State), \+ member(h3, State)) ;
        % Similar checks for other husbands
        (member(h2, State), member(w1, State), \+ member(h1, State)) ;
        (member(h2, State), member(w3, State), \+ member(h3, State)) ;
        (member(h3, State), member(w1, State), \+ member(h1, State)) ;
        (member(h3, State), member(w2, State), \+ member(h2, State))
    ).

% Solution finding
solve(State, Path) :- 
    solve(State, [], Path).

solve(State, Path, Path) :- 
    % Goal state is when all elements except boat are on the other side
    State = [boat].

solve(State, Visited, Path) :-
    move(State, NewState, Action),
    \+ member(NewState, Visited),
    solve(NewState, [Action|Visited], Path).

% Run solution
run :-
    initial_state(InitialState),
    (solve(InitialState, Solution) ->
        reverse(Solution, ReversedSolution),
        write('Crossing Solution:'), nl,
        print_solution(ReversedSolution)
    ;
        write('No solution found.')
    ).

% Print solution
print_solution([]).
print_solution([H|T]) :-
    write(H), nl,
    print_solution(T).