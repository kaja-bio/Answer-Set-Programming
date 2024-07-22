
vertex(a).
vertex(b).
vertex(c).
vertex(d).
vertex(e).
vertex(f).

edge(a,b).
edge(a,c).
edge(c,d).
edge(e,f).

connected(X,Y) :- edge(X,Y), not blocked(X,Y).
connected(X,Y) :- edge(X,Z), not blocked(X,Z), edge(Z,Y), not blocked(Z,Y).
    
#show connected/2.
    
