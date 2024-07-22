
#maxint=1000.
sorts
#object = {cellphone,chihuaha, towel}.
#person = {claire, rod}.
#location = {home, library}.
#fluent=at(#object, #location) + carried(#object, #person) + at(#person, #location).
#action=go(#person, #location).
#step=0..2.
predicates
holds(#fluent,#step).
occurs(#action,#step).
    
rules
%initial:
holds(at(claire, library),0).
holds(carried(cellphone, claire),0).
holds(carried(towel, rod),0).
    
%inertia axioms:

holds(F,I+1) :- #fluent(F), holds(F,I), not -holds(F,I+1).
 
-holds(F,I+1) :- #fluent(F), -holds(F,I), not holds(F,I+1). 
       
%moving locations causes person to be at new location
       
holds(at(P, L), I+1) :- occurs(go(P, L), I), I < n.
    
-holds(at(P,L), I) :- holds(at(P,L2), I), 
    L != L2.
    
-holds(at(claire, L),I) :- holds(at(rod, L), I).

-holds(at(rod, L),I) :- holds(at(claire, L), I).

holds(at(O, L), I) :- holds(carried(O, P), I), holds(at(P, L), I), I < n.
    
-holds(at(O, L), I) :- not holds(at(O, L), I), I < n.
       
%what happens:   
occurs(go(claire, home),1).
