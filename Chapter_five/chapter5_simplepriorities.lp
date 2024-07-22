
record_for(bob).
father(rich, bob).
mother(patty, bob).
child(bob).

father(mike , mary).
record_for( mike).

record_for(rich).
father(charles, rich).
mother(susan, rich).
dead(rich).

record_for(patty).
dead(patty).

record_for(mary).
child(mary).
mother(patty, mary).

-dead(P) :- record_for(P),
not dead(P).

-child(X) :- record_for(X),
not child(X).

orphan(P) :- child (P),
parents_dead(P).

-orphan(P) :- record_for (P),
not may_be_orphan(P).

may_be_orphan(P) :- record_for(P),
child(P),
not -parents_dead(P).

parent(X,P) :- father(X,P).
parent(X,P) :- mother(X,P).

parents_dead(P) :- father(X,P),
dead(X),
mother(Y,P),
dead(Y).

-parents_dead(P) :- parent(X,P),
-dead(X).

program (0).
program (1).

entitled(X,1) :- record_for (X),
orphan(X),
not ab(d1(X)),
not -entitled (X,1).
entitled(X,0) :- record_for (X),
child(X),
not ab(d2(X)),
not -entitled (X,0).
-entitled(X,N2) :- program(N1), program(N2),
record_for(X),
entitled(X,N1),
N1 != N2.

-entitled(X,0) :- record_for(X),
orphan(X).
ab(d2(X)) :- record_for(X),
not -orphan(X).

-entitled(X,N) :- record_for(X),
dead(X),
program(N).
-entitled(X,N) :- record_for(X),
-child(X),
program(N).

check_status(X) :- record_for (X),
not -orphan(X),
not orphan(X).

#show entitled/2.
#show -entitled/2.
