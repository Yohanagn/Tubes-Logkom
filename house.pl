/* Fact - Dynamic Variable */
:- dynamic(insideHouse/1).
:- dynamic(diary/3).

/* Rules */
house :-
    /* cek posisi ada di house
    player_position(Xp,Yp),
    point(X,Y,house),
    Xp is X, Yp is Y,
    */
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

writeDiary :-
    insideHouse(_), nl,
    game_time(_,D,M),
    write('Write your diary for '), displayDate, nl,
    write('Content: '),
    read(Content),
    asserta(diary(Content,D,M)),
    write('Day '), displayDate, write(' entry saved'), nl, !.

readDiary :-
    insideHouse(_), nl,
    write('Here are the list of your entries:'), nl,
    forall(diary(_,D,M),(
        TotalDay is ((30 * (M-1))+D),
		write('- Day '), write(TotalDay), write(' ('), write(D), write('/'), write(M), write('/2021) Diary'), nl)),
    write('Which entry do you want to read?\n'),
    write('Day: '),
    read(Day),
    write('Here is your entry for day '), write(Day), nl,
    write('Content:\n'),
    D is (Day mod 30), M is ((Day div 30) + 1),
    forall(diary(Content,D,M),(
        write('    '), write(Content), nl)), !.