%cut.
%omit_the_unwanted_backtracking.
sumto(1,1):-!.
sumto(N,S):-N1 is N-1,sumto(N1,S1),
			S is S1+N.
   
%Repeat.
%start_again_from_the_fail_clause. 
vaild(10).
getvalue:-repeat,write("Enter the Value 10."),
		  nl,read(Value),vaild(Value),
		  write("Answer is "),write(Value),!.
	
valid(yes).
valid(no).
getmsg:-write('Enter the answer'),nl,
		repeat,write('Enter only yes or no:'),read(Ans),
		valid(Ans),nl,write('End!!').

   
%if_Control_Structure.
check_number(X) :- 
    (   X > 0 
    ->  write('The number is positive.') 
    ;  ( X < 0 
    ->  write('The number is negative.') 
    ;   write('The number is zero.') )
    ). 

%(condition -> clause;else_clause).