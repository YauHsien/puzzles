color(blue). color(green). color(red). color(white). color(yellow).

nationality(brit). nationality(dane). nationality(german). nationality(norwegian). nationality(swede).

drink(beer). drink(coffee). drink(milk). drink(tea). drink(water).

cigarette(blends). cigarette(blue_master). cigarette(dunhill). cigarette(pall_mall). cigarette(prince).

pet(birds). pet(cats). pet(dogs). pet(horses). pet(fish).

%% Color, Nationality, Drink, Cigarette, Pet...
solution(Result) :-
    Result = [
        [A, norwegian, C, D, E],
        [blue, G, H, I, J],
        [K, L, milk, N, O],
        [P, Q, R, S, T],
        [U, V, W, X, Y]
    ],
    color(A), blue \= A,
    color(K), blue \= K, A \= K,
    color(P), blue \= P, A \= P, K \= P,
    color(U), blue \= U, A \= U, K \= U, P \= U,
    nationality(G), norwegian \= G,
    nationality(L), norwegian \= L, G \= L,
    nationality(Q), norwegian \= Q, G \= Q, G \= L,
    nationality(V), norwegian \= V, G \= V, L \= V, Q \= V,
    drink(C), milk \= C,
    drink(H), milk \= H, C \= H,
    drink(R), milk \= R, C \= R, H \= R,
    drink(W), milk \= W, C \= W, H \= W, R \= W,
    cigarette(D),
    cigarette(I), D \= I,
    cigarette(N), D \= N, I \= N,
    cigarette(S), D \= S, I \= S, N \= S,
    cigarette(X), D \= X, I \= X, N \= X, S \= X,
    pet(E),
    pet(J), E \= J,
    pet(O), E \= O, J \= O,
    pet(T), E \= T, J \= T, O \= T,
    pet(Y), E \= Y, J \= Y, O \= Y, T \= Y,
    with([red,brit,_,_,_], Result),
    with([_,swede,_,_,dogs], Result),
    with([_,dane,tea,_,_], Result),
    with([[green,_,coffee,_,_],
          [white,_,_,_,_]], Result),
    with([_,_,_,pall_mall,birds], Result),
    ( with([[_,_,_,blends,_],
            [_,_,_,_,cats]], Result)
    ; with([[_,_,_,_,cats],
            [_,_,_,blends,_]], Result)
    ),
    ( with([[_,_,_,dunhill,_],
            [_,_,_,_,horses]], Result)
    ; with([[_,_,_,_,horses],
            [_,_,_,dunhill,_]], Result)
    ),
    with([_,german,_,prince,_], Result),
    ( with([[_,_,_,blends,_],
            [_,_,water,_,_]], Result)
    ; with([[_,_,water,_,_],
            [_,_,_,blends,_]], Result)
    ).

% Match all the set.
with([A,B], [A,B]) :- !.
with([A,B], [_|L]) :-
    with([A,B], L).
% Match a single record.
with([A,B,C,D,E], Set) :-
    member([A,B,C,D,E], Set).
