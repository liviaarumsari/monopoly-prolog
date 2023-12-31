/* 
Minigame berupa coin flip. Implementasi dari bonus ini adalah dengan mengganti salah satu kotak pada papan menjadi kotak coin flip. Pemain yang menginjak kotak ini dapat memainkan mini game berupa coin flip dengan aturan sebagai berikut:
Pemain menebak koin yang dilempar (head/tail).
Jika pemain menebak dengan benar, pemain dapat menebak untuk berikutnya sampai maksimal 3 kali. Jika salah, coin flip diakhiri.
Di akhir minigame, pemain diberikan uang yang sebanding dengan jumlah tebakan yang benar.
*/
/* FAKTA: indeks muka koin */
coin_side(head, 0).
coin_side(tail, 1).

/* RULE */
guessFlip(Success, Iter) :-
    currentPlayer(PP),
    cashPlayer(P, Money),
    PP == P,
    random(0, 2, Index),
    coin_side(Face, Index),

    write('Guess \'head\' or \'tail\': '), read(Guess), nl,
    write('You guessed '), write(Guess), write('...'), nl,
    write('The correct answer is '), write(Face), write('.'), nl,

    (Guess == Face -> 
        (
            NMoney is 2000 * (3-Iter + 1),
            incCash(NMoney, PP),
            Success is 1
        ) ;
        (
            write('You guessed incorrectly!'), nl,
            Success is 0
        )
    ), nl,
    !.

loopGuess(Iter, Success) :-
    (Iter =< 0; Success=:=0), write('Coin flip game is over!'), !.
loopGuess(Iter, Success) :-
    Iter > 0, Success=:=1, guessFlip(Success1, Iter),
    Iter1 is Iter-1, loopGuess(Iter1, Success1).

playCoinFlip :-
    currentPlayer(X), locPlayer(X, 29),
    write('Flip a coin up to three times!'), nl,
    write('Guess right (\'head\' or \'tail\') to earn money and flip again.'), nl,
    write('Reward: 2000, 4000, 6000 per correct answer.'), nl,
    write('Guess wrong and your turn is over.'), nl, nl,
    loopGuess(3, 1),
    !.
playCoinFlip :- !.