parent(tom,bob).
parent(pam,bob).
parent(tom,liz).
parent(bob,ann).
parent(pat,jim).
female(pam).
female(liz).
female(pat).
female(ann).
male(tom).
male(bob).
male(jim).


mother(X,Y):-parent(X,Y),female(X).
father(X,Y):-parent(X,Y),male(X).
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\==Y.
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.
grandparent(X,Y):-parent(X,Z),parent(Z,Y).
grandfather(Z,Y):-parent(Z,X),parent(X,Y),male(Z).
grandmother(Z,Y):-parent(Z,X),parent(X,Y),female(Z).
grandchild(Y,Z):-parent(Z,X),parent(X,Y).
grandson(Y,Z):-parent(Z,X),parent(X,Y),male(Y).
granddaughter(Y,Z):-parent(Z,X),parent(X,Y),female(Y).
happy(X):-parent(X,_).
twochi(X):-parent(X,Y),parent(X,Z),sister(Z,Y).
aunt(X,Z):-parent(Y,Z),sister(X,Y).
uncle(X,Z):-parent(Y,Z),brother(X,Y).
