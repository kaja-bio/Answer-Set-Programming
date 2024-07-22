
class(animal).
class(bird).
class(eagle).
class(penguin).
class(cat).

object(sam).
object(tweety).
object(tabby).
object(squeaky).

is_subclass(eagle, bird).
is_subclass(penguin, bird).
is_subclass(bird, animal).
is_subclass(cat, animal).

subclass(C1, C2) :- is_subclass(C1, C2).
subclass(C1, C2) :- is_subclass(C1, C3), subclass(C3, C2).

is_a(sam, eagle).
is_a(tweety, penguin).
is_a(tabby, cat).
is_a(squeaky,bird).

member(X, C) :- is_a(X, C).
member(X, C) :- is_a(X, C0), subclass(C0, C).

siblings(C1, C2) :- is_subclass(C1, C), is_subclass(C2, C), C1 != C2.
-member(X, C2) :- member(X, C1), siblings(C1, C2), C1 != C2, not member(X, C2).

%% Animals normally do not fly.
-fly(X) :- member(X,animal),
not ab(d1(X)),
not fly(X).

%% Birds normally fly.
fly(X) :- member(X,bird),
not ab(d2(X)),
not -fly(X).

%% Penguins normally do not fly.
-fly(X) :- member(X,penguin),
not ab(d3(X)),
not fly(X).

%% X is abnormal w.r.t d2 if X might be a penguin.
ab(d2(X)) :- member(X,penguin).

%% X is abnormal w.r.t d1 if X might be a bird.
ab(d1(X)) :- member(X,bird).
    
#show fly/1.
#show -fly/1.
