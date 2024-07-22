
person(susan).
person(john).
person(bob).
person(mary).

married_to(X,Y) :- married_to(Y,X).
married_to(susan, john).
married_to(bob, mary).

likes(X,Y) :- married_to(X,Y),
    not ab(X,Y),
    not -likes(X,Y).

-married_to(X,Y) :- person(X), person(Y), not married_to(X,Y).

ab(X,Y) :- person(X), person(Y), not -married_to(X,Y), not married_to(X,Y).

-likes(bob, mary).

#show likes/2.
#show -likes/2.

person(arnold).
person(kate).
married_to(arnold, kate).
ab(kate, arnold).
