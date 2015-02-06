object(sheep).
object(dog).
object(cabbage).
object(peasant).

objects(List) :- bagof(X, object(X), List).

safe(List) :- member(peasant, List), !.
safe(List) :- member(sheep, List), member(dog, List), !, fail.
safe(List) :- member(sheep, List), member(cabbage, List), !, fail.
safe(_).

move(List, List1) :-
    move(List, [], [], List1).

move([[],_], _, Acc, List) :- !,
    list:reverse(Acc, List).
move([List,List1], History, Acc, List3) :- member(peasant, List), !,
    safe_to_leave(peasant, X, List, List4),
    Stage = [List4,[peasant,X|List1]],
    not(member(Stage, History)),
    move(Stage, [Stage|History], [[peasant,X]|Acc], List3).
move([List,List1], History, Acc, List3) :- member(peasant, List1),
    safe_to_leave(peasant, List1, List4),
    Stage = [[peasant|List],List4],
    not(member(Stage, History)),
    move(Stage, [Stage|History], [[peasant]|Acc], List3).
move([List,List1], History, Acc, List3) :- member(peasant, List1),
    safe_to_leave(peasant, X, List1, List4),
    Stage = [[peasant,X|List],List4],
    not(member(Stage, History)),
    move(Stage, [Stage|History], [[peasant,X]|Acc], List3).

safe_to_leave(peasant, List, List1) :-
    bagof(Z, (member(Z,List), Z \= peasant), List1),
    safe(List1).

safe_to_leave(peasant, X, [peasant,X], []) :- !.
safe_to_leave(peasant, X, [X,peasant], []) :- !.
safe_to_leave(peasant, X, List, List1) :-
    member(X,List), X \= peasant,
    bagof(Z, (member(Z,List), Z \= peasant, Z \= X), List1),
    safe(List1).

question :-
    objects(List),
    move([List,[]], Answer),
    format('~p~n', [Answer]).
