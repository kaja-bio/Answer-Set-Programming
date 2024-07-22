
%%Domain Signature
clasp(1).
clasp(2).

fluent( inertial , up(C)) :- clasp(C).
fluent( defined , open).
action(toggle(C)) :- clasp(C).
#const n = 1.
step(0..n).

%% toggle(C) causes up(C) if -up(C)
holds(up(C),I+1) :- occurs(toggle(C),I),
-holds(up(C), I),
I < n.

%% toggle(C) causes -up(C) if up(C)
-holds(up(C),I+1) :- occurs(toggle(C),I),
holds(up(C),I),
I < n.

%% open if up(1), up(2).
holds(open ,I) :- holds(up(1),I),
holds(up(2),I).

%% CWA for Defined Fluents
-holds(F,I) :- fluent( defined ,F),
step(I),
not holds(F,I).


%% General Inertia Axiom
holds(F,I+1) :- fluent( inertial ,F),
holds(F,I),
not -holds(F,I+1),
I < n.
-holds(F,I+1) :- fluent (inertial ,F),
-holds(F,I),
not holds(F,I+1),
I < n.

%% CWA for actions
-occurs(A,I) :- action(A), step(I),
not occurs(A,I).

%% Initial Situation
-holds(up(1),0).
holds(up(2),0).
-holds(open ,0).
%% Action
occurs(toggle (1),0).
%% Display
#show holds/2.
#show -holds/2.
