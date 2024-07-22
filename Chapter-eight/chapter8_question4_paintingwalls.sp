
#maxint=1000.
sorts
#inertial_fluent={white_wall} + {yellow_wall} + {black_wall}.
#defined_fluent={has_white} + {has_black}.
#fluent=#inertial_fluent + #defined_fluent.
#action={paint_wall_white} + {paint_wall_black}.
#step=0..2.
predicates
holds(#fluent,#step).
occurs(#action,#step).

rules
%initial:
holds(yellow_wall,0).
holds(has_white,0).
holds(has_black,0).
%% 
-holds(has_white,0) :- not holds(has_white,0).
holds(has_white,I+1) :- holds(has_white,I).
-holds(has_black,0) :- not holds(has_black,0).
holds(has_black,I+1) :- holds(has_black,I).

%inertia axioms:

holds(F,I+1) :- #inertial_fluent(F), holds(F,I), not -holds(F,I+1).
 
-holds(F,I+1) :- #inertial_fluent(F), -holds(F,I), not holds(F,I+1). 
    
%%rule
    
holds(white_wall,I+1) :- holds(has_white, I), 
    occurs(paint_wall_white,I),
    I<n.
    
holds(black_wall,I+1) :- holds(has_black, I), 
    occurs(paint_wall_black,I),
    I<n.

%some actions:
occurs(paint_wall_white,0).
occurs(paint_wall_black,1).
    
%now outputs yes to query holds(white_wall, 1).
%could definitely be coded better next time where we have colours in some sort of set 
