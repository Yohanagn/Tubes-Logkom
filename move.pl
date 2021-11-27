/* File: move.pl */

/* Rules */
north :-
    player_position(_,Yp),
    northWall(_,Y),
    Yp is Y+1,
    write('You can\'t go through a wall!\n'), !.
north :-
    player_position(Xp,Yp),
    point(X,Y,water),
    Xp is X, Yp is Y+1,
    write('You can\'t go into the water!\n'), !.
north :-
    write('You moved north!\n'), 
    retract(player_position(Xp,Yp)), 
    Yp1 is Yp-1, 
    asserta(player_position(Xp,Yp1)),
    ganti_musim,
    ganti_cuaca,
    updateTime(2),
    special_loc(Xp,Yp1),
    fail_state, !.

south :-    
    player_position(_,Yp),
    southWall(_,Y),
    Yp is Y-1,
    write('You can\'t go through a wall!\n'), !.
south :-
    player_position(Xp,Yp),
    point(X,Y,water),
    Xp is X, Yp is Y-1,
    write('You can\'t go into the water!\n'), !.
south :-
    write('You moved south!\n'), 
    retract(player_position(Xp,Yp)), 
    Yp1 is Yp+1, 
    asserta(player_position(Xp,Yp1)),
    ganti_musim,
    ganti_cuaca,
    updateTime(2),
    special_loc(Xp,Yp1),
    fail_state, !.

west :-
    player_position(Xp,_),
    westWall(X,_),
    Xp is X+1,
    write('You can\'t go through a wall!\n'), !.
west :-
    player_position(Xp,Yp),
    point(X,Y,water),
    Xp is X+1, Yp is Y,
    write('You can\'t go into the water!\n'), !.
west :-
    write('You moved west!\n'), 
    retract(player_position(Xp,Yp)), 
    Xp1 is Xp-1, 
    asserta(player_position(Xp1,Yp)),
    ganti_musim,
    ganti_cuaca,
    updateTime(2),
    special_loc(Xp1,Yp), 
    fail_state, !.

east :-
    player_position(Xp,_),
    eastWall(X,_),
    Xp is X-1,
    write('You can\'t go through a wall!\n'), !.
east :-
    player_position(Xp,Yp),
    point(X,Y,water),
    Xp is X-1, Yp is Y,
    write('You can\'t go into the water!\n'), !.
east :-
    write('You moved east!\n'), 
    retract(player_position(Xp,Yp)), 
    Xp1 is Xp+1, 
    asserta(player_position(Xp1,Yp)),
    ganti_musim,
    ganti_cuaca,
    updateTime(2),
    special_loc(Xp1,Yp), 
    fail_state, !.

special_loc(X,Y) :-
    point(X,Y,market),
    write('You are in the marketplace. Type \'market\' to enter.\n'), !.
special_loc(X,Y) :-
    point(X,Y,house),
    write('You are at home. Type \'house\' to enter.\n'), !.
special_loc(X,Y) :-
    point(X,Y,quest),
    write('Do you want to take the quest? Type \'questStart\' to take it.\n'), !.
special_loc(X,Y) :-
    point(X,Y,ranch),
    write('You are in the ranch. Type \'ranch\' to enter.\n'), !.
special_loc(X,Y) :-
    point(X,Y,digged),
    write('You are in the farm. Type \'plant\' or \'harvest\' to do farming activity.\n'), !.
special_loc(X,Y) :-
    (point(X-1,Y-1,water); point(X,Y-1,water); point(X+1,Y-1,water); point(X-1,Y,water); point(X+1,Y,water); point(X-1,Y+1,water); point(X,Y+1,water); point(X+1,Y+1,water)),
    write('You are by the lakeside. Type \'fish\' for to do fishing activity.\n'), !.

/* Move Command */
w :-
    game_opened(_), game_started(_),
    north, !.
w :-
    \+ game_opened(_), \+ game_started(_), 
    write('You haven\'t started the game yet!\n'), !.

a :-
    game_opened(_), game_started(_),
    west, !.
a :-
    \+ game_opened(_), \+ game_started(_), 
    write('You haven\'t started the game yet!\n'), !.

s :-
    game_opened(_), game_started(_),
    south, !.
s :- 
    \+ game_opened(_), \+ game_started(_), 
    write('You haven\'t started the game yet!\n'), !. 

d :-
    game_opened(_), game_started(_),
    east, !.
d :-
    \+ game_opened(_), \+ game_started(_), 
    write('You haven\'t started the game yet!\n'), !.

updateTime(X) :- 
    game_time(H,D,M),
    TempH is (H + X),
    H1 is (TempH mod 24),
    TempD1 is (D + (TempH div 24)),
    TempD2 is (TempD1 mod 30),
    (TempD2 == 0 ->
        D1 is 30;
     D1 is TempD2),
    M1 is (M + (TempD1 div 30)), 
    retract(game_time(_,_,_)),
    asserta(game_time(H1,D1,M1)), !.

displayTime :-
    game_time(H,_,_),
    write(H), write(':00').

displayDate :-
    game_time(_,D,M),
    write(D), write('/'), write(M), write('/2021').