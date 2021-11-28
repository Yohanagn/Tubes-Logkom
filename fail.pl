fail_state :-
    player_money(X),
    game_time(_,_,M),
    M > 12,
    X < 20000,
    write('You have worked hard, but in the end result is all that matters. May God bless you in the future with kind people'),
    halt.