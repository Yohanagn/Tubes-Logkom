:- dynamic(takeQuest/3).

isInQTile(A,B) :-
    point(A,B,quest).


quest :-
    player_position(A,B),
    \+ isInQTile(A,B),
    write('You are not in the quest tile! You cannot take quest.'), nl,!.

quest :-
    takeQuest(X,Y,Z),
    total_farming_item(X1),
    total_fishing_item(Y1),
    total_ranching_item(Z1),
    X1 >= X,
    Y1 >= Y,
    Z1 >= Z,
    write('You have completed the quest\n'),
    write('You get '),
    Money is (X+Y+Z)*50,
    write(Money),
    write(' gold\n'),
    write('You get 20 EXP'),
    retractall(takeQuest(X,Y,Z)),
    perubahanUang(Money),
    goal_state,
    !.

quest :-
    takeQuest(_,_,_), nl,
    write('You have an on-going quest!'), nl,!.

quest :-
    game_opened(_),
    game_started(_),
    \+takeQuest(_,_,_), nl,
    player_position(A,B),
    isInQTile(A,B),
    write('You got a new quest! '), nl,
    random(1,5,X),
    random(1,5,Y),
    random(0,1,Z),
    asserta(takeQuest(X,Y,Z)),
    write('You need to collect: '), nl,
    write('- '), write(X), write(' Harvest Item'), nl,
    write('- '), write(Y), write(' Fish'),nl,
    write('- '), write(Z), write(' Ranch Item'), nl, !.



/*
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
    player_position(A,B),
    isInQTile(A,B),
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
    player_position(A,B),
    isInQTile(A,B),
    \+ takeQuest(0,0,0),nl,
    write('You haven\'t completed your quest!'), nl.

questCompleted :-
    player_position(A,B),
    \+ isInQTile(A,B),
    write('You are not in quest Tile! You cannot check whether you have complete your quest or not.'),nl,!.

*/

total_farming_item(X) :-
    (inventory(carrot,N1) ->
        X1 is N1;
        X1 is 0
    ),
    (inventory(potato,N2) ->
        X2 is N2;
        X2 is 0
    ),
    (inventory(wheat,N3) ->
        X3 is N3;
        X3 is 0
    ),
    (inventory(paddy,N4) ->
        X4 is N4;
        X4 is 0
    ),
    (inventory(cassava,N5) ->
        X5 is N5;
        X5 is 0
    ),
    (inventory(corn,N6) ->
        X6 is N6;
        X6 is 0
    ),
    X is X1+X2+X3+X4+X5+X6,!.

total_fishing_item(X) :-
    (inventory(goldfish,N1) ->
        X1 is N1;
        X1 is 0
    ),
    (inventory(catfish,N2) ->
        X2 is N2;
        X2 is 0
    ),
    (inventory(gurame,N3) ->
        X3 is N3;
        X3 is 0
    ),
    (inventory(tilapia,N4) ->
        X4 is N4;
        X4 is 0
    ),
    (inventory(parrotfish,N5) ->
        X5 is N5;
        X5 is 0
    ),
    X is X1+X2+X3+X4+X5,!.

total_ranching_item(X) :-
    (inventory(eggs,N1) ->
        X1 is N1;
        X1 is 0
    ),
    (inventory(milk,N2) ->
        X2 is N2;
        X2 is 0
    ),
    (inventory(wool,N3) ->
        X3 is N3;
        X3 is 0
    ),
    X is X1+X2+X3,!.