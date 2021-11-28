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

generate_koef(Factor_level,X) :-
    player_level(Level_overall),
    player_levelperspecialty(fisherman,Level_fisherman),
    (player_job(fisherman) ->
        Y is 0.3;
        Y is 0.1
    ),
    X is (Level_overall/50)*0.5+(Level_fisherman/50)*0.5+Y+Factor_level.

add_exp_fishing(N) :-
    (player_job(fisherman) ->
        write('You get '),
        write(N),
        write(' xp fishing\n'),
        tambahExpperspecialty(fisherman,N);
        N1 is N div 2,
        write('You get '),
        write(N1),
        write(' xp fishing\n'),
        tambahExpperspecialty(fisherman,N1)
    ),
    !.

display_fishing_equipment :-
    forall(equipment(X,fishing,Y),(write('Level '),write(Y),write(' '),write(X),nl)),
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
    game_started(_),
    \+ can_do_fishing,
    write('You can not fishing here\n'),
    !.

fish :-
    game_started(_),
    can_do_fishing,
    display_fishing_equipment,
    write('What equipment do you want to use : '),
    read(Equipment),
    (equipment(Equipment,fishing,Level_equipment) ->
        Factor_level is Level_equipment/20;
        Factor_level is 0,
        write('Because such item does not exist, so you use your hand\n')
    ),
    generate_koef(Factor_level,Koef),
    Max_rand is round(6/Koef),
    random(0,Max_rand,Random_val),
    (Random_val<5 ->
        get_fish(Random_val,X),
        add_to_inventory(X),
        write('You got '),
        write(X),
        nl,
        Exp is 20,
        add_exp_fishing(Exp);
        write('You did not get anything\n'),
        Exp is 10,
        add_exp_fishing(Exp)
    ).

    