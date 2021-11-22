/* File map.pl */

/* Fact - Dynamic Variable */
:- dynamic(map_height/1).
:- dynamic(map_width/1). 
:- dynamic(point/3).


/* Edge Point */
edge_east(X,_) :- X1 is X - 1, map_width(X1), !.
edge_south(_,Y) :- Y1 is Y - 1, map_height(Y1), !.
edge_west(X,_) :- X is 0, !.
edge_north(_,Y) :- Y is 0, !.


/* Initialize special position */
init_player_pos :-
    asserta(player_position(1,1)).

init_marketplace :-
	random(6,10,X1), 
	random(1,5,Y1), 
	asserta(point(X1,Y1,market)).

init_house :-
	random(4,7,X1), 
	random(4,7,Y1), 
	asserta(point(X1,Y1,house)).

init_quest_pos :- 
    random(1,10,X1),
    random(1,10,Y1),
	\+ (point(X1,Y1,water)),
    asserta(point(X1,Y1,quest)).

init_ranch :-
    random(1,5,X1), 
	random(6,10,Y1), 
	asserta(point(X1,Y1,ranch)).

init_water_tile :- 
	asserta(point(10,6,water)),
	forall(between(8,10,X),(
		asserta(point(X,7,water)))),
	forall(between(6,10,X),(
		asserta(point(X,8,water)))),
	forall(between(7,9,X),(
		asserta(point(X,9,water)))).

/*
Gambaran Map
############
#----------#
#----------#
#----------#
#----------#
#----------#
#---------o#
#-------ooo#
#-----ooooo#
#------ooo-#
#----------#
############ 
*/

/* Create Map */
createMap :- 
    W is 10, H is 10,
	asserta(map_width(W)), 
	asserta(map_height(H)), 
	init_player_pos,
    init_marketplace, 
	init_house,
	init_water_tile,
	init_ranch,
	init_quest_pos, !. 


/* Display Map Point */
display_point(X,Y) :- edge_east(X,Y), write('#\n'), !.
display_point(X,Y) :- edge_north(X,Y), write('#'), !.
display_point(X,Y) :- edge_south(X,Y), write('#'), !.
display_point(X,Y) :- edge_west(X,Y), write('#'), !.
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
			write('  '))))), nl,
	write('  Symbol: P - Player\n'),
	write('          M - Marketplace\n'),
	write('          R - Ranch\n'),
	write('          H - House\n'),
	write('          Q - Quest\n'),
	write('          o - Water tile\n'),
	write('          = - Digged tile\n'),
	write('          # - Wall\n'), !.
map :- write('You haven\'t started the game yet!'), !.