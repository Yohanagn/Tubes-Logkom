/* Deklarasi fakta */
lama_beternak(laying_hen, 30).
lama_beternak(broiler_hen, 45).
lama_beternak(beef_cattle, 100).
lama_beternak(dairy_cow, 180).
lama_beternak(sheep, 180).

/* Rules */
isInRanchingTile(X,Y) :-
    point(X,Y,ranch).

displayRanchItem :-
    forall(inventoryRanching(A,B), (write(B), write(' '), write(A), nl)), !.

ranch :- 
    player_position(X,Y),
    isInRanchingTile(X,Y),
    write('Welcome to the ranch! You have '),nl,
    displayRanchItem,nl,
    write('What do you want to do? '),nl, !.
    /*read(Hewan),
    ((Hewan == laying_hen ; Hewan == sheep ; Hewan == dairy_cow) ->
    retractall(inventory(Hewan,Count)),
    lama_beternak(Hewan,Time),
    LamaBeternak is Time+current_time,
    asserta(lama_beternak(Hewan, LamaBeternak))
    ;
    retractall(inventory(Hewan,Count)),
    NewCount is Count - 1,
    asserta(inventory(Hewan,NewCount)),
    LamaBeternak is Time+current_time,
    asserta(lama_beternak(Hewan, LamaBeternak))),!.*/

ranch :- 
    player_position(X,Y),
    \+ isInRanchingTile(X,Y),
    write('You are not in the ranching tile. You cannot start ranching!'), nl, !.

addInventory(X, Count) :-
    (inventory(X,Y) ->
    Y1 is Y + Count,
    retractall(inventory(X,Y)),
    asserta(inventory(X,Y1))
    ;
    asserta(inventory(X,Count))), !.

laying_hen :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(laying_hen, Lama),
    Lama >= current_time,
    retractall(lama_beternak(laying_hen,Lama)),
    addInventory(eggs, Count),
    tambahExpperspecialty(rancher, 10, _, Level),
    write('Your chicken lays '), write(Count), write('eggs'), nl,
    write('You got '), write(Count), write('eggs'), nl,
    write('You gained 10 ranching Exp!'),!.

broiler_hen :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(broiler_hen, Lama),
    Lama >= current_time,
    retractall(lama_beternak(broiler_hen,Lama)),
    add_to_inventory(broiler_hen),
    tambahExpperspecialty(rancher, 10, _, Level),
    write('Your chicken is ready for sale!'),nl,
    write('You gained 10 ranching Exp!'),!.

dairy_cow :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(dairy_cow, Lama),
    Lama >= current_time,
    retractall(lama_beternak(dairy_cow,Lama)),
    addInventory(milk, Count),
    tambahExpperspecialty(rancher, 10, _, Level),
    write('Your cows produce '), write(Count*15), write('liters of milk'), nl,
    write('You got '), write(Count*15), write('liters of milk'), nl,
    write('You gained 10 ranching Exp!'),!.

beef_cattle :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(beef_cattle, Lama),
    Lama >= current_time,
    retractall(lama_beternak(beef_cattle,Lama)),
    add_to_inventory(beef_cattle),
    tambahExpperspecialty(rancher, 10, _, Level),
    write('Your cows is ready for sale!'), nl,
    write('You gained 10 ranching Exp!'),!.

sheep :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    lama_beternak(sheep, Lama),
    Lama >= current_time,
    retractall(lama_beternak(sheep,Lama)),
    add_to_inventory(wool, Count),
    tambahExpperspecialty(rancher, 10, _, Level),
    write('Your sheeps produce '), write(Count*5), write('kg wool'), nl,
    write('You got '), write(Count*5), write('kg wool'), nl,
    write('You gained 10 ranching Exp!'),!.











