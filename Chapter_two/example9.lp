
q(a).
p(a) :- not p(b).
p(b) :- not p(a).
-q(b) :- p(X), not r(X).
