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
    write('What do you want to do? '),nl, 
    write('/*To start ranching, you can type lay, broiler, dairy, beef or sheepwool.*/'), nl,
    write('/*To check whether it has produce something or not, you can type laying_hen, broiler_hen, dairy_cow, beef_cattle or sheep*/'),nl,!.
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
    write('You are not in the ranching tile. You cannot start ranching!'), nl,
     !.

addInventory(X, Count) :-
    (inventoryHasil(X,Y) ->
    Y1 is Y + Count,
    retractall(inventoryHasil(X,Y)),
    asserta(inventoryHasil(X,Y1))
    ;
    asserta(inventoryHasil(X,Count))), !.

lay :-
    game_started(_),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    \+ ranching_tile(X,Y,laying_hen,_,_,_),
    add_timeRanching(laying_hen,H,D,M),
    asserta(ranching_tile(X,Y,laying_hen,H,D,M)),
    write('You choose laying hen'),nl,
    !.

laying_hen :-
    player_position(X,Y),
    \+ isInRanchingTile(X,Y), nl,
    write('You are not in ranching tile! You cannot check whether your chicken has produce something or not.'), nl,!.

laying_hen :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(_,_,_,H,D,M),
    \+isProduceSmth(H,D,M),
    write('Your chicken has not produce anything yet.'), nl, !.

laying_hen :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(X,Y,laying_hen,_,_,_),
    retractall(ranching_tile(X,Y,laying_hen,_,_,_)),
    addInventory(eggs, Count),
    tambahExpperspecialty(rancher, 10, _, Level),
    write('Your chicken lays '), write(Count), write('eggs'), nl,
    write('You got '), write(Count), write('eggs'), nl,
    write('You gained 10 ranching Exp!'),!.

broiler :-
    game_started(_),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    \+ ranching_tile(X,Y,broiler_hen,_,_,_),
    inventoryRanching(broiler_hen,A),
    retractall(inventoryRanching(broiler_hen,A)),
    NewA is A-1,
    asserta(inventoryRanching(broiler_hen,NewA)),
    delete_zero_inventory_ranching,
    add_timeRanching(broiler_hen,H,D,M),
    asserta(ranching_tile(X,Y,broiler_hen,H,D,M)),
    write('You choose broiler hen'),nl,
    !.

broiler_hen :-
    player_position(X,Y),
    \+ isInRanchingTile(X,Y), nl,
    write('You are not in ranching tile! You cannot check whether your chicken is ready to sell or not.'), nl,!.

broiler_hen :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(_,_,_,H,D,M),
    \+isProduceSmth(H,D,M),
    write('Your chicken is not big enough.'), nl, !.

broiler_hen :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(X,Y,broiler_hen,_,_,_),
    retractall(ranching_tile(X,Y,broiler_hen,_,_,_)),
    addInventory(chicken, 1),
    tambahExpperspecialty(rancher, 10, _, Level),
    write('Your chicken is ready for sale!'),nl,
    write('You gained 10 ranching Exp!'),!.   

dairy :-
    game_started(_),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    \+ ranching_tile(X,Y,dairy_cow,_,_,_),
    add_timeRanching(dairy_cow,H,D,M),
    asserta(ranching_tile(X,Y,dairy_cow,H,D,M)),
    write('You choose dairy cows'),nl,
    !.

dairy_cow :-
    player_position(X,Y),
    \+ isInRanchingTile(X,Y), nl,
    write('You are not in ranching tile! You cannot check whether your cow has produce something or not.'), nl,!.

dairy_cow :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(_,_,_,H,D,M),
    \+isProduceSmth(H,D,M),
    write('Your cow has not produce anything yet.'), nl, !.

dairy_cow :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(X,Y,dairy_cow,_,_,_),
    retractall(ranching_tile(X,Y,dairy_cow,_,_,_)),
    addInventory(milk, Count),
    tambahExpperspecialty(rancher, 10, _, Level),
    write('Your cows produce '), write(Count*15), write('liters of milk'), nl,
    write('You got '), write(Count*15), write('liters of milk'), nl,
    write('You gained 10 ranching Exp!'),!.

beef :-
    game_started(_),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    \+ ranching_tile(X,Y,beef_cattle,_,_,_),
    inventoryRanching(beef_cattle,A),
    retractall(inventoryRanching(beef_cattle,A)),
    NewA is A-1,
    asserta(inventoryRanching(beef_cattle,NewA)),
    delete_zero_inventory_ranching,
    add_timeRanching(beef_cattle,H,D,M),
    asserta(ranching_tile(X,Y,beef_cattle,H,D,M)),
    write('You choose beef cattle'),nl,
    !.

beef_cattle :-
    player_position(X,Y),
    \+ isInRanchingTile(X,Y), nl,
    write('You are not in ranching tile! You cannot check whether your cow is ready to sell or not.'), nl,!.

beef_cattle :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(_,_,_,H,D,M),
    \+isProduceSmth(H,D,M),
    write('Your cow is not big enough.'), nl, !.

beef_cattle :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(X,Y,beef_cattle,_,_,_),
    retractall(ranching_tile(X,Y,beef_cattle,_,_,_)),
    addInventory(beef, 1),
    tambahExpperspecialty(rancher, 10, _, Level),
    write('Your cow is ready to sell!'),nl,
    write('You gained 10 ranching Exp!'),!.

sheepwool :-
    game_started(_),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    \+ ranching_tile(X,Y,sheep,_,_,_),
    add_timeRanching(sheep,H,D,M),
    asserta(ranching_tile(X,Y,sheep,H,D,M)),
    write('You choose sheep'),nl,
    !.

sheep :-
    player_position(X,Y),
    \+ isInRanchingTile(X,Y), nl,
    write('You are not in ranching tile! You cannot check whether your sheep has produce something or not.'), nl,!.

sheep :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(_,_,_,H,D,M),
    \+isProduceSmth(H,D,M),
    write('Your sheep has not produce anything yet.'), nl, !.

sheep :-
    player_levelperspecialty(rancher, Level),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(X,Y,sheep,_,_,_),
    retractall(ranching_tile(X,Y,sheep,_,_,_)),
    addInventory(wool, Count),
    tambahExpperspecialty(rancher, 10, _, Level),
    write('Your sheeps produce '), write(Count*5), write('kg wool'), nl,
    write('You got '), write(Count*5), write('kg wool'), nl,
    write('You gained 10 ranching Exp!'),!.










