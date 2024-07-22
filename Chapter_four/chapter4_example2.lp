
person(mary).
person(bob).
person(mike).
person(rich).
person(kathy).
person(patty).

child(mary).
child(bob).

dead(rich).
dead(patty).

 -child(X) :- person(X), not child(X).
-father(F,C) :- person(F),child (C), not father(F,C).
-mother(M,C) :- person(M), child (C),not mother(M,C).
-dead(X) :- person (X), not dead(X). %can the statement person(X) be removed? nah, bcs to make it a safe variable u have to have a positive literal in the body
    
parents_dead(P) :- father(F,P), mother(M,P), dead(F), dead(M).
-parents_dead(P) :- father(F,P), mother(M,P), not dead(F), not dead(M).

% add code to reject input and state answer is unknown if there is a lack of info about both parents

orphan(P) :- child (P), parents_dead(P).
-orphan(X) :- person(X), -parents_dead(P).
