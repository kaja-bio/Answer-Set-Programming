
person(john).
person(miriam).
person(caleb).

country(us).
country(italy).

citizen(john, us).
citizen(miriam, us).
citizen(caleb, us).

diplomat(miriam, us).

lives(X, C) :- citizen(X, C),
    not -lives(X, C),
    not ab(d(lives(X,C))).
    
-lives(X,C) :- country(C), lives(X, C1), C != C1.

ab(d(lives(X,C))) :- person(X), country(C), not -diplomat(X,C).

lives(john, italy).

#show lives/2.

%part b - which gives us the result that caleb lives in US.

-diplomat(X,C) :- person(X), country(C), not diplomat(X,C).
    
%part c - would be reqwritten using:

ab(d(lives(X,C))) :- person(X), country(C), diplomat(X,C).
