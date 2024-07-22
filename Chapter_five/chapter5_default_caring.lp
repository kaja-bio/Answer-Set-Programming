
person(john).
person(sam).
person(alice).

father(john ,sam).
mother(alice ,sam).

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

child(X,Y) :- parent(Y,X).
    
-cares(john ,X) :- child(X,john).
    
% default rule
cares(X,Y) :- parent(X,Y),
ab(d_cares(X,Y)),
cares(X,Y).

ab(d_cares(P,C)) :- person(P), person(C), not -absent(P).
    
-cares(P,X) :- parent(P,X), born_in(P,u).
    
ab(d_cares(P,X)) :- person (P), person(X), -born_in(P,u).
    
person(pit).
person(kathy).
person(jim).
father(pit ,jim).
mother(kathy ,jim).
country(moldova).
country(u).
born_in(kathy , moldova).
%% A person can only be born in one country
-born_in(P,X) :- country(X),born_in(P, Y), X != Y.
-absent(pit).
-absent(kathy).

#show cares/2.
