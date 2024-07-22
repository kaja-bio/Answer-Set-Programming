
class(lions).
class(babylions).

is_subclass(babylions, lions).

subclass(C1, C2) :- is_subclass(C1, C2).
subclass(C1, C2) :- is_subclass(C1, C3), subclass(C3, C2).

member(X, C) :- is_a(X, C).
member(X, C) :- is_a(X, C0), subclass(C0, C).   
    
is_a(apollo, lions).
is_a(helios, babylions).
is_a(new_baby, babylions).

dangerous(X) :- member(X, lions),
    not ab(d1(X)),
    not -dangerous(X).

-dangerous(X) :- member(X, babylions),
    not ab(d2(X)),
    not dangerous(X).
ab(d1(X)) :- not -member(X, lions).
ab(d2(X)) :- not -member(X, babylions).

#show dangerous/1
#show -dangerous/1
