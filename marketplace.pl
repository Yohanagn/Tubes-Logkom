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
    write('12. goldfish (75 golds)\n'),
    write('13. catfish (75 golds)\n'),
    write('14. gurame (75 golds)\n'),
    write('15. tilapia (75 golds)\n'),
    write('16. parrotfish (75 golds)\n'),
    /* 
    equipment(hoe,farming,1).
    equipment(fishing_rod,fishing,1).
    equipment(fishing_net,fishing,1).
    equipment(bucket,ranching,1).
    equipment(knive,ranching,1).

    */
    write('17. Level '),
    equipment(hoe,farming,A),
    Lvl is A+1,
    write(Lvl),
    write(' hoe (500 golds)\n'),
    write('18. Level '),
    equipment(fishing_rod,fishing,A),
    Lvl is A+1,
    write(Lvl),
    write(' fishing_rod (500 golds)\n'),
    write('19. Level '),
    equipment(fishing_net,fishing,A),
    Lvl is A+1,
    write(Lvl),
    write(' fishing_net (500 golds)\n'),
    write('20. Level '),
    equipment(bucket,ranching,A),
    Lvl is A+1,
    write(Lvl),
    write(' bucket (500 golds)\n'),
    write('21. Level '),
    equipment(knive,ranching,A),
    Lvl is A+1,
    write(Lvl),
    write(' knive (500 golds)\n'),
    write('| ?- '),
    read(Itemnumber),
    Cnt is Itemnumber,
    (Cnt < 17 ->
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
    Cnt > 16 ->
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
        add_N_to_inventory(Qty,laying_hen),
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
        add_N_to_inventory(Qty,broiler_hen),
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
        add_N_to_inventory(Qty,beef_cattle),
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
        add_N_to_inventory(Qty,dairy_cow),
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
        add_N_to_inventory(Qty,sheep),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 12 ->
        Charged is Qty * 75,
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
            write(' goldfish.\n');
        Qty > 1 ->
            write(' goldfishes.\n'),!
        ),
        add_N_to_inventory(Qty,goldfish),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 13 ->
        Charged is Qty * 75,
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
            write(' catfish.\n');
        Qty > 1 ->
            write(' catfishes.\n'),!
        ),
        add_N_to_inventory(Qty,catfish),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 14 ->
        Charged is Qty * 75,
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
            write(' gourami.\n');
        Qty > 1 ->
            write(' gouramies.\n'),!
        ),
        add_N_to_inventory(Qty,gurame),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 15 ->
        Charged is Qty * 75,
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
            write(' tilapia.\n');
        Qty > 1 ->
            write(' tilapias.\n'),!
        ),
        add_N_to_inventory(Qty,tilapia),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 16 ->
        Charged is Qty * 75,
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
            write(' parrotfish.\n');
        Qty > 1 ->
            write(' parrotfishes.\n'),!
        ),
        add_N_to_inventory(Qty,parrotfish),
        money_minus(Charged),
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 17 ->
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
    Itemnumber == 18 ->
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
    Itemnumber == 19 ->
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
    Itemnumber == 20 ->
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
    Itemnumber == 21 ->
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

sell :-
    write('Here are the items in your inventory:\n'),
    displayInventory,
    write('What do you want to sell?\n\n'),
    write('| ?- '),
    read(Item),
    write('How many do you want to sell?\n\n'),
    write('| ?- '), 
    read(Qty),
    (Item == carrot ->
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
    Item == laying_hen ->
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' laying_hen.\n');
        Qty > 1 ->
            write(' laying_hens.\n'),!
        ),
        substract_N_to_inventory(Qty,laying_hen),
        Get is Qty * 100,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == broiler_hen ->
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' broiler_hen.\n');
        Qty > 1 ->
            write(' broiler_hens.\n'),!
        ),
        substract_N_to_inventory(Qty,broiler_hen),
        Get is Qty * 100,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == beef_cattle ->
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' beef_cattle.\n');
        Qty > 1 ->
            write(' beefs_cattle.\n'),!
        ),
        substract_N_to_inventory(Qty,beef_cattle),
        Get is Qty * 200,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == dairy_cow ->
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' dairy_cow.\n');
        Qty > 1 ->
            write(' dairy_cows.\n'),!
        ),
        substract_N_to_inventory(Qty,dairy_cow),
        Get is Qty * 250,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == sheep ->
        write('You sold '),
        write(Qty),
        (Qty == 1 ->
            write(' sheep.\n');
        Qty > 1 ->
            write(' sheeps.\n'),!
        ),
        substract_N_to_inventory(Qty,sheep),
        Get is Qty * 150,
        money_plus(Get),
        Q is -Qty,
        change_capacity_inventory(Q),
        write('You received '),
        write(Get),
        write(' golds.\n');
    Item == goldfish ->
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
        write(' golds.\n')
    ,!),
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