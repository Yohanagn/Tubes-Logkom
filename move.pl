/* Rules */
north :-
    player_position(_,Yp),
    edge_north(_,Y),
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
    updateTime(1),
    special_loc(Xp,Yp1), !.

south :-    
    player_position(_,Yp),
    edge_south(_,Y),
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
    updateTime(1),
    special_loc(Xp,Yp1), !.

west :-
    player_position(Xp,_),
    edge_west(X,_),
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
    updateTime(1),
    special_loc(Xp1,Yp), !.

east :-
    player_position(Xp,_),
    edge_west(X,_),
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
    updateTime(1),
    special_loc(Xp1,Yp), !.

special_loc(X,Y) :-
    point(X,Y,market),
    write('You are in the marketplace. Type \'market\' to enter.\n'), !.
special_loc(X,Y) :-
    point(X,Y,house),
    write('You are at home. Type \'house\' to enter.\n'), !.
special_loc(X,Y) :-
    point(X,Y,quest),
    write('Do you want to take the quest? Type \'quest\' to take it.\n'), !.
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
    game_opened(_),
    game_started(_),
    north, !.
w :- write('You haven\'t started the game yet!\n'), !.

a :-
    game_opened(_),
    game_started(_),
    west, !.
a :- write('You haven\'t started the game yet!\n'), !.

s :-
    game_opened(_),
    game_started(_),
    south, !.
s :- write('You haven\'t started the game yet!\n'), !. 

d :-
    game_opened(_),
    game_started(_),
    east, !.
d :-
    write('You haven\'t started the game yet!\n'), !.

updateTime(x) :- 
    retract(game_time(H,D,M)),
    TempH is (H + x),
    H1 is (TempH mod 24),
    TempD is (D + (TempH div 24)),
    D1 is (TempD mod 30),
    M1 is (M + (TempD div 30)), 
    asserta(game_time(H1,D1,M1)), !.

displayTime :-
    game_time(H,D,M),
    write(H), write(':00'), write(' - '), write(D), write('/'), write(M), write('/2021').