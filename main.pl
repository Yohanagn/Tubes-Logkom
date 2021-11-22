:- include('player.pl').
:- include('map.pl').
:- include('move.pl').
:- include('house.pl').
/*
:- include('farming.pl').
:- include('fishing.pl').
:- include('ranching.pl').
:- include('quest.pl').
:- include('inventory.pl').
:- include('potion.pl').
:- include('musim.pl').
*/

/* Fakta */
/* (hour,day,month) */
:- dynamic(game_opened/1).
:- dynamic(game_started/1).
:- dynamic(game_time/3).
:- dynamic(musim/1).
:- dynamic(cuaca/1).

/* Rules */
mainMenu :-
    write('  |‾‾|    |‾‾|                                        |‾‾|     '), nl,
    write('  |  |    |  |/‾‾‾‾`′‾|‾`′‾‾‾‾\‾‾\  /‾‾/‾‾‾‾‾‾\/‾‾‾‾‾‾|   ‾‾|  '), nl,
    write('  |   ‾‾‾‾   |  (‾‾|  |  |‾‾‾‾‾\  \/  /   ‾‾  /\ ‾‾‾‾ \  |‾‾   '), nl,
    write('  |  |‾‾‾‾|  |\  ‾‾`′‾|  |      \    / \‾‾‾‾‾ ||‾‾‾‾  /\  ‾‾|  '), nl,
    write('  |__|    |__|  ‾‾‾  ‾ ‾‾        ‾‾‾‾   ‾‾‾‾‾‾  ‾‾‾‾‾    ‾‾‾   '), nl, nl,
    write('                         Harvest  Star                         '), nl, nl,
    write('            Let\'s play and pay our debts together!            '), nl, nl,
    write('      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      '), nl,
    write('      %                   ~MAIN MENU~                   %      '), nl,
    write('      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      '), nl,
    write('      %      1. start   : begin your journey            %      '), nl,
    write('      %      2. help    : show command info             %      '), nl, 
    write('      %      3. quit    : quit the game                 %      '), nl,
    write('      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      '), nl,
    nl, !.

openGame :- 
    game_opened(_),
    write('You have opened the game, type \'start\' to begin your journey!\n'), !.
openGame :-
    retractVar,
    mainMenu,
    asserta(game_opened(true)), !.

start :-
    game_opened(_),
    game_started(_),
    write('You have started the game, type \'help\' to display command info\n'), !.
start :-
    game_opened(_),
    asserta(game_started(true)),
    asserta(game_time(0,1,1)),
    createMap,
    write('Welcome to Harvest Star!'), nl,
    write('Choose Your Job:'), nl,
    write('1. Farmer'), nl,
    write('2. fisherman'), nl,
    write('3. Rancher'),nl,
    read(Job), nl,
    (Job == farmer ->
        initiatePlayerjob(farmer),
        write('You choose farmer, lets start farming'),nl;
    Job == fisherman ->
        initiatePlayerjob(fisherman),
        write('You choose fisherman, lets start fishing'),nl;
    Job == rancher ->
        initiatePlayerjob(rancher),
        write('You choose rancher, lets start ranching'),!),!.

retractVar :-
    /* main.pl */
    retractall(game_opened(_)),
    retractall(game_started(_)),
    retractall(game_time(_,_,_)),
    retractall(musim(_)),
    retractall(cuaca(_)),
    /* farming.pl */
    retractall(tile_farming(_,_,_,_)),
    /* map.pl */
    retractall(map_height(_)),
    retractall(map_width(_)), 
    retractall(point(_,_,_)),
    /* player.pl */
    retractall(player_job(_)),
    retractall(player_level(_)),
    retractall(player_levelperspecialty(_,_)),
    retractall(player_tools(_,_)),
    retractall(player_money(_)),
    retractall(player_totalexp(_)),
    retractall(player_expperspecialty(_,_)),
    retractall(player_position(_,_)),
    /* house.pl */
    retractall(insideHouse(_)), !.

help :-
    write('   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n'),
    write('   %                   ~COMMANDS~                 %\n'),
    write('   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n'),
    write('   %   map       : show the map                   %\n'),
    write('   %   status    : show your current status       %\n'),
    write('   %   inventory : show your current inventory    %\n'),
    write('   %   quest     : get new quest                  %\n'),
    write('   %   w         : move to the north              %\n'),
    write('   %   s         : move to the south              %\n'),
    write('   %   d         : move to the east               %\n'),
    write('   %   a         : move to the west               %\n'),
    write('   %   dig       : dig a tile                     %\n'),
    write('   %   plant     : plant a seed                   %\n'),
    write('   %   harvest   : harvest plant                  %\n'),
    write('   %   fish      : fishing                        %\n'),
    write('   %   ranch     : enter ranch                    %\n'),
    write('   %   market    : enter marketplace              %\n'),
    write('   %   house     : enter house                    %\n'),
    write('   %   help      : show command info              %\n'),
    write('   %   quit      : quit the game                  %\n'),
    write('   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n'), nl, !.

quit :-
    write('Are you sure want to quit the game? (y/n)\n'),
    write('Choice: '),
    read(Ans),
    Ans is y,
    write('Closing the game...\n'),
    halt.

/*
inventory :-
    display_inventory.

status :-
    displayStatus(X).
*/
