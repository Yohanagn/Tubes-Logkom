/* waktu_panen(nama_tanaman,durasi_panen) */
waktu_panen(carrot,12).
waktu_panen(potato,10).
waktu_panen(wheat,24).
waktu_panen(paddy,18).
waktu_panen(cassava,30).
waktu_panen(corn,20).

/* Dynamic variable */
/* tile_farming(x,y,tanaman,h,d,m) */
:- dynamic(tile_farming/6).


/* Deklarasi Rules */
add_exp_farming :-
    (player_job(farmer) ->
        write('You get 10 xp farming\n'),
        tambahExpperspecialty(farmer,10);
        write('You get 10 xp farming\n'),
        tambahExpperspecialty(farmer,5)
    ),
    !.

add_time(X,H,D,M) :-
    game_time(Ht,Dt,Mt),
    waktu_panen(X,Nt),
    generate_koef_farming(Koef),
    N is round(Nt/Koef),
    M is (Mt+((N+Ht) div 720)+(Dt div 30)) mod 12,
    D is (Dt+((N+Ht) div 24)) mod 30,
    H is (N+Ht) mod 24,
    !.

is_ready_harvest(H,D,M) :-
    game_time(Ht,Dt,Mt),
    T1 is Ht+Dt*24+Mt*720,
    T2 is H+D*24+M*720,
    T1>=T2.

generate_koef_farming(X) :-
    player_level(Level_overall),
    player_levelperspecialty(farmer,Level_farmer),
    (player_job(farmer) ->
        Y is 0.2;
        Y is 0.1
    ),
    (equipment(hoe,farming,Level_item) ->
        Z is Level_item/20;
        Z is 0
    ),
    X is (Level_overall/50)*0.5+(Level_farmer/50)*0.5+Y+1.


/* Command utama */

dig :-
    game_started(_),
    player_position(X,Y),
    point(X,Y,_),
    write('You cannot dig here\n'),
    !.

dig :-
    game_started(_),
    player_position(X,Y),
    \+ point(X,Y,_),
    !,
    asserta(point(X,Y,digged)),
    write('You digged the tile'),
    nl,
    !.

plant :-
    game_started(_),
    player_position(X,Y),
    \+ point(X,Y,digged),
    write('You can not plant here\n'),
    nl,
    !.

plant :-
    game_started(_),
    player_position(X,Y),
    point(X,Y,digged),
    \+ tile_farming(X,Y,_,_,_,_),
    displayInventorySeed,
    write('What do you want to plant?\n'),
    read(Seed),
    (seed(Seed) ->
        inventory_seed(Seed,Tot),
        retractall(inventory_seed(Seed,Tot)),
        NewTot is Tot-1,
        asserta(inventory_seed(Seed,NewTot)),
        delete_zero_inventory_seed,
        add_time(Seed,H,D,M),
        asserta(tile_farming(X,Y,Seed,H,D,M)),
        write('You planted a '),
        write(Seed),
        write(' seed\n');
        write('Seed is not valid\n')
    ),
    !.

harvest :-
    game_started(_),
    player_position(X,Y),
    \+ tile_farming(X,Y,_,_,_,_),
    write('There is no plant here\n'),
    !.

harvest :-
    game_started(_),
    tile_farming(_,_,_,H,D,M),
    \+ is_ready_harvest(H,D,M),
    write('Plant can not be harvested yet\n'),
    !.

harvest :-
    game_started(_),
    player_position(X,Y),
    point(X,Y,digged),
    tile_farming(X,Y,Seed,_,_,_),
    retractall(tile_farming(X,Y,Seed,_,_,_)),
    add_to_inventory(Seed),
    add_exp_farming,
    write('You harvested a '),
    write(Seed),
    nl,
    !.

    







