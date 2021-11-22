/* Deklarasi fakta */
lama_beternak(ayampetelur, 30).
lama_beternak(ayambroiler, 45).
lama_beternak(sapiperah, 100).
lama_beternak(sapi, 180).
lama_beternak(domba, 180).

isInRanchingTile(X,Y) :-
    point(X,Y,ranch).

add_to_inventory(X) :-
    (inventory(X,Y) ->
    Y1 is Y+1,
    retractall(inventory(X,Y)),
    asserta(inventory(X,Y1));
    asserta(inventory(X,1))
    ).

displayInventory :-
    inventory(X,Y),
    write(Y),
    write(' '),
    write(X), nl.

delete_zero_inventory :-
    retractall(inventory(_,0)).

ranch :- 
    player_position(X,Y),
    isInRanchingTile(X,Y),
    writeln('Welcome to the ranch! You have '),
    displayInventory,
    writeln('What do you want to do? '),
    readln(Hewan),
    ((Hewan =:= ayampetelur ; Hewan =:= domba ; Hewan =:= sapi) ->
    retract(inventory(Hewan,Count)),
    lama_beternak(Hewan,Time),
    LamaBeternak is Time+current_time,
    asserta(lama_beternak(Hewan, LamaBeternak))
    ;
    retract(inventory(Hewan,Count)),
    NewCount is Count - 1,
    asserta(inventory(Hewan,NewCount)),
    LamaBeternak is Time+current_time,
    asserta(lama_beternak(Hewan, LamaBeternak))),!.

ayampetelur :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(ayampetelur, Lama),
    inventory(ayampetelur,Count),
    Lama >= current_time,
    retract(lama_beternak(ayampetelur,Lama)),
    add_to_inventory(Hasil),
    tambahExpperspecialty(rancher, 10, LevelUp, Level),
    write('Your chicken lays '), write(Count), write('eggs'), nl,
    write('You got '), write(Count), write('eggs'), nl,
    write('You gained 10 ranching Exp!'),!.

ayambroiler :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(ayambroiler, Lama),
    inventory(ayambroiler,Count),
    Lama >= current_time,
    retract(lama_beternak(ayambroiler,Lama)),
    add_to_inventory(Hasil),
    tambahExpperspecialty(rancher, 10, LevelUp, Level),
    write('Your chicken is ready for sale!'),nl,
    write('You gained 10 ranching Exp!'),!.

sapiperah :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(sapiperah, Lama),
    inventory(sapiperah,Count),
    Lama >= current_time,
    retract(lama_beternak(sapiperah,Lama)),
    add_to_inventory(Hasil),
    tambahExpperspecialty(rancher, 10, LevelUp, Level),
    write('Your cows produce '), write(Count*15), write('liters of milk'), nl,
    write('You got '), write(Count*15), write('liters of milk'), nl,
    write('You gained 10 ranching Exp!'),!.

sapi :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(sapi, Lama),
    inventory(sapi,Count),
    Lama >= current_time,
    retract(lama_beternak(sapi,Lama)),
    add_to_inventory(Hasil),
    tambahExpperspecialty(rancher, 10, LevelUp, Level),
    write('Your cows is ready for sale!'), nl,
    write('You gained 10 ranching Exp!'),!.

domba :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(domba, Lama),
    inventory(domba,Count),
    Lama >= current_time,
    retract(lama_beternak(domba,Lama)),
    add_to_inventory(Hasil),
    tambahExpperspecialty(rancher, 10, LevelUp, Level),
    write('Your sheeps produce '), write(Count*5), write('kg wool'), nl,
    write('You got '), write(Count*5), write('kg wool'), nl,
    write('You gained 10 ranching Exp!'),!.











