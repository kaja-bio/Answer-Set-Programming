p(a) :- not p(b), -p(c).
p(b) :- not p(a), -p(c).


p ; q ; r.
-p :- not s.

