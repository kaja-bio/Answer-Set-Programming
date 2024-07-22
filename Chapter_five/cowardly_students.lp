
student( dave). student( mary). student(bob).student(pat).
dept( english). dept(cs). dept(math).

in(dave , english).
in(mary ,cs).
in(bob ,cs).
in(pat ,math).

-in(S,D1) :- dept(D1),
in(S,D2),
D1 != D2.

afraid(S,math) :- student(S),
not ab(d(S)),
not -afraid(S,math).

-afraid(mary , math).
ab(d(mary)).

-afraid(S,math) :- in(S,math).
ab(d(S)) :- student(S),
not -in(S,math).

ab(d(S)) :- student(S),
not -in(S,cs).
