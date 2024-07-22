
class(flying_objects).
class(jets).
class(birds).
class(robins).
class(eagles).

is_subclass(jets ,flying_objects).
is_subclass(birds ,flying_objects).
is_subclass(robins ,birds).
is_subclass(eagles ,birds).

subclass(C1 ,C2) :- is_subclass(C1 ,C2).
subclass(C1 ,C2) :- is_subclass(C1 ,C3), subclass(C3 ,C2).

-subclass(C1 ,C2) :- class(C1),
class(C2),
not subclass(C1 ,C2).

-subclass(C1 ,C2) :- class(C1),
class(C2),
not subclass(C1 ,C2).

object(jo).
object(sr71backbird).

is_a(jo,robins).
is_a(sr71blackbird,jets).

member(X,C) :- is_a(X,C).
member(X,C) :- is_a(X,C0), subclass(C0 ,C).

siblings(C1 ,C2) :- is_subclass(C1 ,C),
is_subclass(C2 ,C),
C1 != C2.
-member(X,C2) :- member(X,C1),
siblings(C1 ,C2),
C1 != C2.

faster_than(jets, birds).
faster_than(eagles, robins).

faster_than(X, Y) :- member(X, C1), member(Y, C2), faster_than(C1, C2).

faster_than(X, Z) :- faster_than(X, Y), faster_than(Y, Z).
    
#show faster_than/2.
