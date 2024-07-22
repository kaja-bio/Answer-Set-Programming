
course(math).
course(graphs).

student(john).
student(mary).
student(bob).
student(rick).

took(john,math).
took(mary,graphs).
took(john, graphs).
-took(mary,math).
-took(bob,math).

took_all(X) :- student(X), took(X,math), took(X, graphs).
    
-took_all(X) :- student(X), course(C), -took(X,C).

can_graduate(X) :- student(X), took_all(X).

-can_graduate(X) :- student(X), -took_all(X).
    
may_graduate(X) :- student(X), not -took_all(X), not took_all(X).
    
review_records(X) :- student(X), course(C), may_graduate(X).

#show can_graduate/1.
#show -can_graduate/1.
#show review_records/1.
