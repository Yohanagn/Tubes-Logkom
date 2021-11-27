/* inventory(jenis,jumlah) */
:- dynamic(inventory/2).
:- dynamic(inventory_seed/2).
/* inventory(biji_jagung,10). */
/*umbi-umbian*/
inventory(carrot,10).
inventory(potato,10).
inventory(wheat,10).
inventory(paddy,10).
inventory(cassava,10).
inventory(corn,10).
/*hewan ternak*/
inventory(laying_hen,10).
inventory(broiler_hen,10).
inventory(beef_cattle,10).
inventory(dairy_cow,10).
inventory(sheep,10).
/*ikan*/
inventory(goldfish,10).
inventory(catfish,10).
inventory(gurame,10).
inventory(tilapia,10).
inventory(parrotfish,10).
/*Hasil Ternak*/
inventory(eggs, 0).
inventory(milk, 0).
inventory(wool, 0).

inventory_seed(carrot,3).
inventory_seed(potato,3).
inventory_seed(wheat,3).
inventory_seed(paddy,3).
inventory_seed(cassava,3).
inventory_seed(corn,3).

add_to_inventory(X) :-
    (inventory(X,Y) ->
    Y1 is Y+1,
    retractall(inventory(X,Y)),
    asserta(inventory(X,Y1));
    asserta(inventory(X,1))
    ).

add_N_to_inventory(N,X) :-
    (inventory(X,Y) ->
    Y1 is Y+N,
    retractall(inventory(X,Y)),
    asserta(inventory(X,Y1));
    asserta(inventory(X,N))
    ).

substract_N_to_inventory(N,X) :-
    (inventory(X,Y) ->
    Y1 is Y-N,
    retractall(inventory(X,Y)),
    asserta(inventory(X,Y1));
    asserta(inventory(X,N))
    ).

add_to_inventory_seed(X) :-
    (inventory_seed(X,Y) ->
    Y1 is Y+1,
    retractall(inventory_seed(X,Y)),
    asserta(inventory_seed(X,Y1));
    asserta(inventory_seed(X,1))
    ).

add_N_to_inventory_seed(N,X) :-
    (inventory_seed(X,Y) ->
    Y1 is Y+N,
    retractall(inventory_seed(X,Y)),
    asserta(inventory_seed(X,Y1));
    asserta(inventory_seed(X,N))
    ).

displayInventory :-
    forall(inventory(X,Y),writeInventory(X,Y)).

displayInventorySeed :-
    forall(inventory_seed(X,Y),writeInventory(X,Y)).

writeInventory(X,Y) :-
    write(Y),
    write(' '),
    write(X),
    nl,!.

delete_zero_inventory :-
    retractall(inventory(_,0)).

delete_zero_inventory_seed:-
    retractall(inventory_seed(_,0)).