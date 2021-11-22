/* Fakta */

/* Fact - Dynamic Variable */
:- dynamic(insideHouse/1).

/* Rules */
house :-

    asserta(insideHouse(true)),
    write('Wellcome home!!\n'),
    write('What do you want to do?\n'),
    write('- sleep\n'),
    write('- writeDiary\n'),
    write('- readDiary\n'),
    write('- exit\n'),
    write('Choice: '),
    read(Ans),
    (Ans == sleep ->
        sleeping;
    Ans == writeDiary ->
        writeDiary;
    Ans == readDiary ->
        readDiary;
    Ans == exit ->
        exitHouse, !), !.

sleeping :-
    insideHouse(_), nl,
    write('You went to sleep...\n'), nl,
    write(' Z...\n'),
    write('     Z...\n'),
    write('         Z...\n'), nl,
    updateTime(24),
    displayTime, nl,
    musim(M), cuaca(C),
    write('Season: '), write(M), nl, 
    write('Cuaca: '), write(C), nl, nl, !.

exitHouse :-
    insideHouse(_), nl,
    write('Leaving home...\n'),
    retractall(insideHouse(_)), !.