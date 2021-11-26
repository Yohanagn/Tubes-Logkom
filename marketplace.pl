:- include('player.pl').
:- include('inventory.pl').
market :-
    write('What do you want to do?\n1. Buy\n2. Sell\n\n'),
    write('| ?- '),
    read(Action),
    (Action == buy ->
        buy;
    Action == sell ->
        sel, !),
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
    write('16. parrotfish (75 golds)\n\n'),
    write('| ?- '),
    read(Itemnumber),
    write('How many do you want to buy?\n\n'),
    write('| ?- '), 
    read(Qty),
    (Itemnumber == 1 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' carrot.\n');
        Qty > 1 ->
            write(' carrots.\n'),!
        ),
        Charged is Qty * 50,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 2 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' potato.\n');
        Qty > 1 ->
            write(' potatoes.\n'),!
        ),
        Charged is Qty * 50,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 3 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' wheat.\n');
        Qty > 1 ->
            write(' wheats.\n'),!
        ),
        Charged is Qty * 50,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 4 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' paddy.\n');
        Qty > 1 ->
            write(' paddies.\n'),!
        ),
        Charged is Qty * 50,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 5 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' cassava.\n');
        Qty > 1 ->
            write(' cassavas.\n'),!
        ),
        Charged is Qty * 50,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 6 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' corn.\n');
        Qty > 1 ->
            write(' corns.\n'),!
        ),
        Charged is Qty * 50,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 7 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' laying_hen.\n');
        Qty > 1 ->
            write(' laying_hens.\n'),!
        ),
        Charged is Qty * 100,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 8 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' broiler_hen.\n');
        Qty > 1 ->
            write(' broiler_hens.\n'),!
        ),
        Charged is Qty * 100,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 9 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' beef_cattle.\n');
        Qty > 1 ->
            write(' beefs_cattle.\n'),!
        ),
        Charged is Qty * 200,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 10 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' dairy_cow.\n');
        Qty > 1 ->
            write(' dairy_cows.\n'),!
        ),
        Charged is Qty * 250,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 11 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' sheep.\n');
        Qty > 1 ->
            write(' sheeps.\n'),!
        ),
        Charged is Qty * 150,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 12 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' goldfish.\n');
        Qty > 1 ->
            write(' goldfishes.\n'),!
        ),
        Charged is Qty * 75,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 13 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' catfish.\n');
        Qty > 1 ->
            write(' catfishes.\n'),!
        ),
        Charged is Qty * 75,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 14 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' gourami.\n');
        Qty > 1 ->
            write(' gouramies.\n'),!
        ),
        Charged is Qty * 75,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 15 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' tilapia.\n');
        Qty > 1 ->
            write(' tilapias.\n'),!
        ),
        Charged is Qty * 75,
        write('You are charged '),
        write(Charged),
        write(' golds.\n');
    Itemnumber == 16 ->
        write('You have bought '),
        write(Qty),
        (Qty == 1 ->
            write(' parrotfish.\n');
        Qty > 1 ->
            write(' parrotfishes.\n'),!
        ),
        Charged is Qty * 75,
        write('You are charged '),
        write(Charged),
        write(' golds.\n')
    ,!),
    !.



sell :-
    write('What do you want to sell?\n'),
    write('1. carrot (60 golds)\n'),
    write('2. potato (60 golds)\n'),
    write('3. wheat (60 golds)\n'),
    write('4. paddy (60 golds)\n'),
    write('5. cassava (60 golds)\n'),
    write('6. corn (60 golds)\n'),
    write('7. laying_hen (110 golds)\n'),
    write('8. broiler_hen (110 golds)\n'),
    write('9. beef_cattle (210 golds)\n'),
    write('10. dairy_cow (260 golds)\n'),
    write('11. sheep (160 golds)\n'),
    write('12. goldfish (85 golds)\n'),
    write('13. catfish (85 golds)\n'),
    write('14. gurame (85 golds)\n'),
    write('15. tilapia (85 golds)\n'),
    write('16. parrotfish (85 golds)\n'),
    !.