
%% blocks:
block(b0). block(b1). block(b2). block(b3).
block(b4). block(b5). block(b6). block(b7).

%% A location can be a block or the table.
location(X) :- block(X).
location(t).

%% "Block B is on location L" is a property that
%% changes with time.
fluent(on(B,L)) :- block(B), location(L).

%% "Put block B on location L" is a possible action
%% provided we don’t try to put a block onto itself.
action(put(B,L)) :- block(B), location(L), B != L.

% Define how actions affect the state
holds(on(B,L), I+1) :- occurs(put(B,L), I), I < n.

-holds(on(B,L2), I) :- holds(on(B,L1), I), location(L2), L1 != L2.

-holds(on(B2, B), I) :- block(B), holds(on(B1, B), I), block(B2), B1 != B2.

% Inertia axioms
holds(F, I+1) :- holds(F, I), not -holds(F, I+1), I < n.
-holds(F, I+1) :- -holds(F, I), not holds(F, I+1), I < n.

% Impossibility rules
-occurs(put(B,L), I) :- location(L), holds(on(B1, B), I).
-occurs(put(B1, B), I) :- block(B1), block(B), holds(on(B2, B), I).

% Define the fluent 'above'
fluent(above(B, L)) :- block(B), location(L).

holds(above(B, L), I) :- holds(on(B, L), I).
holds(above(B, L), I) :- holds(on(B, B1), I), holds(above(B1, L), I).

% Closed World Assumption (CWA)
-holds(above(B, L), I) :- block(B), location(L), step(I), not holds(above(B, L), I).

#const n=8.
step(0..n).

%% Initial conditions
holds(on(b0, t), 0).
holds(on(b3, b0), 0).
holds(on(b2, b3), 0).
holds(on(b1, t), 0).
holds(on(b4, b1), 0).
holds(on(b5, t), 0).
holds(on(b6, b5), 0).
holds(on(b7, b6), 0).

%% Goal state
goal(I) :- 
    holds(on(b4, t), I), 
    holds(on(b6, t), I),
    holds(on(b1, t), I), 
    holds(on(b3, b4), I),
    holds(on(b7, b3), I), 
    holds(on(b2, b6), I),
    holds(on(b0, b1), I), 
    holds(on(b5, b0), I).

% Show relevant information

#show occurs/2.
