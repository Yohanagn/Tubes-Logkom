/* File map.pl */

/* Dynamic Variable */
:- dynamic(map_height/1).
:- dynamic(map_width/1). 
:- dynamic(player_pos/2).
:- dynamic(market_pos/2).
:- dynamic(house_pos/2).
:- dynamic(ranch_pos/2).
:- dynamic(water_pos/2).
:- dynamic(digged_pos/2).
:- dynamic(quest_pos/2).


/* Edge Point */
edge_east(X,_) :- X1 is X - 1, map_width(X1), !.
edge_south(_,Y) :- Y1 is Y - 1, map_height(Y1), !.
edge_west(X,_) :- X is 0, !.
edge_north(_,Y) :- Y is 0, !.


/* Initialize special position */
init_player_pos :-
    asserta(player_pos(1,1)).

init_marketplace :-
	random(6,10,X1), 
	random(1,5,Y1), 
	asserta(market_pos(X1,Y1)).

init_house :-
	random(4,7,X1), 
	random(4,7,Y1), 
	asserta(market_pos(X1,Y1)).

init_quest_pos :- 
    random(1,10,X1),
    random(1,10,Y1),
    asserta(quest_pos(X1,Y1)).

init_ranch :- .
    random(1,5,X1), 
	random(6,10,Y1), 
	asserta(ranch_pos(X1,Y1)).

init_water_tile :- .

init_digged_tile :- .


/* Create Map */
createMap :- 
    W is 10, H is 10,
	asserta(map_width(10)), 
	asserta(map_height(10)), 
	init_player_pos,
    init_marketplace, 
	init_house,
	init_quest_pos, 
	init_ranch,
	init_water_tile,
    init_digged_tile, !.


/* Display Map Point */
display_point(X,Y) :- edge_east(X,Y), write('#\n'), !.
display_point(X,Y) :- edge_north(X,Y), write('#'), !.
display_point(X,Y) :- edge_south(X,Y), write('#'), !.
display_point(X,Y) :- edge_west(X,Y), write('#'), !.
display_point(X,Y) :- player_pos(X,Y), !, write('P').
display_point(X,Y) :- market_pos(X,Y), !, write('M').
display_point(X,Y) :- house_pos(X,Y), !, write('M').
display_point(X,Y) :- quest_pos(X,Y), !, write('Q').
display_point(X,Y) :- ranch_pos(X,Y), !, write('R').
display_point(X,Y) :- water_pos(X,Y), !, write('o').
display_point(X,Y) :- digged_pos(X,Y), !, write('=').
display_point(_,_) :- write('-'), !.


/* Map Command */
