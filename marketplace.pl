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
        write(' carrot.\n'),
        write('You are charged 50 golds.\n');
    Itemnumber == 2 ->
        write('You have bought '),
        write(Qty),
        write(' potato.\n'),
        write('You are charged 50 golds.\n');
    Itemnumber == 3 ->
        write('You have bought '),
        write(Qty),
        write(' wheat.\n'),
        write('You are charged 50 golds.\n');
    Itemnumber == 4 ->
        write('You have bought '),
        write(Qty),
        write(' paddy.\n'),
        write('You are charged 50 golds.\n');
    Itemnumber == 5 ->
        write('You have bought '),
        write(Qty),
        write(' cassava.\n'),
        write('You are charged 50 golds.\n');
    Itemnumber == 6 ->
        write('You have bought '),
        write(Qty),
        write(' corn.\n'),
        write('You are charged 50 golds.\n');
    Itemnumber == 7 ->
        write('You have bought '),
        write(Qty),
        write(' laying_hen.\n'),
        write('You are charged 100 golds.\n');
    Itemnumber == 8 ->
        write('You have bought '),
        write(Qty),
        write(' broiler_hen.\n'),
        write('You are charged 100 golds.\n');
    Itemnumber == 9 ->
        write('You have bought '),
        write(Qty),
        write(' beef_cattle.\n'),
        write('You are charged 200 golds.\n');
    Itemnumber == 10 ->
        write('You have bought '),
        write(Qty),
        write(' dairy_cow.\n'),
        write('You are charged 250 golds.\n');
    Itemnumber == 11 ->
        write('You have bought '),
        write(Qty),
        write(' sheep.\n'),
        write('You are charged 150 golds.\n');
    Itemnumber == 12 ->
        write('You have bought '),
        write(Qty),
        write(' goldfish.\n'),
        write('You are charged 75 golds.\n');
    Itemnumber == 13 ->
        write('You have bought '),
        write(Qty),
        write(' catfish.\n'),
        write('You are charged 75 golds.\n');
    Itemnumber == 14 ->
        write('You have bought '),
        write(Qty),
        write(' gurame.\n'),
        write('You are charged 75 golds.\n');
    Itemnumber == 15 ->
        write('You have bought '),
        write(Qty),
        write(' tilapia.\n'),
        write('You are charged 75 golds.\n');
    Itemnumber == 16 ->
        write('You have bought '),
        write(Qty),
        write(' parrotfish.\n'),
        write('You are charged 75 golds.\n')
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