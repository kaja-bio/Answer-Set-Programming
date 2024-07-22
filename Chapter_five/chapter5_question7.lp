
course(math).
course(graphs).

student(john).
student(mary).

took(john,math).
took(mary,graphs).
took(john, graphs).

can_graduate(X) :- student(X), not -can_graduate(X).
    
-can_graduate(X) :- student(X), course(C), not took(X, C).

#show can_graduate/1.
#show -can_graduate/1.
