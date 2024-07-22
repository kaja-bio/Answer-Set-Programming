
block(b0). block(b1). block(b2). block(b3).
block(b4). block(b5). block(b6). block(b7).

location(X) :- block(X).
location(t).

fluent( inertial , on(B,L)) :- block(B), location(L).
fluent( defined , above (B,L)) :- block(B), location(L).
action(put(B,L)) :- block(B), location(L),
B != L.

% initial assumptions

holds(on(b0 ,t) ,0).
holds(on(b3 ,b0) ,0).
holds(on(b2 ,b3) ,0).
holds(on(b1 ,t) ,0).
holds(on(b4 ,b1) ,0).
holds(on(b5 ,t) ,0).
holds(on(b6 ,b5) ,0).
holds(on(b7 ,b6) ,0).

%% If block B is not known to be on location L at
%% step 0, then we assume it is not.
-holds(on(B,L),0) :- block(B), location(L),
not holds(on(B,L) ,0).

#const n = 8.
step(0..n).

holds(on(B,L),I+1) :- occurs(put(B,L),I),
I < n.

-holds(on(B,L2),I) :- holds(on(B,L1),I),
location(L2),
L1 != L2.

-holds(on(B2 ,B),I) :- holds(on(B1 ,B),I),
block (B),
block(B2),
B1 != B2.

holds(above(B2 ,B1),I) :- holds(on(B2 ,B1),I).
    
holds(above(B2 ,B1),I) :- holds(on(B2 ,B),I),
holds(above(B,B1),I).

-occurs(put(B,L),I) :- location(L), holds(on(B1, B), I).

-occurs(put(B1, B), I) :- block(B1), block(B), holds(on(B2, B), I).

%% CWA for Defined Fluents
-holds(F, I) :- fluent(defined, F), step(I), not holds(F, I).

%% General Inertia Axiom
holds(F, I + 1) :- fluent(inertial, F), holds(F, I), not -holds(F, I + 1), I < n.
-holds(F, I + 1) :- fluent(inertial, F), -holds(F, I), not holds(F, I + 1), I < n.

%% CWA for Actions
-occurs(A, I) :- action(A), step(I), not occurs(A, I).

goal(I) :-
holds(on(b4 ,t),I), holds(on(b6 ,t),I),
holds(on(b1 ,t),I), holds(on(b3 ,b4),I),
holds(on(b7 ,b3),I), holds(on(b2 ,b6),I),
holds(on(b0 ,b1),I), holds(on(b5 ,b0),I).

#show occurs/2.
