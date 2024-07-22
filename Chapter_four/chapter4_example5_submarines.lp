
%Modify the existing vehicle hierarchy to add the new subclasses and
%member shown in Figure 4.6. Add some property of water vehicles to
%your program and make sure that the Narwhal inherits this property
%and Abby does not.


class(vehicle).
class(water).
class(air).
class(land).
class(ship).
class(truck).
class(car).
class(airplane).
class(sub).

is_subclass(water,vehicle).
is_subclass(land,vehicle).
is_subclass(air,vehicle).
is_subclass(car ,land).
is_subclass(truck, land).
is_subclass(airplane, air).
is_subclass(ship, water).
is_subclass(sub, water).

-subclass(C1 ,C2) :- class(C1),
class(C2),
not subclass(C1 ,C2).

subclass(C1, C2) :- is_subclass(C1, C2).
subclass(C1, C3) :- is_subclass(C1, C2), subclass(C2, C3).

object(narwhal).
object(abby).

is_a(narwhal ,sub).
is_a(abby, car).

member(X,C) :- is_a(X,C).
member(X,C) :- is_a(X,C0), subclass(C0 ,C).
    
object(mystery).
is_a(mystery , vehicle).

siblings(C1 ,C2) :- is_subclass(C1 ,C), is_subclass(C2 ,C), C1 != C2.
-member(X,C2) :- member(X,C1), siblings(C1 ,C2), C1 != C2.
    
color(black).
color(red).
color(white).

has_color(X, black) :- member(X,sub).

floats(X) :- member(X, water).
    
-has_color(X,C2) :- has_color(X,C1), color(C2), C1 != C2.
    
part_of( narwhal , us_navy).

class(machine).
is_subclass( vehicle , machine).

used_for_travel(X) :- member(X,vehicle).
    
-alive(X) :- member(X,machine).
    
#show floats/1.
