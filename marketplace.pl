:- include('player.pl').
:- include('inventory.pl').
:- include('item.pl').

market :-
    write('What do you want to do?\n1. Buy\n2. Sell\n\n'),
    write('| ?- '),
    read(Action),
    (Action == buy ->
        buy;
    Action == sell ->
        sell;
    Action == exitShop ->
        write('Thank you for coming ^^\n'),!),
    !.

/* BUY */

buy :-
    write('What do you want to buy?\n'),
    write('1. carrot (50 golds)\n'),
    write('2. potato (50 golds)\n'),
    write('3. wheat (50 golds)\n'),
    write('4. paddy (50 golds)\n'),
    write('5. cassava (50 golds)\n'),
    write('6. corn (50 golds)\n'),
    write('7. laying_hen (100 golds)\n'),
    write('8. broiler_hen (100 golds)\n'),
    write('9. beef_cattle (200 golds)\n'),
    write('10. dairy_cow (250 golds)\n'),
    write('11. sheep (150 golds)\n'),
    /* 
    equipment(hoe,farming,1).
    equipment(fishing_rod,fishing,1).
    equipment(fishing_net,fishing,1).
    equipment(bucket,ranching,1).
    equipment(knive,ranching,1).

    */
    write('12. Level '),
    equipment(hoe,farming,A),
    Lvl is A+1,
    write(Lvl),
    write(' hoe (500 golds)\n'),
    write('13. Level '),
    equipment(fishing_rod,fishing,A),
    Lvl is A+1,
    write(Lvl),
    write(' fishing_rod (500 golds)\n'),
    write('14. Level '),
    equipment(fishing_net,fishing,A),
    Lvl is A+1,
    write(Lvl),
    write(' fishing_net (500 golds)\n'),
    write('15. Level '),
    equipment(bucket,ranching,A),
    Lvl is A+1,
    write(Lvl),
    write(' bucket (500 golds)\n'),
    write('16. Level '),
    equipment(knive,ranching,A),
    Lvl is A+1,
    write(Lvl),
    write(' knive (500 golds)\n'),
    write('| ?- '),
    read(Itemnumber),
    Cnt is Itemnumber,
    (Cnt < 12 ->
        write('How many do you want to buy?\n\n'),
        write('| ?- '), 
        read(Qty),
        Jml is Qty,
        (Jml < 1 ->
            write('At least one item can be purchased.\n\n'),
            market;
        Jml > 0 ->
            /* NONE */
        !);
    Cnt > 11 ->
        /*NONE*/
    !),
    (Itemnumber == 1 ->
        Charged is Qty * 50,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' carrot.\n');
        Qty > 1 ->
            write(' carrots.\n'),!
        ),
        add_N_to_inventory_seed(Qty,carrot),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 2 ->
        Charged is Qty * 50,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' potato.\n');
        Qty > 1 ->
            write(' potatoes.\n'),!
        ),
        add_N_to_inventory_seed(Qty,potato),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 3 ->
        Charged is Qty * 50,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' wheat.\n');
        Qty > 1 ->
            write(' wheats.\n'),!
        ),
        add_N_to_inventory_seed(Qty,wheat),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 4 ->
        Charged is Qty * 50,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' paddy.\n');
        Qty > 1 ->
            write(' paddies.\n'),!
        ),
        add_N_to_inventory_seed(Qty,paddy),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 5 ->
        Charged is Qty * 50,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' cassava.\n');
        Qty > 1 ->
            write(' cassavas.\n'),!
        ),
        add_N_to_inventory_seed(Qty,cassava),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 6 ->
        Charged is Qty * 50,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' corn.\n');
        Qty > 1 ->
            write(' corns.\n'),!
        ),
        add_N_to_inventory_seed(Qty,corn),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 7 ->
        Charged is Qty * 100,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' laying_hen.\n');
        Qty > 1 ->
            write(' laying_hens.\n'),!
        ),
        add_N_to_inventory_ranching(Qty,laying_hen),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 8 ->
        Charged is Qty * 100,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' broiler_hen.\n');
        Qty > 1 ->
            write(' broiler_hens.\n'),!
        ),
        add_N_to_inventory_ranching(Qty,broiler_hen),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 9 ->
        Charged is Qty * 200,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' beef_cattle.\n');
        Qty > 1 ->
            write(' beefs_cattle.\n'),!
        ),
        add_N_to_inventory_ranching(Qty,beef_cattle),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 10 ->
        Charged is Qty * 250,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' dairy_cow.\n');
        Qty > 1 ->
            write(' dairy_cows.\n'),!
        ),
        add_N_to_inventory_ranching(Qty,dairy_cow),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 11 ->
        Charged is Qty * 150,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' sheep.\n');
        Qty > 1 ->
            write(' sheeps.\n'),!
        ),
        add_N_to_inventory_ranching(Qty,sheep),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 12 ->
        Charged is 500,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought level '),
        equipment(hoe,farming,A),
        Lvl is A+1,
        write(Lvl),
        write(' hoe.\n'),
        increase_level_of_equipment(hoe,farming),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 13 ->
        Charged is 500,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought level '),
        equipment(fishing_rod,fishing,A),
        Lvl is A+1,
        write(Lvl),
        write(' fishing_rod.\n'),
        increase_level_of_equipment(fishing_rod,fishing),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 14 ->
        Charged is 500,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought level '),
        equipment(fishing_net,fishing,A),
        Lvl is A+1,
        write(Lvl),
        write(' fishing_net.\n'),
        increase_level_of_equipment(fishing_net,fishing),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 15 ->
        Charged is 500,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought level '),
        equipment(bucket,ranching,A),
        Lvl is A+1,
        write(Lvl),
        write(' bucket.\n'),
        increase_level_of_equipment(bucket,ranching),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 16 ->
        Charged is 500,
        change_capacity_inventory(Qty),
        player_money(M),
        (M < Charged ->
            write('Your money is not enough.\n\n'),
            market;
        M >= Charged ->
            /*NONE*/
        !),
        write('You have bought level '),
        equipment(knive,ranching,A),
        Lvl is A+1,
        write(Lvl),
        write(' knive.\n'),
        increase_level_of_equipment(knive,ranching),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n')
    ,!),
    !.

