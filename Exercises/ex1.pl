parent(tom,bob).
parent(pam,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).

female(pam).
female(liz).
female(pat).
female(ann).

male(tom).
male(bob).
male(jim).

is_mother(X,Y):-parent(X,Y),female(X).

is_father(X,Y):-parent(X,Y),male(X).

is_sibling(X,Y):-parent(Z,X),parent(Z,Y), X \= Y.
% is_sister(X,Y):-parent(Z,X),parent(Z,Y),female(X), X \= Y.
is_sister(X,Y):-is_sibling(X,Y),female(X), X \= Y.

% is_brother(X,Y):-parent(Z,X),parent(Z,Y),male(X), X \= Y.
is_brother(X,Y):-is_sibling(X,Y),male(X), X \= Y.

is_grandparent(X,Y):-parent(X,Z),parent(Z,Y).

is_grandfather(X,Y):-parent(X,Z),parent(Z,Y),male(X).
% is_grandfather(X,Y):-is_grandparent(X,Y),male(X).

is_grandmother(X,Y):-parent(X,Z),parent(Z,Y),female(X).
% is_grandmother(X,Y):-is_grandparent(X,Y),female(X).

is_grandchild(X,Y):-parent(Y,Z),parent(Z,X).

is_grandson(X,Y):-parent(Y,Z),parent(Z,X),male(X).
% is_grandson(X,Y):-is_grandchild(X,Y),male(X).

is_granddaughter(X,Y):-parent(Y,Z),parent(Z,X),female(X).
% is_granddaughter(X,Y):-is_grandchild(X,Y),female(X).

has_child(X,Y):-parent(X,Y).
is_happy(X):-has_child(X,_).

has_2_children(X):-has_child(X,Y),has_child(X,Z),is_sister(Z,Y).

is_aunt(X,Y):-parent(Z,Y),is_sister(X,Z).

is_uncle(X,Y):-parent(Z,Y),is_brother(X,Z).
