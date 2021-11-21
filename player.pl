/* Bagian 1 */
/* Deklarasi Fakta */

:- dynamic(player_job/1).
:- dynamic(player_level/1).
:- dynamic(player_levelperspecialty/2).
:- dynamic(player_tools/2).
:- dynamic(player_money/1).
:- dynamic(player_totalexp/1).
:- dynamic(player_expperspecialty/2).
:- dynamic(player_position/2).

player_job(farmer).
player_job(fisherman).
player_job(rancher).

initiate_playerstatus :-
    asserta(player_money(0)),
    asserta(player_level(1)),
    asserta(player_totalexp(0)).

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

initiate_playerpost :- X is 1, Y is 1, asserta(player_position(X,Y)).

initiatePlayerjob(X) :-
    X =:= 1,
    asserta(player_job(farmer)),
    asserta(player_levelperspecialty(1)),
    asserta(player_tools(cangkul, farmer)),
    asserta(player_expperspecialty(0)),!.

initiatePlayerjob(X) :-
    X =:= 2,
    asserta(player_job(fisherman)),
    asserta(player_levelperspecialty(1)),
    asserta(player_tools(pancingan, fisherman)),
    asserta(player_tools(jala, fisherman)),
    asserta(player_expperspecialty(0)),!.

initiatePlayerjob(X) :-
    X =:= 3,
    asserta(player_job(rancher)),
    asserta(player_levelperspecialty(1)),
    asserta(player_tools(ember, rancher)),
    asserta(player_tools(pisau, rancher)),
    asserta(player_expperspecialty(0)),!.

tambahExpperspecialty(Job, ExpNow, LevelUp, Level) :-
    asserta(player_levelperspecialty(Level)),
    asserta(player_job(Job)),
    asserta(player_expperspecialty(Job, Exp)),
    NewExp is Exp + ExpNow,
    asserta(player_expperspecialty(Job, NewExp), retract(player_expperspecialty(Job, Exp))),
    (NewExp >=  Level*50 -> LevelUp is 1),
    writeln('Level Up!'), writeln('Now, You are in Level '), write(Level), write('as a'), write(player_job(Job)); LevelUp is 0,!.

tambahExpperspecialty(Job, ExpNow, LevelUp, Level) :-
    asserta(player_levelperspecialty(Level)),
    asserta(player_job(Job)),
    asserta(player_expperspecialty(Job, Exp)),
    NewExp is Exp + ExpNow,
    asserta(player_expperspecialty(Job, NewExp), retract(player_expperspecialty(Job, Exp))),
    (TotalExp >=  2500 -> LevelUp is 1),
    writeln('Level Up!'), writeln('Now, You are in Level '), write(Level), write('as a'), write(player_job(farmer)), writeln('Congratulations! You have reached the Maximum Level at This Game'); LevelUp is 0,!.

perubahanUang(Money) :-
    asserta(player_money(Uang)),
    TotalMoney is Money + Uang,
    asserta(player_money(TotalMoney), retract(player_money(Uang))),!.

totalExp(Exp, Level, LevelUp) :-
    asserta(player_level(Level)),
    asserta(player_expperspecialty(farmer, Exp1)),
    asserta(player_expperspecialty(fisherman, Exp2)),
    asserta(player_expperspecialty(rancher, Exp3)),
    ExpNow is Exp + Exp1 + Exp2 + Exp3,
    asserta(total_exp(ExpNow), retract(total_exp(Exp))),
    (ExpNow >=  Level*50 -> LevelUp is 1),
    writeln('Level Up!'), writeln('Now, You are in Level '), write(Level); LevelUp is 0,!.

totalExp(Exp, Level, LevelUp) :-
    asserta(player_level(Level)),
    asserta(player_expperspecialty(farmer, Exp1)),
    asserta(player_expperspecialty(fisherman, Exp2)),
    asserta(player_expperspecialty(rancher, Exp3)),
    ExpNow is Exp + Exp1 + Exp2 + Exp3,
    asserta(total_exp(ExpNow), retract(total_exp(Exp))),
    (ExpNow >= 2500 -> LevelUp is 1),
    writeln('Level Up!'), writeln('Now, You are in Level '), write(Level), writeln('Congratulations! You have reached the Maximum Level at This Game'); LevelUp is 0,!.

displayStatus :-
    player_level(Level), player_totalexp(Exp), player_money(Money), 
    player_expperspecialty(farmer, Exp1), player_expperspecialty(fisherman, Exp2), player_expperspecialty(rancher, Exp3),
    player_levelperspecialty(farmer, Level1), player_levelperspecialty(fisherman, Level2), player_levelperspecialty(rancher, Level3),
    writeln('Your Status : '),
    writeln('Level :'), write(Level),
    writeln('Level Farming : '), write(Level1),
    writeln('Exp Farming : '), write(Exp1),
    writeln('Level Fishing : '), write(Level2),
    writeln('Exp Fishing : '), write(Exp2),
    writeln('Level Ranching : '), write(Level3),
    writeln('Exp Ranching : '), write(Exp3),
    writeln('Exp : '), write(Exp),
    writeln('Money : '), write(Money), !.


    





    
    
    
    
    
    
    

