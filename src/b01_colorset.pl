/* Bonus 1 : Colorset */

/* dynamic predicate */
:-dynamic(list_colorset/1).
:-dynamic(colorsets/1).
:-dynamic(temp_list/1).

/* initialize dynamic predicates */
list_colorset([]).
colorsets([]).
temp_list([]).

/* deklarasi colorset */
colorset(a, [a1,a2,a3]).
colorset(b, [b1,b2,b3]).
colorset(c, [c1,c2,c3]).
colorset(d, [d1,d2,d3]).
colorset(e, [e1,e2,e3]).
colorset(f, [f1,f2,f3]).
colorset(g, [g1,g2,g3]).
colorset(h, [h1,h2]).

checkColorset :-
    listPropPlayer(1,PropPlayer1),
    listPropPlayer(2,PropPlayer2),
    colorsetMechanism(PropPlayer1),
    colorsetMechanism(PropPlayer2).

colorsetMechanism(PropPlayer) :-
    /* reset colorsets */
    retractall(colorsets(_)),
    asserta(colorsets([a,b,c,d,e,f,g,h])),

    /* loop for every colorsets */
    repeat, 
        /* Color to process */
        colorsets([Color|TailColorsets]),

        /* List of Color */
        colorset(Color, ListColorsetColor),
        
        list_colorset(ListColorset),

        subset(ListColorsetColor, PropPlayer, Verdict),
        isIn(Color, ListColorset, IsInList),
        /* if ListColorsetColor subset of PropPlayer */
        (Verdict == 1 -> 
        (
            /* if Color not in ListColorset */
            IsInList == 0 -> (
                retractall(list_colorset(_)),
                insertLast(Color, ListColorset, NewListColorsetTrue),
                assertz(list_colorset(NewListColorsetTrue)),
                upgradePrice(Color),
                write('Colorset '),
                write(Color),
                write(' price has been upgraded'),nl
            );!
        ); 
        /* else */
        (
            /* if Color in List Colorset */
            IsInList == 1 -> (
                retractall(list_colorset(_)),
                getIndex(ListColorset, Color, Index),
                deleteAtList(Index, ListColorset, NewListColorsetFalse),
                assertz(list_colorset(NewListColorsetFalse)),
                downgradePrice(Color),
                write('Colorset '),
                write(Color),
                write(' price has been downgraded'),nl
            );!
        )),

        retractall(colorsets(_)),
        asserta(colorsets(TailColorsets)),
    
    TailColorsets == [],!.
    
upgradePrice(Colorset) :- 
    colorset(Colorset, ListColorsetColor),
    retractall(temp_list(_)),
    asserta(temp_list(ListColorsetColor)),
    
    repeat,
        temp_list([Head|Tail]),

        forall(hargaBeli(Head,Type,_), 
            (
                hargaBeli(Head,Type,X),
                NewX is X * 2,
                retractall(hargaBeli(Head,Type,X)),
                asserta(hargaBeli(Head,Type,NewX))
            )
        ),

        retractall(temp_list(_)),
        asserta(temp_list(Tail)),

    Tail == [],!.

downgradePrice(Colorset) :- 
    colorset(Colorset, ListColorsetColor),
    retractall(temp_list(_)),
    asserta(temp_list(ListColorsetColor)),
    
    repeat,
        temp_list([Head|Tail]),

        forall(hargaBeli(Head,Type,_), 
            (
                hargaBeli(Head,Type,X),
                NewX is X / 2,
                retractall(hargaBeli(Head,Type,X)),
                asserta(hargaBeli(Head,Type,NewX))
            )
        ),

        retractall(temp_list(_)),
        asserta(temp_list(Tail)),

    Tail == [],!.
