/* Deklarasi fakta */
lama_beternak(laying_hen, 30).
lama_beternak(broiler_hen, 45).
lama_beternak(beef_cattle, 100).
lama_beternak(dairy_cow, 180).
lama_beternak(sheep, 180).

/* Rules */
isInRanchingTile(X,Y) :-
    point(X,Y,ranch).

ranch :- 
    player_position(X,Y),
    isInRanchingTile(X,Y),
    writeln('Welcome to the ranch! You have '),
    displayInventory,
    writeln('What do you want to do? '),
    readln(Hewan),
    ((Hewan =:= laying_hen ; Hewan =:= sheep ; Hewan =:= beef_cattle) ->
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

laying_hen :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(laying_hen, Lama),
    inventory(laying_hen,Count),
    Lama >= current_time,
    retract(lama_beternak(laying_hen,Lama)),
    add_to_inventory(Hasil),
    tambahExpperspecialty(rancher, 10, LevelUp, Level),
    write('Your chicken lays '), write(Count), write('eggs'), nl,
    write('You got '), write(Count), write('eggs'), nl,
    write('You gained 10 ranching Exp!'),!.

broiler_hen :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(broiler_hen, Lama),
    inventory(broiler_hen,Count),
    Lama >= current_time,
    retract(lama_beternak(broiler_hen,Lama)),
    add_to_inventory(Hasil),
    tambahExpperspecialty(rancher, 10, LevelUp, Level),
    write('Your chicken is ready for sale!'),nl,
    write('You gained 10 ranching Exp!'),!.

dairy_cow :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(dairy_cow, Lama),
    inventory(dairy_cow,Count),
    Lama >= current_time,
    retract(lama_beternak(dairy_cow,Lama)),
    add_to_inventory(Hasil),
    tambahExpperspecialty(rancher, 10, LevelUp, Level),
    write('Your cows produce '), write(Count*15), write('liters of milk'), nl,
    write('You got '), write(Count*15), write('liters of milk'), nl,
    write('You gained 10 ranching Exp!'),!.

beef_cattle :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(beef_cattle, Lama),
    inventory(beef_cattle,Count),
    Lama >= current_time,
    retract(lama_beternak(beef_cattle,Lama)),
    add_to_inventory(Hasil),
    tambahExpperspecialty(rancher, 10, LevelUp, Level),
    write('Your cows is ready for sale!'), nl,
    write('You gained 10 ranching Exp!'),!.

sheep :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(sheep, Lama),
    inventory(sheep,Count),
    Lama >= current_time,
    retract(lama_beternak(sheep,Lama)),
    add_to_inventory(Hasil),
    tambahExpperspecialty(rancher, 10, LevelUp, Level),
    write('Your sheeps produce '), write(Count*5), write('kg wool'), nl,
    write('You got '), write(Count*5), write('kg wool'), nl,
    write('You gained 10 ranching Exp!'),!.











