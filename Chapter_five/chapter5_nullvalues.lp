
prof(mike). prof(john).
course(pascal). course(c). course(prolog).

teaches(mike , pascal).
teaches(john ,c).
teaches(staff , prolog).

-teaches(P,C) :- prof (P), course (C), not ab(d(P,C)),
not teaches(P,C).
ab(d(P,C)) :- prof(P), teaches(staff ,C).
    
teaches(mike , prolog) | teaches(john , prolog).
    
#show teaches(mike, prolog).
