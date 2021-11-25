/* Deklarasi fakta */
jenis_musim(spring).
jenis_musim(summer).
jenis_musim(autumn).
jenis_musim(winter).

jenis_cuaca(sunny).
jenis_cuaca(cloudy).
jenis_cuaca(heavy_rain).
jenis_cuaca(light_rain).
jenis_cuaca(foggy).
jenis_cuaca(thunder_storm).

/* Deklarasi rules */

get_idx_val(0,[H|_],X) :-
    X is H.

get_idx_val(Idx,[_|T],X) :-
    Idx1 is Idx-1,
    get_idx_val(Idx1,T,X).


get_list_musim(X) :-
    jenis_musim(L),
    member(X,L).

is_ubah_musim :-
    game_time(Hour,Day,Month),
    Hour is 0,
    Day is 0,
    Month mod 3 is 0,
    \+ Month is 12.

is_ubah_cuaca :-
    game_time(Hour,_,_),
    Hour mod 12 is 0.

get_list_cuaca(X) :-
    jenis_cuaca(L),
    member(X,L).



/* Command utama */

ganti_musim :-
    is_ubah_musim,
    get_list_musim(L),
    game_time(_,_,Month),
    Idx is Month//3,
    get_idx_list_musim(Idx,L,X),
    retractall(musim(_)),
    !,
    asserta(musim(X)),
    write('Musim berganti menjadi '),
    write(X),
    nl,
    !.

ganti_cuaca :-
    is_ubah_cuaca,
    get_list_cuaca(L),
    random(0,6,Idx),
    get_idx_val(Idx,L,X),
    retractall(cuaca(_)),
    !,
    asserta(cuaca(X)),
    write('Cuaca berganti menjadi '),
    write(X),
    nl,
    !.