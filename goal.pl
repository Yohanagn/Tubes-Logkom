player_money(200000).

goal :-
    player_money(X),
    X >= 20000,
    write('Congratulations! You have finally collected 20000 golds!Congratulations! You have finally collected 20000 golds!'),
    !.