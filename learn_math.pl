:- use_module(library(random)).

jia_fa :-
    math(+).

jia_fa(Count) :-
    generate(0, Count, +).

jian_fa :-
    math(-).

jian_fa(Count) :-
    generate(0, Count, -).

cheng_fa :-
    math(*).

cheng_fa(Count) :-
    generate(0, Count, *).

chu_fa :-
    xuan_yi_ge(0, 9, Op1),
    xuan_yi_ge(1, 9, Op2),
    suan(Op1, Op2, /, 0, 3),
    chu_fa.

math(Operator) :-
    xuan_yi_ge(0, 9, Op1),
    xuan_yi_ge(0, 9, Op2),
    suan(Op1, Op2, +, 0, 3),
    math(Operator).

generate(X, X, _) :- !.
generate(X, Count, Operator) :-
    xuan_yi_ge(0, 9, Op1),
    xuan_yi_ge(0, 9, Op2),
    format('ella? ~w ~w ~w = ~n', [Op1,Operator,Op2]),
    Y is X + 1,
    generate(Y, Count, Operator).

suan(Op1, Op2, Operator, X, X) :- !,
    suan0(Operator, Op1, Op2, Result),
    who(Who),
    format('~w: ~w ~w ~w = ~w~n', [Who,Op1,Operator,Op2,Result]).
suan(Op1, Op2, Operator, _, _) :-
    format('ella? ~w ~w ~w = ', [Op1,Operator,Op2]),
    read_string(current_input, "\n", "\r\t ", _, String),
    number_string(Result, String),
    suan0(Operator, Op1, Op2, Result), !.
suan(Op1, Op2, Operator, C, Threshold) :-
    C1 is C + 1,
    suan(Op1, Op2, Operator, C1, Threshold).

xuan_yi_ge(X, Y, R) :-
    Y1 is Y + 1,
    random(X, Y1, R).

who(Who) :-
    People = [mamma,pappa,lillabror],
    random(0, 3, R),
    nth0(R, People, Who).

suan0(+, Op1, Op2, Result) :-
    Result is Op1 + Op2.

suan0(-, Op1, Op2, Result) :-
    Result is Op1 - Op2.

suan0(*, Op1, Op2, Result) :-
    Result is Op1 * Op2.

suan0(/, Op1, Op2, Result) :-
    Result is Op1 / Op2.
