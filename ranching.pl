/* Deklarasi fakta */
lama_beternak(laying_hen, 30).
lama_beternak(broiler_hen, 2).
lama_beternak(beef_cattle, 100).
lama_beternak(dairy_cow, 180).
lama_beternak(sheep, 180).

:- dynamic(ranching_tile/6).
:- dynamic(total_broiler/1).
:- dynamic(total_beef/1).

/* Rules */
isInRanchingTile(X,Y) :-
    point(X,Y,ranch).

displayRanchItem :-
    forall(inventoryRanching(A,B), (write(B), write(' '), write(A), nl)), !.

add_exp_ranching :-
    (player_job(rancher) ->
        write('You get 10 exp ranching!'), nl,
        tambahExpperspecialty(rancher, 10);
        write('You get 5 exp ranching!'), nl,
        tambahExpperspecialty(rancher, 5)
    ), !.

add_timeRanching(X,H,D,M) :-
    game_time(Ht,Dt,Mt),
    lama_beternak(X,Nt),
    generate_koef_ranching(Koef),
    N is round(Nt/Koef),
    M is (Mt+((N+Ht) div 720)+(Dt div 30)) mod 12,
    D is (Dt+((N+Ht) div 24)) mod 30,
    H is (N+Ht) mod 24,
    !.

isProduceSmth(H,D,M) :-
    game_time(Ht,Dt,Mt),
    T1 is Ht+Dt*24+Mt*720,
    T2 is H+D*24+M*720,
    T1>=T2.

generate_koef_ranching(X) :-
    player_level(Level_overall),
    player_levelperspecialty(rancher,Level_rancher),
    (player_job(rancher) ->
        Y is 0.2
    ;
        Y is 0
    ),
    (equipment(ranching_machine,ranching,Level_item) ->
        Z is Level_item/10;
        Z is 0
    ),
    X is (Level_overall/50)*0.5+(Level_rancher/50)*0.5+Y+1+Z.

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
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(_,_,_,H,D,M),
    \+isProduceSmth(H,D,M),
    write('Your chicken has not produce anything yet.'), nl, !.

laying_hen :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(X,Y,laying_hen,_,_,_),
    retractall(ranching_tile(X,Y,laying_hen,_,_,_)),
    inventoryRanching(laying_hen, Count),
    addInventory(eggs, Count),
    write('Your chicken lays '), write(Count), write(' eggs'), nl,
    write('You got '), write(Count), write(' eggs'), nl,
    add_exp_ranching, !.

broiler :-
    game_started(_),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    inventoryRanching(broiler_hen,A),
    retractall(inventoryRanching(broiler_hen,A)),
    NewA is A-1,
    asserta(inventoryRanching(broiler_hen,NewA)),
    delete_zero_inventory_ranching,
    add_timeRanching(broiler_hen,H,D,M),
    asserta(ranching_tile(X,Y,broiler_hen,H,D,M)),
    write('You choose broiler hen'),nl,
    !.

get_ready_broiler(Ntot) :-
    forall((ranching_tile(_,_,broiler_hen,H,D,M),isProduceSmth(H,D,M)),(total_broiler(N),retractall(total_broiler(N)),NewN is N+1,asserta(total_broiler(NewN)),retract(ranching_tile(_,_,broiler_hen,H,D,M)))),
    total_broiler(Ntot),
    retractall(total_broiler(Ntot)),
    asserta(total_broiler(0)),
    !.

broiler_hen :-
    player_position(X,Y),
    \+ isInRanchingTile(X,Y), nl,
    write('You are not in ranching tile! You cannot check whether your chicken is ready to sell or not.'), nl,!.

broiler_hen :-
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(X,Y,broiler_hen,_,_,_),
    write('1\n'),
    get_ready_broiler(Ntot),
    write('1\n'),
    (Ntot == 0 ->
        write('Your chicken is not big enough.'), nl, !
    ),
    write('1\n'),
    addInventory(chicken, Ntot),
    write('You get '),
    write(Ntot),
    write(' chicken\n'),
    write('Your chicken is ready for sale!'),nl,
    add_exp_ranching,!.   

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
    player_levelperspecialty(rancher, _),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(_,_,_,H,D,M),
    \+isProduceSmth(H,D,M),
    write('Your cow has not produce anything yet.'), nl, !.

dairy_cow :-
    player_levelperspecialty(rancher, _),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(X,Y,dairy_cow,_,_,_),
    retractall(ranching_tile(X,Y,dairy_cow,_,_,_)),
    inventoryRanching(dairy_cow, Count),
    NewCount is Count*15,
    addInventory(milk, NewCount),
    write('Your cows produce '), write(NewCount), write(' liters of milk'), nl,
    write('You got '), write(NewCount), write(' liters of milk'), nl,
    add_exp_ranching,!.

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
    player_levelperspecialty(rancher, _),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(_,_,_,H,D,M),
    \+isProduceSmth(H,D,M),
    write('Your cow is not big enough.'), nl, !.

beef_cattle :-
    player_levelperspecialty(rancher, _),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(X,Y,beef_cattle,_,_,_),
    retractall(ranching_tile(X,Y,beef_cattle,_,_,_)),
    addInventory(beef, 1),
    write('Your cow is ready to sell!'),nl,
    add_exp_ranching,!.

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
    player_levelperspecialty(rancher, _),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(_,_,_,H,D,M),
    \+isProduceSmth(H,D,M),
    write('Your sheep has not produce anything yet.'), nl, !.

sheep :-
    player_levelperspecialty(rancher, _),
    player_position(X,Y),
    isInRanchingTile(X,Y),
    ranching_tile(X,Y,sheep,_,_,_),
    retractall(ranching_tile(X,Y,sheep,_,_,_)),
    inventoryRanching(sheep, Count),
    NewCount is Count*5,
    addInventory(wool, NewCount),
    write('Your sheeps produce '), write(NewCount), write(' kg wool'), nl,
    write('You got '), write(NewCount), write(' kg wool'), nl,
    add_exp_ranching,!.










