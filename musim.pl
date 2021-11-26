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

is_ubah_musim :-
    game_time(Hour,Day,Month),
    Hour is 0,
    Day is 1,
    1 is mod(Month,3),
    !.

is_ubah_cuaca :-
    game_time(Hour,_,_),
    0 is mod(Hour,12),
    !.


/* Command utama */

ganti_musim :- 
    \+ is_ubah_musim,!.

ganti_musim :-
    game_time(_,_,Month),
    Idx is Month div 3,
    retractall(musim(_)),
    !,
    (Idx == 0 ->
        X = spring;
    Idx == 1 ->
        X = summer;
    Idx == 2 ->
        X = autumn;
    Idx == 3 -> 
        X = winter
    ),
    asserta(musim(X)),
    write('Season changed into '),
    write(X),
    nl,
    !.

ganti_cuaca :-
    \+ is_ubah_cuaca,!.

ganti_cuaca :-
    random(0,6,Idx),
    retractall(cuaca(_)),
    !,
    (Idx == 0 ->
        X = sunny;
    Idx == 1 ->
        X = cloudy;
    Idx == 2 ->
        X = heavy_rain;
    Idx == 3 ->
        X = light_rain;
    Idx == 4 ->
        X = foggy;
    Idx == 5 ->
        X = thunder_storm
    ),
    asserta(cuaca(X)),
    write('Weather changed into '),
    write(X),
    nl,
    !.