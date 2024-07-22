
person(john).
person(betty).
person(bob).
person(jim).
person(kate).
person(mary).

class(adult).
class(child).
class(student).

is_subclass(student, adult).

subclass(C1, C2) :- is_subclass(C1, C2).
subclass(C1, C2) :- is_subclass(C1, C3), subclass(C3, C2).

siblings(C1, C2) :- is_subclass(C1, C), is_subclass(C2, C), C1!= C2.

member(X, C) :- is_a(X, C).
member(X, C) :- is_a(X, C0), subclass(C0, C).   

-member(X, C2) :- member(X, C1), siblings(C1, C2), C1 != C2, not member(X, C2).
    
is_a(john, student).
is_a(betty, student).
is_a(bob, adult).
is_a(jim, adult).
is_a(kate, adult).
is_a(mary, child).

employed(X) :- member(X, adult),
    not ab(d(employed(X))),
    not -employed(X).
    
ab(d(employed(X))) :- person(X), not -member(X, student).

-employed(X) :- member(X, child).

-employed(bob).

-member(bob, student).
-member(jim, student).

#show member/2.
#show -member/2.
#show employed/1.
#show -employed/1.
