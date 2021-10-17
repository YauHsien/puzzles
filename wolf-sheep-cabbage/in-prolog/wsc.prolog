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
