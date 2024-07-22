

% Rules with variables
object(a).
object(b).

p(a) | -p(b) :- object(a), object(b).
q(X) :- -p(X), object(X).
-q(X) :- not q(X), object(X).
r(X) :- not p(X), object(X).
