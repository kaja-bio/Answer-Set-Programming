person(john).
person(sam).
person(alice).
person(maxmillian).

gender(male).
gender(female).

father(john ,sam).
mother(alice ,sam).

gender_of(john , male).
gender_of(alice , female).
gender_of(sam ,male).
gender_of(maxmillian,male).

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

child(X,Y) :- parent(Y,X).
    
brother(X,Y) :- gender_of(X, male),
father(F,X),
father(F,Y),
mother(M,X),
mother(M,Y),
X != Y.

brother(john, maxmillian).

brothers(X,Y) :- gender_of(X, male),
gender_of(Y, male),
father(F,X),
father(F,Y),
mother(M,X),
mother(M,Y),
X != Y.

uncle(X,Y) :- gender_of(X, male),
brother(F, X),
father(F,Y),
X != Y.

%-father(X,Y) :- gender_of(X,female), person(Y).
    % if we removed this line along with the definition of not a father, how would this affect the queries ?father(alice, bill)? father(bill, sam) ? father(john, bob)

    
% If you took care to define the sorts of parameters of predicates, a rule with an unsafe variable X can be turned
% into a safe rule by adding the sort of X to the body.
    
%-father(X,Y) :- person(X),
%father(Z,Y),
%X != Z.

person(bob).

-father(X,Y) :- person(X), person(Y), not father(X,Y).
-mother(X,Y) :- person(X), person(Y), not mother(X,Y).
    
query_father_of(alice, bill) :- father(alice,bill).
query_father_of(bill,sam) :- father(bill,sam).
query_father_of(john,sam) :- father(john,sam).

#show uncle/2.
#show query_father_of/2.
