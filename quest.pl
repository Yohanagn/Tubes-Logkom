:- include('map.pl').
:- include('player.pl').
:- dynamic(takeQuest/3).

initQuest :-
    asserta(takeQuest(0,0,0)), !.

isQZero :-
    takeQuest(0,0,0).

isInQTile :-
    init_quest_pos.

quest :-
    isInQTile,
    isQZero,
    write('You got a new quest! '), nl,
    random(1,1,X),
    random(1,1,Y),
    random(1,1,Z),
    asserta(takeQuest(X,Y,Z)),
    write('You need to collect: '), nl,
    write('- '), write(X), write('Harvest Item'), nl,
    write('- '), write(Y), write('fish'),nl,
    write('- '), write(Z), write('Ranch Item'), nl, !.

quest :-
    \+ isQZero,
    isInQTile,
    write('You have an on-going quest!'), nl.

quest :-
    \+ isInQTile,
    isQZero,
    write('You are not in the quest tile! You cannot take quest.'), nl.


