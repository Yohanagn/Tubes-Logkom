/* Deklarasi fakta */
/* Jenis tanaman : wortel, kentang, gandum,padi, singkong, jagung */

/* waktu_panen(nama_tanaman,durasi_panen) */
waktu_panen(carrot,72).
waktu_panen(potato,72).
waktu_panen(wheat,96).
waktu_panen(paddy,96).
waktu_panen(cassava,120).
waktu_panen(corn,120).

/* Dynamic variable */
/* tile_farming(x,y,tanaman,waktu_panen) */
:- dynamic(tile_farming/4).


/* Deklarasi Rules */
add_exp_farming :-
    player_totalexp(X),
    player_expperspecialty(farmer,Y),
    (player_job(farmer) ->
    X1 is X+10,
    Y1 is Y+10,
    retractall(player_totalexp(X)),
    retractall(player_expperspecialty(farmer,Y)),
    asserta(player_totalexp(X1)),
    asserta(player_expperspecialty(farmer,Y1))
    ;
    X1 is X+5,
    Y1 is Y+5,
    retractall(player_totalexp(X)),
    retractall(player_expperspecialty(farmer,Y)),
    asserta(player_totalexp(X1)),
    asserta(player_expperspecialty(farmer,Y1))
    ),
    !.

/* Command utama */

dig :-
    player_position(X,Y),
    X1 is X, Y1 is Y,
    retractall(point(X1,Y1,_)),
    !,
    asserta(point(X1,Y1,digged)),
    write('You digged the tile'),
    nl,
    !.

plant :-
    player_position(X,Y),
    point(X,Y,digged_tile),
    \+ tile_farming(X,Y,_,_),
    displayInventory,
    write('What do you want to plant?\n'),
    readln(Seed),
    retractall(inventory(Seed,Tot)),
    !,
    NewTot is Tot-1,
    asserta(Seed,NewTot),
    delete_zero_inventory,
    !,
    waktu_panen(Seed,Durasi_panen),
    Waktu_panen is Durasi_panen+current_time,
    asserta(tile_farming(X,Y,Seed,Waktu_panen)),
    write('You planted a '),
    write(Seed),
    write(' seed'),
    nl,
    !.

harvest :-
    player_position(X,Y),
    point(X,Y,digged),
    tile_farming(X,Y,Jenis,Waktu),
    (Waktu >= current_time ->
    retractall(tile_farming(X,Y,Jenis,Waktu)),
    add_to_inventory(Jenis),
    add_exp_farming,
    write('You harvested a'),
    write(Jenis),
    nl
    ;
    write('Tanaman belum siap panen\n')
    ),
    !.

    







