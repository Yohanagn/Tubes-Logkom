/* inventory(jenis,jumlah) */
:- dynamic(inventory/2).
:- dynamic(inventory_seed/2).
:- dynamic(capacity_inventory/1).
:- dynamic(inventoryRanching/2).
:- dynamic(inventoryHasil/2).

/* inventory(biji_jagung,10). */
/*umbi-umbian*/
inventory(carrot,10).
inventory(potato,10).
inventory(wheat,10).
inventory(paddy,10).
inventory(cassava,10).
inventory(corn,10).

/*ikan*/
inventory(goldfish,10).
inventory(catfish,10).
inventory(gurame,10).
inventory(tilapia,10).
inventory(parrotfish,10).

/*hewan ternak*/
inventoryRanching(laying_hen,10).
inventoryRanching(broiler_hen,10).
inventoryRanching(beef_cattle,10).
inventoryRanching(dairy_cow,10).
inventoryRanching(sheep,10).

/*Hasil Ternak*/
inventoryHasil(eggs, 0).
inventoryHasil(milk, 0).
inventoryHasil(wool, 0).
inventoryHasil(chicken, 0).
inventoryHasil(beef, 0).

inventory_seed(carrot,3).
inventory_seed(potato,3).
inventory_seed(wheat,3).
inventory_seed(paddy,3).
inventory_seed(cassava,3).
inventory_seed(corn,3).

/* Inventory operators */

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

delete_zero_inventory :-
    retractall(inventory(_,0)).

/* Inventory seed operators */

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

delete_zero_inventory_seed:-
    retractall(inventory_seed(_,0)).

/* Inventory ranching operators */

add_N_to_inventory_ranching(N,X) :-
    (inventoryRanching(X,Y) ->
    Y1 is Y+N,
    retractall(inventoryRanching(X,Y)),
    asserta(inventoryRanching(X,Y1));
    asserta(inventoryRanching(X,N))
    ).

substract_N_to_inventory_ranching(N,X) :-
    (inventoryRanching(X,Y) ->
    Y1 is Y-N,
    retractall(inventoryRanching(X,Y)),
    asserta(inventoryRanching(X,Y1));
    asserta(inventoryRanching(X,N))
    ).

delete_zero_inventory_ranching :-
    retractall(inventoryRanching(_,0)).

/* Inventory hasil operators */

add_N_to_inventory_hasil(N,X) :-
    (inventoryHasil(X,Y) ->
    Y1 is Y+N,
    retractall(inventoryHasil(X,Y)),
    asserta(inventoryHasil(X,Y1));
    asserta(inventoryHasil(X,N))
    ).

substract_N_to_inventory_hasil(N,X) :-
    (inventoryHasil(X,Y) ->
    Y1 is Y-N,
    retractall(inventoryHasil(X,Y)),
    asserta(inventoryHasil(X,Y1));
    asserta(inventoryHasil(X,N))
    ).

delete_zero_inventory_hasil :-
    retractall(inventoryHasil(_,0)).

/* display */

displayInventory :-
    forall(inventory(X,Y),writeInventory(X,Y)).

displayInventorySeed :-
    forall(inventory_seed(X,Y),writeInventory(X,Y)).

displayInventoryRanching :-
    forall(inventoryRanching(X,Y),writeInventory(X,Y)).

displayInventoryHasil :-
    forall(inventoryHasil(X,Y),writeInventory(X,Y)).

writeInventory(X,Y) :-
    write(Y),
    write(' '),
    write(X),
    nl,!.

inventory :-
    write('Your inventory '),
    /*capacity_inventory(X),
    write(X),*/
    write('/100)\n'),
    displayInventory,
    write('\n'),
    write('| ?- '),
    read(Action),
    (Action == throwItem ->
        throwItem,!
    ).

throwItem :-
    write('What do you want to throw?\n'),
    read(Item),
    inventory(Item,X),
    write('You have '),
    write(X),
    write(Item).