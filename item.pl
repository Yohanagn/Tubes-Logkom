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

/* equipment(nama_alat,untuk_apa,level,jumlah)*/
equipment(hoe,farming,1,1).
equipment(fishing_rod,fishing,1,1).
equipment(fishing_net,fishing,1,1).
equipment(bucket,ranching,1,1).
equipment(knive,ranching,1,1).

add_N_to_equipment(N,A,B,C) :-
    (equipment(A,B,C,D) ->
    D1 is D+N,
    retractall(equipment(A,B,C,D)),
    asserta(equipment(A,B,C,D1));
    asserta(inventory(A,B,C,N))
    ).

substract_N_to_equipment(N,A,B,C) :-
    (equipment(A,B,C,D) ->
    D1 is D-N,
    retractall(equipment(A,B,C,D)),
    asserta(equipment(A,B,C,D1));
    asserta(inventory(A,B,C,N))
    ).


displayEquipment :-
    forall(equipment(A,B,C,D),writeEquipment(A,B,C,D)).

writeEquipment(A,_,C,D) :-
    write(D),
    write(' Level '),
    write(C),
    write(' '),
    write(A),
    nl,!.

delete_zero_equipment :-
    retractall(equipment(_,_,_,0)).