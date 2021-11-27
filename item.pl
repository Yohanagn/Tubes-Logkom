/* Deklarasi fakta */
/* Jenis tanaman : wortel, kentang, gandum,padi, singkong, jagung */
tanaman(carrot).
tanaman(potato).
tanaman(wheat).
tanaman(paddy).
tanaman(cassava).
tanaman(corn).

seed(carrot).
seed(potato).
seed(wheat).
seed(paddy).
seed(cassava).
seed(corn).

/* equipment(nama_alat,untuk_apa,level)*/
equipment(hoe,farming,1).
equipment(fishing_rod,fishing,1).
equipment(fishing_net,fishing,1).
equipment(bucket,ranching,1).
equipment(knive,ranching,1).

increase_level_of_equipment(X,Y) :-
    (equipment(X,Y,Z) ->
    Z1 is Z+1,
    retractall(inventory(X,Y,Z)),
    asserta(inventory(X,Y,Z1));
    asserta(inventory(X,Y,1))
    ).