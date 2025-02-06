word(p,r,o,l,o,g).
word(s,e,r,v,e,r).
word(o,n,l,i,n,e).
word(m,e,m,o,r,y).
word(l,i,n,u,x).
word(p,i,x,e,l).
word(e,m,a,c,s).
word(j,a,v,a).
word(d,a,t,a).
word(p,e,r,l).
word(d,v,d).
word(w,e,b).
word(n,f,s).
word(g,n,u).
word(x,m,l).
word(r,o,m).
word(m,a,c).
word(s,q,l).

solve([L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,L14,L15,L16,L17,L18]):-
word(L1,L3,L5,L4,L5,L6),
word(L4,L8,L7,L11,L12),
word(L9,L2,L10),
word(L16,L17,L4),
word(L13,L14,L18),
word(L1,L2,L3,L4),
word(L5,L7,L4,L8,L7,L2),
word(L6,L7,L11),
word(L7,L15,L16),
word(L12,L13,L4),
word(L2,L13,L14,L18,L16).

crossword:-solve([L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,L13,L14,L15,L16,L17,L18]),!,
write('Solution found:'), nl,
write('Horizontal : '), nl,
write(L1),write(L3),write(L5),write(L4),write(L5),write(L6),nl,
write(L4),write(L8),write(L7),write(L11),write(L12),nl,
write(L9),write(L2),write(L10),nl,
write(L16),write(L17),write(L4),nl,
write(L13),write(L14),write(L18),nl,
write('Verticle : '),nl,
write(L1),write(L2),write(L3),write(L4),nl,
write(L5),write(L7),write(L4),write(L8),write(L7),write(L2),nl,
write(L6),write(L7),write(L11),nl,
write(L7),write(L15),write(L16),nl,
write(L12),write(L13),write(L4),nl,
write(L2),write(L13),write(L14),write(L18),write(L16).