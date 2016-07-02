:- use_module(library(random)).

jia_fa :-
    xuan_yi_ge(0, 5, Op1),
    xuan_yi_ge(0, 9, Op2),
    suan(Op1, Op2, +, 0, 3),
    jia_fa.

jian_fa :-
    xuan_yi_ge(0, 5, Op1),
    xuan_yi_ge(0, 9, Op2),
    suan(Op1, Op2, -, 0, 3),
    jian_fa.

cheng_fa :-
    xuan_yi_ge(0, 5, Op1),
    xuan_yi_ge(0, 9, Op2),
    suan(Op1, Op2, *, 0, 3),
    cheng_fa.

chu_fa :-
    xuan_yi_ge(0, 9, Op1),
    xuan_yi_ge(1, 9, Op2),
    suan(Op1, Op2, /, 0, 3),
    chu_fa.


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