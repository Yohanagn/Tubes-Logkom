/* inventory(jenis,jumlah) */
:- dynamic(inventory/2).
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