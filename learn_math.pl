:- use_module(library(random)).

jia_fa :-
    random(0, 5, Op1),
    random(0, 5, Op2),
    jia_fa0(Op1, Op2, 0, 3),
    jia_fa.

jia_fa0(Op1, Op2, X, X) :- !,
    Result is Op1 + Op2,
    format('~w + ~w = ~w~n', [Op1,Op2,Result]).
jia_fa0(Op1, Op2, _, _) :-
    format('~w + ~w = ', [Op1,Op2]),
    read_string(current_input, "\n", "\r\t ", _, String),
    number_string(Result, String),
    Result is Op1 + Op2, !.
jia_fa0(Op1, Op2, C, Threshold) :-
    C1 is C + 1,
    jia_fa0(Op1, Op2, C1, Threshold).
