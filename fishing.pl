/* Deklarasi Fakta */
ikan(goldfish).
ikan(catfish).
ikan(gurame).
ikan(tilapia).
ikan(parrotfish).

/* Deklarasi Rules */
is_water_nearby(X,Y) :-
    X1 is X+1,
    X2 is X-1,
    Y1 is Y+1,
    Y2 is Y-1,
    point(X,Y1,water);
    point(X,Y2,water);
    point(X1,Y,water);
    point(X2,Y,water).

can_do_fishing :-
    player_position(X,Y),
    is_water_nearby(X,Y)
    ,!.

generate_koef(X) :-
    player_level(Level_overall),
    player_levelperspecialty(fisherman,Level_fisherman),
    (player_job(fisherman) ->
    Y is 0.2
    ;
    Y is 0
    ),
    X is (Level_overall/50)*0.2+(Level_fisherman/50)*0.3+Y.

add_exp_fishing(N) :-
    player_totalexp(X),
    player_expperspecialty(fisherman,Y),
    X1 is X+N,
    Y1 is Y+N,
    retractall(player_totalexp(X)),
    retractall(player_expperspecialty(fisherman,Y)),
    asserta(player_totalexp(X1)),
    asserta(player_expperspecialty(fisherman,Y1)),
    !.

get_fish(N,X) :-
    (N == 0 ->
        X = goldfish;
    N == 1 ->
        X = catfish;
    N == 2 ->
        X = gurame;
    N == 3 ->
        X = tilapia;
    N == 4 ->
        X = parrotfish
    ),
    !.

/* Command utama */

fish :-
    can_do_fishing,
    generate_koef(Koef),
    Max_rand is round(Koef*40),
    random(0,Max_rand,Random_val),
    (Random_val<5 ->
    get_fish(Random_val,X),
    add_to_inventory(X),
    write('You got '),
    write(X),
    nl,
    Exp is 10,
    add_exp_fishing(Exp),
    write('You get 10 xp overall and fishing'),
    nl
    ;
    write('You did not get anything'),
    nl,
    Exp is 5,
    add_exp_fishing(Exp),
    write('You get 5 xp overall and fishing'),
    nl
    ).

    