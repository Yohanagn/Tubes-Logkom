/* Bagian 1 */
/* Deklarasi Fakta */

:- dynamic(player_job/1).
:- dynamic(player_level/1).
:- dynamic(player_tools/2).
:- dynamic(player_specialty/2).
:- dynamic(player_money/1).
:- dynamic(player_totalexp/1).
:- dynamic(player_expperspecialty/2).
:- dynamic(player_position/2).

job(farmer).
job(fisherman).
job(rancher).

player_money(0).
player_totalexp(0).
player_level(1).

job_farmer :-
    asserta(player_job(farmer)),
    asserta(player_specialty(farmer, 1)),
    asserta(player_expperspecialty(farmer, 0)),
    asserta(player_tools(A, farmer)).

job_fisherman :-
    asserta(player_job(fisherman)),
    asserta(player_specialty(fisherman, 1)),
    asserta(player_expperspecialty(fisherman, 0)),
    asserta(player_tools(A, fisherman)).

job_rancher :-
    asserta(player_job(rancher)),
    asserta(player_specialty(rancher, 1)),
    asserta(player_expperspecialty(rancher, 0)),
    asserta(player_tools(A, rancher)).

tambah_exptotal(Level, Tambah_exp, LevelUp) :-
    player_level(Level),
    player_totalexp(E),
    TotalExp is E + Tambah_exp,
    asserta(player_totalexp(TotalExp), retract(player_totalexp(E))),
    (TotalExp >=  Level*50 -> LevelUp is 1),
    writeln('Level Up!'), writeln('Now, You are in Level '), write(Level); LevelUp is 0).

player_statusincrease(Level, Tambah_exp) :-
    tambah_exptotal(Level, Tambah_exp, LevelUp),
    LevelUp == 1;
    player_specialty(Specialty),
    NewSpecialty is Specialty + 1,
    asserta(player_specialty(NewSpecialty), retract(player_specialty(Specialty))).

initiate_playerpost :- X is 1, Y is 1 asserta(player_position(X,Y)).

initiate_playerjob(X) :-
    X =:= 1,
    asserta(player_job(1)),
    asserta(player_level(1)),
    asserta(player_tools(A, farmer)),
    asserta(player_expperspecialty(0)),!.

initiate_playerjob(X) :-
    X =:= 2,
    asserta(player_job(2)),
    asserta(player_level(1)),
    asserta(player_tools(A, fisherman)),
    asserta(player_expperspecialty(0)),!.

initiate_playerjob(X) :-
    X =:= 3,
    asserta(player_job(3)),
    asserta(player_level(1)),
    asserta(player_tools(A, rancher)),
    asserta(player_expperspecialty(0)),!.

total_exp :-
    player_totalexp(E),
    asserta(player_expperspecialty(farmer, Exp1)),
    asserta(player_expperspecialty(fisherman, Exp2)),
    asserta(player_expperspecialty(rancher, Exp3)),
    NewExp is E + Exp1 + Exp2 + Exp3,
    asserta(player_totalexp(NewExp), retract(player_totalexp(E))), !.

tambah_expperspecialty(X, ExpNow) :-
    X =:= 1,
    asserta(player_job(1)),
    asserta(player_expperspecialty(farmer, Exp)),
    NewExp is Exp + ExpNow,
    asserta(tambah_expperspecialty(farmer, NewExp), retract(tambah_expperspecialty(X, ExpNow))),!.

tambah_expperspecialty(X, ExpNow) :-
    X =:= 2,
    asserta(player_job(2)),
    asserta(player_expperspecialty(fisherman, Exp)),
    NewExp is Exp + ExpNow,
    asserta(tambah_expperspecialty(fisherman, NewExp), retract(tambah_expperspecialty(X, ExpNow))),!.

tambah_expperspecialty(X, ExpNow) :-
    X =:= 3,
    asserta(player_job(3)),
    asserta(player_expperspecialty(rancher, Exp)),
    NewExp is Exp + ExpNow,
    asserta(tambah_expperspecialty(rancher, NewExp), retract(tambah_expperspecialty(X, ExpNow))),!.

perubahan_uang(Money) :-
    asserta(player_money(Uang)),
    TotalMoney is Money + Uang,
    asserta(player_money(TotalMoney), retract(player_money(Uang))),!.

    





    
    
    
    
    
    
    