/* SELL */

sell :-
    write('Here are the items in your inventory:\n'),
    displayInventory,
    displayInventoryHasil,
    write('What do you want to sell?\n\n'),
    write('| ?- '),
    read(Item),
    write('How many do you want to sell?\n\n'),
    write('| ?- '), 
    read(Qty),
    (Item == carrot ->
        inventory(carrot,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough carrots. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' carrot.\n');
        Qty > 1 ->
            write(' carrots.\n'),!
        ),
        substract_N_to_inventory(Qty,carrot),
        Get is Qty * 50,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == potato ->
        inventory(potato,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough potatoes. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' potato.\n');
        Qty > 1 ->
            write(' potatoes.\n'),!
        ),
        substract_N_to_inventory(Qty,potato),
        Get is Qty * 50,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == wheat ->
        inventory(wheat,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough wheats. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' wheat.\n');
        Qty > 1 ->
            write(' wheats.\n'),!
        ),
        substract_N_to_inventory(Qty,wheat),
        Get is Qty * 50,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == paddy ->
        inventory(carrot,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough paddies. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' paddy.\n');
        Qty > 1 ->
            write(' paddies.\n'),!
        ),
        substract_N_to_inventory(Qty,paddy),
        Get is Qty * 50,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == cassava ->
        inventory(cassava,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough cassavas. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' cassava.\n');
        Qty > 1 ->
            write(' cassavas.\n'),!
        ),
        substract_N_to_inventory(Qty,cassava),
        Get is Qty * 50,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == corn ->
        inventory(corn,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough corns. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' corn.\n');
        Qty > 1 ->
            write(' corns.\n'),!
        ),
        substract_N_to_inventory(Qty,corn),
        Get is Qty * 50,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == goldfish ->
        inventory(goldfish,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough goldfishes. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' goldfish.\n');
        Qty > 1 ->
            write(' goldfishes.\n'),!
        ),
        substract_N_to_inventory(Qty,goldfish),
        Get is Qty * 75,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == catfish ->
        inventory(catfish,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough catfishes. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' catfish.\n');
        Qty > 1 ->
            write(' catfishes.\n'),!
        ),
        substract_N_to_inventory(Qty,catfish),
        Get is Qty * 75,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == gurame ->
        inventory(gurame,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough gouramies. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' gourami.\n');
        Qty > 1 ->
            write(' gouramies.\n'),!
        ),
        substract_N_to_inventory(Qty,gurame),
        Get is Qty * 75,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == tilapia ->
        inventory(tilapia,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough tilapias. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' tilapia.\n');
        Qty > 1 ->
            write(' tilapias.\n'),!
        ),
        substract_N_to_inventory(Qty,tilapia),
        Get is Qty * 75,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == parrotfish ->
        inventory(parrotfish,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough parrotfishes. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' parrotfish.\n');
        Qty > 1 ->
            write(' parrotfishes.\n'),!
        ),
        substract_N_to_inventory(Qty,parrotfish),
        Get is Qty * 75,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == eggs ->
        inventory(eggs,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough eggs. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' egg.\n');
        Qty > 1 ->
            write(' eggs.\n'),!
        ),
        substract_N_to_inventory_hasil(Qty,eggs),
        Get is Qty * 60,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n'); 
    Item == milk ->
        inventory(milk,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough milks. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' milk.\n');
        Qty > 1 ->
            write(' milks.\n'),!
        ),
        substract_N_to_inventory_hasil(Qty,milk),
        Get is Qty * 60,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n'); 
    Item == wool ->
        inventory(wool,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough wools. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' wool.\n');
        Qty > 1 ->
            write(' wools.\n'),!
        ),
        substract_N_to_inventory_hasil(Qty,wool),
        Get is Qty * 80,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n'); 
    Item == chicken ->
        inventory(chicken,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough chickens. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' chicken.\n');
        Qty > 1 ->
            write(' chickens.\n'),!
        ),
        substract_N_to_inventory_hasil(Qty,chicken),
        Get is Qty * 80,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');  
    Item == beef ->
        inventory(beef,B),
        Q is Qty,
        (B < Q ->
            write('You do not have enough beefs. Cancelling...\n\n'),
            market;
        B >= Q ->
            /*NONE*/
        !),
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' beef.\n');
        Qty > 1 ->
            write(' beefs.\n'),!
        ),
        substract_N_to_inventory_hasil(Qty,beef),
        Get is Qty * 100,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n')        
    ,!),
    goal_state,
    !.

money_plus(Y) :-
    (player_money(X) ->
        X1 is X+Y,
        retractall(player_money(X)),
        asserta(player_money(X1));
        asserta(player_money(Y))
    ).

money_minus(Y) :-
    (player_money(X) ->
        X1 is X-Y,
        retractall(player_money(X)),
        asserta(player_money(X1));
        asserta(player_money(Y))
    ).

displayMoney :-
    (player_money(X) ->
        write(X)
    ).