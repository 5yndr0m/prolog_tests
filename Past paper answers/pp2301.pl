%grades
grades(X,'A+'):-X =< 100, X >= 80, !.
grades(X,'A'):-X =< 79, X >= 75, !.
grades(X,'A-'):-X =< 74, X >= 70, !.
grades(X,'B+'):-X =< 69, X >= 65, !.
grades(X,'B'):-X =< 64, X >= 60, !.
grades(X,'B-'):-X =< 59, X >= 55, !.
grades(X,'C+'):-X =< 54, X >= 50, !.
grades(X,'C'):-X =< 49, X >= 45, !.
grades(X,'C-'):-X =< 44, X >= 40, !.
grades(X,'D+'):-X =< 39, X >= 35, !.
grades(X,'D'):-X =< 34, X >= 30, !.
grades(X,'E'):-X =< 29, X >= 0, !.

%gpv
gpv('A+',4.0).
gpv('A',4.0).
gpv('A-',3.7).
gpv('B+',3.3).
gpv('B',3.0).
gpv('B-',2.7).
gpv('C+',2.3).
gpv('C',2.0).
gpv('C-',1.7).
gpv('D+',1.3).
gpv('D',1.0).
gpv('E',0.0).

%get grades for a given marks list
marks_2_grades([],[]).
marks_2_grades([H|T],[X|Z]):-grades(H,X), marks_2_grades(T,Z).

%get gpv for a list of given marks
grades_2_gpv([],[]).
grades_2_gpv([H|T],[X|Z]):-gpv(H,X), grades_2_gpv(T,Z).

marks_2_gpv([],[]).
marks_2_gpv(X,R):-marks_2_grades(X,R1), !, grades_2_gpv(R1,R).

%get sum of list of credits
credit_sum([],0).
credit_sum([H|T],Sum):- credit_sum(T,Sum1), Sum is Sum1 + H.

%calculate GPA
credit_x_gpv([],[],[]).
credit_x_gpv([C|T1],[G|T2],[R|TR]):-credit_x_gpv(T1,T2,TR), R is C * G.

get_gpa(Marks,Credits):-credit_sum(Credits,CSUM), marks_2_gpv(Marks,GPV), credit_x_gpv(Credits,GPV,CG), credit_sum(CG,CGSUM), Result is CGSUM / CSUM, write('GPA = '),write(Result). 