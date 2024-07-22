
block(b0). block(b1). block(b2). block(b3).
block(b4). block(b5). block(b6). block(b7).

location(X) :- block(X).
location(t).

fluent( inertial , on(B,L)) :- block(B), location(L).
fluent( defined , above (B,L)) :- block(B), location(L).
action(put(B,L)) :- block(B), location(L),
B != L.

#const n = 1.
step(0..n).

holds(on(B,L),I+1) :- occurs(put(B,L),I), I < n.
    
-holds(on(B,L2),I) :- holds(on(B,L1),I), location(L2),L1 != L2.
    
-holds(on(B2 ,B),I) :- holds(on(B1 ,B),I),block (B), 
    block(B2),
    B1 != B2.
    
holds(above(B2 ,B1),I) :- holds(on(B2 ,B1),I).

holds(above(B2 ,B1),I) :- holds(on(B2 ,B),I),
holds(above(B,B1),I).

-occurs(put(B,L),I) :- location (L),
holds(on(B1 ,B),I).

-occurs(put(B1 ,B),I) :- block(B1), block(B),
holds(on(B2 ,B),I).

%% CWA for Defined Fluents

-holds(F,I) :- fluent( defined ,F), step (I), not holds(F,I).
    
%% General Inertia Axiom

holds(F,I+1) :- fluent( inertial ,F),
holds(F,I),
not -holds(F,I+1),
I < n.

-holds(F,I+1) :- fluent (inertial ,F),
-holds(F,I),
not holds(F,I+1),
I < n.

%% CWA for Actions
-occurs(A,I) :- action(A), step(I),
not occurs(A,I).

-occurs(put(B1 ,L),I) | -occurs(put(B2 ,B1),I) :- step(I), action(put(B1 ,L)),action(put(B2 ,B1)).

occurs(put(b2 ,t) ,0).
occurs(put(b4 ,b7) ,0).
