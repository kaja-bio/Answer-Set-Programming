% instance
object(a).
object(b).
-s(a).
% encoding
p(X) :- not q(X), - s(X), object(X).
q(X) :- not p(X), object(X).
r(X) :- p(X), object(X).
r(X) :- q(X), object(X).
    ?r(a)
