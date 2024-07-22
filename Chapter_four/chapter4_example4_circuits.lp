
wire(w0). 
wire(w1). 
wire(w2). 
wire(w3). 
wire(w4). 
wire(w5).
wire(w6).

gate(g0).
type(g0, not_gate).
input(g0, w0).
output(g0, w1).

gate(g1).
type(g1, and_gate).
input(g1, w1).
input(g1, w2).
input(g1, w3).
output(g1, w4).

gate(g2).
type(g2, or_gate).
input(g2, w4).
input(g2, w3).
output(g2, w5).

gate(g3).
type(g3, and_gate).
input(g3, w3).
input(g3,w5).
output(g3,w6).

signal(0).
signal(1).

val(w0 ,0).
val(w2 ,0).
val(w3 ,0).

% A NOT gate flips the value of the signal:

opposite(0, 1).
opposite(1, 0).

val(W1, V1) :- output(G, W1),
               type(G, not_gate),
               input(G, W0),
               val(W0, V0),
               opposite(V1, V0).

% The output of an AND gate is 0 if at least one input is 0:

val(W1, 0) :- output(G, W1),
              type(G, and_gate),
              input(G, W0),
              val(W0, 0).

% It is 1 otherwise:

val(W1, 1) :- output(G, W1),
              type(G, and_gate),
              -val(W1, 0).

% The output of an OR gate is 1 if at least one input is 1:

val(W1, 1) :- output(G, W1),
              type(G, or_gate),
              input(G, W0),
              val(W0, 1).

% It is 0 otherwise:

val(W1, 0) :- output(G, W1),
              type(G, or_gate),
              -val(W1, 1).

-val(W,V) :- wire(W), signal(V),not val(W,V).

-val(W,V1) :- signal(V1), val(W,V2), V1 != V2.
    

% sensor rules and defective gate detection
defective(G) :- output(G, Output_wire),
                sensor_val(Output_wire, SV),
                val(Output_wire, V),
                SV != V.

needs_replacing(G) :- defective(G).

% dangerous to replace rule
dangerous_to_replace(G) :- input(G, W),
                           not val(W, 0).
    
#show val/2.
