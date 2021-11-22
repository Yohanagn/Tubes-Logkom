:- include('player.pl').
:- include('map.pl').
:- include('move.pl').
:- include('farming.pl').
:- include('fishing.pl').
:- include('ranching.pl').
:- include('quest.pl').
:- include('inventory.pl').
:- include('potion.pl').
:- include('musim.pl').

/* Fakta */
/* (hour,day,month) */
:- dynamic(time/3).
:- dynamic(musim/1).
:- dynamic(cuaca/1).
:- dynamic(startingGame/1).

startGame :-
    startingGame(_), !.

startGame :-
    write('|‾‾|    |‾‾|                                        |‾‾|'), nl,
    write('|  |    |  |/‾‾‾‾`′‾|‾`′‾‾‾‾\‾‾\  /‾‾/‾‾‾‾‾‾\/‾‾‾‾‾‾|   ‾‾|'), nl,
    write('|   ‾‾‾‾   |  (‾‾|  |  |‾‾‾‾‾\  \/  /   ‾‾  /\ ‾‾‾‾ \  |‾‾'), nl,
    write('|  |‾‾‾‾|  |\  ‾‾`′‾|  |      \    / \‾‾‾‾‾ ||‾‾‾‾  /\  ‾‾|'),nl,
    write('|__|    |__|  ‾‾‾  ‾ ‾‾        ‾‾‾‾   ‾‾‾‾‾‾  ‾‾‾‾‾    ‾‾‾'), nl,
    write(''),nl,
    write('Harvest Star!!!'),nl,
    write(''),nl,
    write('Let\'s play and pay our debts together'), nl,
    write(''),nl,
    write(''),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    write('%                          ~Harvest Star~                              %'),nl,
    write('% 1. start   : untuk memulai petualanganmu                             %'),nl,
    write('% 2. map     : menampilkan peta                                        %'),nl,
    write('% 3. status  : menampilkan kondisi terkinimu                           %'),nl,
    write('% 4. w       : gerak ke utara 1 langkah                                %'),nl,
    write('% 5. s       : gerak ke selatan 1 langkah                              %'),nl,
    write('% 6. d       : gerak ke timur 1 langkah                                %'),nl,
    write('% 7. a       : gerak ke barat 1 langkah                                %'),nl,
    write('% 8. help    : menampilkan segala bantuan                              %'),nl,
    write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'),nl,
    asserta(startingGame(1)),!.

start :-
    startingGame(_),
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

quit :-
    halt, !.

inventory :-
    display_inventory.

status :-
    displayStatus(X).

