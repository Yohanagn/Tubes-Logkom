/* Fact - Dynamic Variable */
:- dynamic(insideHouse/1).
:- dynamic(diary/1).
:- dynamic(isDiaryHeader/1).
:- dynamic(writingDiary/1).

/* Rules */
house :-
    /* cek posisi ada di house */
    player_position(Xp,Yp),
    point(X,Y,house),
    Xp is X, Yp is Y,
    asserta(insideHouse(true)),
    write('Welcome home!!\n'),
    houseMenu(1), !.
house :- 
    player_position(Xp,Yp),
    point(X,Y,house),
    Xp =\= X, Yp =\= Y,
    write('You are currently not at home!'), nl, !.
    
houseMenu(X) :-
    X is 1,
    write('What do you want to do?\n'),
    write('- sleep\n'),
    write('- writeDiary\n'),
    write('- readDiary\n'),
    write('- exit\n'),
    write('Choice: '),
    read(Ans),
    (Ans == sleep ->
        sleep,
        X1 is 1;
    Ans == writeDiary ->
        writeDiary,
        X1 is 1;
    Ans == readDiary ->
        readDiary,
        X1 is 1;
    Ans == exit ->
        exit, 
        X1 is 0), nl, 
    houseMenu(X1), !.

sleep :-
    insideHouse(_), nl,
    write('You went to sleep...\n'), nl,
    write(' Z...\n'),
    write('     Z...\n'),
    write('         Z...\n'), nl,
    random(0,10,Peri),
    (Peri > 4 ->
        periTidur; 
    Peri < 5 ->
        /*NONE*/    
    !),
    updateTime(24),
    write('You wake up at '), displayTime, nl,
    write('Today is '), displayDate, nl,
    musim(M), cuaca(C),
    write(' Season: '), write(M), nl, 
    write(' Weather: '), write(C), nl, nl.

periTidur :-
    write('Hi, I am sleeping fairy.\nI offer you to move anywhere you like.\nWhere do you want to go?\n'),
    write('< type quest or house or market or ranch >\n'),
    write('| ?- '),
    read(Place), point(_,_,Place), 
    write('You can go to the '),
    write(Place),
    write(' area now!\n\n'),!.

exit :-
    insideHouse(_), nl,
    write('Leaving home...\n'),
    retractall(insideHouse(_)), !.

writeDiary :-
    insideHouse(_), nl,
    game_time(H,D,M),
    TotalDay is ((30 * (M-1))+D),
    write('Write your diary for day '), write(TotalDay), write(' ('), displayDate, write(')'), nl,
    write('!!! Make sure to use quotation mark ('') for each sentence !!!'), nl,
    write('!!! Example: \'This is a sample diary\'. !!!'), nl,
    write('!!! Type \'done\' when you are finished !!!'), nl,
    write('Content: '),
    open(diary,append,File),
    write(File,'header.'), nl(File),
    write(File,TotalDay), write(File,'.'), nl(File),
    write(File,'\''), write(File,H), write(File,':00 - '), write(File,D), write(File,'/'), write(File,M), write(File,'/2021\'.'), nl(File),
    repeat,
    read(X),
    tab(9),
    write(File,'\''), write(File, X), write(File,'\'.'), nl(File),
    X = done, !,
    close(File), nl,
    /* read(Content),
    asserta(diary(Content,D,M)), */
    write('Day '), write(TotalDay), write(' ('), displayDate, write(') entry saved'), nl.

readDiary :-
    insideHouse(_), nl,
    write('Here are the list of your entries:'), nl,
    readHeader,
    write('Which entry do you want to read? Day: '),
    readContent, nl.

readHeader :-
    retractall(isDiaryHeader(_)),
    open(diary,read,File),
    repeat,
    read(File,X),
    (X == header ->
    write(''),
    asserta(isDiaryHeader(true))
    ;
    isDiaryHeader(_) ->
    read(File,Y),
    write('- Day '), write(X), write(' ('), write(Y), write(')'), nl,
    asserta(diary(X)),
    retractall(isDiaryHeader(_))
    ;
    write('')),
    X = end_of_file, !,
    close(File).

readContent :-
    retractall(writingDiary(_)),
    read(Day), nl,
    write('Here is your entry for day '), write(Day), write(':'), nl,
    open(diary,read,File),
    diary(Day),
    repeat,
    read(File,Line),
    ( Line == Day ->
    asserta(writingDiary(true))
    ;
    writingDiary(_) ->
        (Line == done ->
        retractall(writingDiary(_))
        ;
        write(Line), nl)
    ;
    write('') ),
    Line = end_of_file, !,
    close(File).

clearDiary :-
    open(diary,write,File),
    write(File,'').