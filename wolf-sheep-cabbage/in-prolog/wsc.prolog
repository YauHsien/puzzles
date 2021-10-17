%% Wof, sheep, and cabbage problem
%  and Graph theory
%  ------------------------------

next(wc, wsc).
next(w, wc).
next(c, wc).
next(ws, w).
next(sc, c).
next(s, ws).
next(s, sc).
next(wsc, s).

%  ?- consult('wolf-sheep-cabbage/in-prolog/wsc.prolog').
%: true.
%
%  ?- solve(wsc,R).
%: wsc -> s
%: s -> ws
%: ws -> w
%: w -> wc
%: R = wsc ;
%: s -> sc
%: sc -> c
%: c -> wc
%: R = wsc.
%
solve(wsc, Result) :-
    solve(wsc, wsc, Result).

solve(Src, Via, Result) :-
    next(Via, R1),
    (
        Src == R1,
        !,
        Result = R1;

        format("~p -> ~p~n", [Via, R1]),
        solve(Src, R1, Result)
    ).
