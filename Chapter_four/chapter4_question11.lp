
class(organism).
class(animal).
class(dog).
class(cat).

object(spot).
object(poppy).

is_subclass(animal, organism).
is_subclass(dog, animal).
is_subclass(cat, animal).

is_a(spot, dog).
is_a(poppy, cat).
is_a(poppy, dog).

subclass(C1 ,C2) :- is_subclass(C1 ,C2).
subclass(C1 ,C2) :- is_subclass(C1 ,C3), subclass(C3 ,C2).
    
-leaf_class(X) :- class(X), class(C), subclass(C, X).
leaf_class(X) :- class(X), not -leaf_class(X).
    
member(X,C) :- is_a(X, C), object(X), class(C), leaf_class(C).
-not_member(X, C) :- object(X), class(C), not member(X, C).
    
siblings(C1 ,C2) :- is_subclass(C1 ,C), is_subclass(C2 ,C), C1 != C2.
-member(X,C2) :- member(X,C1), siblings(C1 ,C2), C1 != C2.
    
#show leaf_class/1.
#show member/2.
