
#maxint=1000.
sorts
#block=[b][0..7].
#location=#block+{t}.
#inertial_fluent=on(#block(X),#location(Y)):X!=Y.
#defined_fluent=above(#block(X),#location(Y)):X!=Y.
#fluent=#inertial_fluent + #defined_fluent.
#action=put(#block(X),#location(Y)):X!=Y.
#step=0..8.
predicates
holds(#fluent,#step).
occurs(#action,#step).

rules
%initial:
holds(on(b0,t),0).
holds(on(b3,b0),0).
holds(on(b2,b3),0).
holds(on(b1,t),0).
holds(on(b4,b1),0).
holds(on(b5,t),0).
holds(on(b6,b5),0).
holds(on(b7,b6),0).
%% If block B is not known to be on location L at step 0,
%% then we assume it is not.
-holds(on(B,L),0) :- not holds(on(B,L),0).
holds(on(B,L),I+1) :- occurs(put(B,L),I).
%rule1
-holds(on(B,L2),I) :- holds(on(B,L1),I),L1 != L2.
%% rule 2
%Another useful rule says that no block can support more than one block
%directly on top of it
-holds(on(B2,B),I) :- holds(on(B1,B),I),B1 != B2,#block(B).
%inertia axioms:

holds(F,I+1) :- #inertial_fluent(F), holds(F,I), not -holds(F,I+1).
 
-holds(F,I+1) :- #inertial_fluent(F), -holds(F,I), not holds(F,I+1). 
    
%%rule3 - defining blocks above other blocks

holds(above(B,L),I) :- holds(on(B,L),I).
holds(above(B,L),I) :- holds(on(B,B1),I), holds(above(B1 ,L),I).
-holds(above(B,L),I) :-  #defined_fluent(F), not holds(above(B,L),I).

%impossibility:
-occurs(put(B,L),I) :- holds(on(B1,B),I). %% rule 5a
-occurs(put(B1,B),I) :- holds(on(B2,B),I), #block(B). %% rule 5b

%some actions:
occurs(put(b2,t),0).
occurs(put(b7,b2),1).
    
goal(I) :-
holds(on(b4 ,t),I), holds(on(b6 ,t),I),
holds(on(b1 ,t),I), holds(on(b3 ,b4),I),
holds(on(b7 ,b3),I), holds(on(b2 ,b6),I),
holds(on(b0 ,b1),I), holds(on(b5 ,b0),I).
