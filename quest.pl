:- dynamic(takeQuest/3).
:- dynamic(running/1).

isInQTile(A,B) :-
    point(A,B,quest).

questStart :-
    running(_),
    \+(takeQuest(_,_,_)),nl,
    player_position(A,B),
    isInQTile(A,B),
    write('You got a new quest! '), nl,
    random(1,5,X),
    random(1,5,Y),
    random(1,5,Z),
    asserta(takeQuest(X,Y,Z)),
    write('You need to collect: '), nl,
    write('- '), write(X), write('Harvest Item'), nl,
    write('- '), write(Y), write('Fish'),nl,
    write('- '), write(Z), write('Ranch Item'), nl, !.

questStart :-
    takeQuest(_,_,_), nl,
    write('You have an on-going quest!'), nl.

questStart :-
    player_position(A,B),
    \+ isInQTile(A,B),
    write('You are not in the quest tile! You cannot take quest.'), nl.

finishQuest('Harvest Item') :-
    takeQuest(0,_,_),!.

finishQuest('Fish') :-
    takeQuest(_,0,_),!.

finishQuest('Ranch Item') :-
    takeQuest(_,_,0),!.

finishQuest('Harvest Item') :-
    takeQuest(X,Y,Z),
    player_job(farmer),
    player_expperspecialty(farmer, A),
    harvest,
    player_expperspecialty(farmer, B),
    (B is A + 10 ->
        NewX is X - 1,
        asserta(takeQuest(NewX, Y, Z), retractall(takeQuest(X,Y,Z)))
    ;
        asserta(takeQuest(X,Y,Z))), !.

finishQuest('Fish') :-
    takeQuest(X,Y,Z),
    player_job(fisherman),
    player_expperspecialty(fisherman, A),
    fish,
    player_expperspecialty(fisherman, B),
    (B is A + 10 ->
        NewY is Y - 1,
        asserta(takeQuest(X, NewY, Z), retractall(takeQuest(X,Y,Z)))
    ;
        asserta(takeQuest(X,Y,Z))), !.

finishQuest('Ranch Item') :-
    takeQuest(X,Y,Z),
    player_job(rancher),
    player_expperspecialty(rancher, A),
    laying_hen,
    player_expperspecialty(rancher, B),
    (B is A + 10 ->
        NewZ is Z - 1,
        asserta(takeQuest(X, Y, NewZ), retractall(takeQuest(X,Y,Z)))
    ;
        asserta(takeQuest(X,Y,Z))), !.

finishQuest('Ranch Item') :-
    takeQuest(X,Y,Z),
    player_job(rancher),
    player_expperspecialty(rancher, A),
    broiler_hen,
    player_expperspecialty(rancher, B),
    (B is A + 10 ->
        NewZ is Z - 1,
        asserta(takeQuest(X, Y, NewZ), retractall(takeQuest(X,Y,Z)))
    ;
        asserta(takeQuest(X,Y,Z))), !.

finishQuest('Ranch Item') :-
    takeQuest(X,Y,Z),
    player_job(rancher),
    player_expperspecialty(rancher, A),
    dairy_cow,
    player_expperspecialty(rancher, B),
    (B is A + 10 ->
        NewZ is Z - 1,
        asserta(takeQuest(X, Y, NewZ), retractall(takeQuest(X,Y,Z)))
    ;
        asserta(takeQuest(X,Y,Z))), !.

finishQuest('Ranch Item') :-
    takeQuest(X,Y,Z),
    player_job(rancher),
    player_expperspecialty(rancher, A),
    beef_cattle,
    player_expperspecialty(rancher, B),
    (B is A + 10 ->
        NewZ is Z - 1,
        asserta(takeQuest(X, Y, NewZ), retractall(takeQuest(X,Y,Z)))
    ;
        asserta(takeQuest(X,Y,Z))), !.

finishQuest('Ranch Item') :-
    takeQuest(X,Y,Z),
    player_job(rancher),
    player_expperspecialty(rancher, A),
    sheep,
    player_expperspecialty(rancher, B),
    (B is A + 10 ->
        NewZ is Z - 1,
        asserta(takeQuest(X, Y, NewZ), retractall(takeQuest(X,Y,Z)))
    ;
        asserta(takeQuest(X,Y,Z))), !.

questCompleted :-
    takeQuest(0,0,0),nl,
    write('Congratulations! You have completed your task.'), nl,
    player_totalexp(X),
    NewX is X + 10,
    asserta(player_totalexp(NewX), retractall(player_totalexp(X))),
    player_money(Y),
    NewY is Y + 10,
    asserta(player_money(NewY), retractall(player_money(Y))),
    write('You got 10 Exp and 10 gold'), nl, !.

questCompleted :-
    \+ takeQuest(0,0,0),nl,
    write('You haven\'t completed your quest!'), nl.

