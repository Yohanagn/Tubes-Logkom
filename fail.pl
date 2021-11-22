player_money(20).

fail :-
    player_money(X),
    X < 20000,
    write('You have worked hard, but in the end result is all that matters. May God bless you in the future with kind people'),
    !.