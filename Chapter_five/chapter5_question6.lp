
%%file chapter5_question6.lp

% Define classes
class(car).
class(pickup).
class(extended_cab).


is_subclass(pickup, car).
is_subclass(extended_cab, pickup).

object(a).
object(b).
object(c).


is_a(a, car).
is_a(b, pickup).
is_a(c, extended_cab).

subclass(C1, C2) :- is_subclass(C1, C2).
subclass(C1, C2) :- is_subclass(C1, C3), subclass(C3, C2).

member(X, C) :- is_a(X, C).
member(X, C) :- is_a(X, C0), subclass(C0, C).

siblings(C1, C2) :- is_subclass(C1, C), is_subclass(C2, C), C1 != C2.
-member(X, C2) :- member(X, C1), siblings(C1, C2), C1 != C2, not member(X, C2).

    
four_seats(X) :- member(X, car), not ab(d1(X)), not -four_seats(X).
two_seats(X) :- member(X, pickup), not ab(d2(X)), not -two_seats(X).
four_seats(X) :- member(X, extended_cab), not ab(d3(X)), not -four_seats(X).

ab(d1(X)) :- member(X, pickup), not member(X, extended_cab).
ab(d2(X)) :- member(X, extended_cab).
ab(d3(X)) :- member(X, pickup), not member(X, extended_cab).

#show four_seats/1.
#show two_seats/1.
