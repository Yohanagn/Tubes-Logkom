/* Deklarasi Fakta */
ikan(mas).
ikan(lele).
ikan(gurame).
ikan(mujair).
ikan(nila).

list_ikan([mas,lele,gurame,mujair,nila]).

/* Deklarasi Rules */
is_water_nearby(X1,X2,Y1,Y2) :-
    point(X1,Y1,water);
    point(X1,Y2,water);
    point(X2,Y1,water);
    point(X2,Y2,water).

can_do_fishing :-
    X1 is X+1,
    X2 is X-1,
    Y1 is Y+1,
    Y2 is Y-1,
    is_water_nearby(X1,X2,Y1,Y2).

add_to_inventory(X) :-
    (inventory(X,Y) ->
    Y1 is Y+1,
    retractall(inventory(X,Y)),
    asserta(inventory(X,Y1));
    asserta(inventory(X,1))
    ).

get_list(X) :-
    list_ikan(L),
    member(X,L).

get_index_val(0,[H|_],X) :- X is H.
get_index_val(Idx,[_|T],X):
    Idx1 is Idx-1,
    get_index_val(Idx1,T,X).

generate_koef(X) :-
    player_level(Level_overall),
    player_level(fisherman,Level_fisherman),
    (player_job(fisherman) ->
    Y is 0.2
    ;
    Y is 0
    ),
    X is (Level_overall/50)*0.2+(Level_fisherman/50)*0.3+Y.

/* Command utama */

fish :-
    can_do_fishing,
    get_list(L),
    generate_koef(Koef),
    Max_rand is (Koef*40)//1,
    random(0,Max_rand,Random_val),
    (Random_val<5 ->
    get_index_val(Random_val,L,X),
    add_to_inventory(X),
    write('You got '),
    write(X),
    nl,
    write('You get 10 xp overall and fishing'),
    nl
    ;
    write("You didn't get anything"),
    nl,
    write('You get 5 xp overall and fishing'),
    nl
    ).

    