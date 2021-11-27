/* File map.pl */

/* Fact - Dynamic Variable */
:- dynamic(map_height/1).
:- dynamic(map_width/1). 
:- dynamic(point/3).


/* Edge Point */
northWall(_,Y) :- Y is 0, !.
southWall(_,Y) :- map_height(Y1), Y is Y1 + 1, !.
westWall(X,_) :- X is 0, !.
eastWall(X,_) :- map_width(X1), X is X1 + 1, !.


/* Initialize special position */
init_marketplace :-
	repeat,
	random(6,10,X1), 
	random(6,10,Y1), 
	(\+ (point(X1,Y1,water))), !,
	asserta(point(X1,Y1,market)).

init_house :-
	repeat,
	random(6,10,X1), 
	random(1,5,Y1), 
	(\+ (point(X1,Y1,water))), !,
	asserta(point(X1,Y1,house)).

init_quest_pos :- 
	repeat,
    random(1,10,X1),
    random(1,10,Y1),
	(\+ (point(X1,Y1,water)),
	\+ (point(X1,Y1,house)),
	\+ (point(X1,Y1,market)),
	\+ (point(X1,Y1,ranch)),
	\+ (point(X1,Y1,digged))), !,
    asserta(point(1,1,quest)).

init_ranch :-
	repeat,
    random(1,5,X1), 
	random(6,10,Y1), 
	(\+ (point(X1,Y1,water))), !,
	asserta(point(X1,Y1,ranch)).

init_water_tile :- 
	forall(between(5,6,X),(
		asserta(point(X,4,water)))),
	forall(between(3,7,X),(
		asserta(point(X,5,water)))),
	forall(between(4,8,X),(
		asserta(point(X,6,water)))),
	forall(between(5,6,X),(
		asserta(point(X,7,water)))).

/*
Gambaran Map
############
#----------#
#----------#
#----------#
#----oo----#
#--ooooo---#
#---ooooo--#
#----oo----#
#----------#
#----------#
#----------#
############ 
*/

/* Create Map */
createMap :- 
    W is 10, H is 10,
	asserta(map_width(W)), 
	asserta(map_height(H)), 
	initiate_playerpost,
	init_water_tile,
    init_marketplace, 
	init_house,
	init_ranch,
	init_quest_pos, !. 


/* Display Map Point */
display_point(X,Y) :- eastWall(X,Y), write('#\n'), !.
display_point(X,Y) :- northWall(X,Y), write('#'), !.
display_point(X,Y) :- southWall(X,Y), write('#'), !.
display_point(X,Y) :- westWall(X,Y), write('#'), !.
display_point(X,Y) :- player_position(X,Y), !, write('P').
display_point(X,Y) :- point(X,Y,market), !, write('M').
display_point(X,Y) :- point(X,Y,house), !, write('H').
display_point(X,Y) :- point(X,Y,quest), !, write('Q').
display_point(X,Y) :- point(X,Y,ranch), !, write('R').
display_point(X,Y) :- point(X,Y,water), !, write('o').
display_point(X,Y) :- point(X,Y,digged), !, write('=').
display_point(_,_) :- write('-'), !.


/* Map Command */
map :- 	
	game_opened(_),
	game_started(_),
	map_width(X), 
	X0 is 0, Xn is X+1,
	map_height(Y),
	Y0 is 0, Yn is Y+1, 
	write('  '),
	forall(between(Y0,Yn,Yi),(
		forall(between(X0,Xn,Xi),(
			display_point(Xi,Yi),
			write(' '))),
		write(' '))), nl,
	write('  Symbol: P - Player\n'),
	write('          M - Marketplace\n'),
	write('          R - Ranch\n'),
	write('          H - House\n'),
	write('          Q - Quest\n'),
	write('          o - Water tile\n'),
	write('          = - Digged tile\n'),
	write('          # - Wall\n'), !.
map :- write('You haven\'t started the game yet!'), !.