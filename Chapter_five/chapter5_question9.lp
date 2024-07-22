
%%file chapter5_question9.lp

class(saxophone).
class(selmermark).
class(high_d_key).
class(spring).

is_subclass(has_key, saxophone).
is_subclass(has_spring, has_key).
is_subclass(selmermark, has_spring).

subclass(C1, C2) :- is_subclass(C1, C2).
subclass(C1, C2) :- is_subclass(C1, C3), subclass(C3, C2).

object(jakes).
object(marks).

is_a(jakes, selmermark).
is_a(marks, selmermark).

member(X, C) :- is_a(X, C).
member(X, C) :- is_a(X, C0), subclass(C0, C).

siblings(C1, C2) :- is_subclass(C1, C), is_subclass(C2, C), C1 != C2.
-member(X, C2) :- member(X, C1), siblings(C1, C2), C1 != C2, not member(X, C2).

-broken(X) :- member(X, has_spring), not ab(d(X)), not broken(X).

broken(marks).

#show broken/1.
#show -broken/1.
