
success :- goal(I),
I <= n.
:- not success.
    
1{occurs(A,I): action(A)}1 :- step(I),
    not goal (I),
    I < n.   
