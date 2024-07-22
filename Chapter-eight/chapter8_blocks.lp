
block(b0). block(b1). block(b2). block(b3).
block(b4). block(b5). block(b6). block(b7).

location(X) :- block(X).
location(t).
#const n = 2.
step(0..n).

fluent(on(B,L)) :- block(B), location(L).

action(put(B,L)) :- block(B), location(L), B != L.

holds(on(b0 ,t) ,0).
holds(on(b3 ,b0) ,0).
holds(on(b2 ,b3) ,0).
holds(on(b1 ,t) ,0).
holds(on(b4 ,b1) ,0).
holds(on(b5 ,t) ,0).
holds(on(b6 ,b5) ,0).
holds(on(b7 ,b6) ,0).


-holds(on(B,L),0) :- block(B), location(L),
not holds(on(B,L) ,0).

holds(on(B,L),I+1) :- occurs(put(B,L),I),
I < n.

-holds(on(B,L2),I) :- holds(on(B,L1),I),
location(L2),
L1 != L2.

-holds(on(B2 ,B),I) :- block(B),
holds(on(B1 ,B),I),
block(B2),
B1 != B2.

occurs(put(b2 ,t) ,0).

queryone :- holds(on(b2, t), 1).
    
querytwo :- holds(on(b0, t), 1).
    
#show queryone/0.
#show querytwo/0.

holds(F,I+1) :- holds(F,I),
not -holds(F,I+1),
I < n.

-holds(F,I+1) :- -holds(F,I),
not holds(F,I+1),
I < n.

-occurs(put(B,L),I) :- location(L),
holds(on(B1 ,B),I).

-occurs(put(B1 ,B),I) :- block(B1),
block (B),
holds(on(B2 ,B),I).

occurs(put(b2 ,t) ,0).
occurs(put(b7 ,b2) ,1).

#show holds/3.
