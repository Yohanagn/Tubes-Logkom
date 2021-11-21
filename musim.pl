:- include('player.pl').


/* Deklarasi fakta */
jenis_musim(spring).
jenis_musim(summer).
jenis_musim(autumn).
jenis_musim(winter).

jenis_cuaca(cerah).
jenis_cuaca(berawan).
jenis_cuaca(hujan).

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
    time(Hour,Day,Month),
    Hour is 0,
    Day is 0,
    Month mod 3 is 0.

get_list_cuaca(X) :-
    jenis_cuaca(L),
    member(X,L).



/* Command utama */

ganti_musim :-
    is_ubah_musim,
    get_list_musim(L),
    time(_,_,Month),
    Idx is Month//3,
    get_idx_list_musim(Idx,L,X),
    retractall(musim(_)),
    asserta(musim(X)),
    !.

ganti_cuaca :-
    get_list_cuaca(L),
    random(0,2,Idx),
    get_idx_val(Idx,L,X),
    retractall(cuaca(_)),
    asserta(cuaca(X)),
    !.