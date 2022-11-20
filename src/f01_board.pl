
:- dynamic(grid/3).

/* posisi pemain 1 dan pemain 2, default position == 0 (GO) */

/* map tile index, 0 is 'GO', 31 is 'H2'*/
tile(0, go).
tile(1, a1).
tile(2, a2).
tile(3, a3).
tile(4, cc).
tile(5, b1).
tile(6, b2).
tile(7, b3).
tile(8, jl).
tile(9, c1).
tile(10, c2).
tile(11, c3).
tile(12, tx).
tile(13, d1).
tile(14, d2).
tile(15, d3).
tile(16, fp).
tile(17, e1).
tile(18, e2).
tile(19, e3).
tile(20, cc).
tile(21, f1).
tile(22, f2).
tile(23, f3).
tile(24, f4).
tile(25, g1).
tile(26, g2).
tile(27, g3).
tile(28, tx).
tile(29, cf).
tile(30, h1).
tile(31, h2).

/* map grids row x, col y */
/* grid[1-9][1-9] are constants */
/* grid[0][_], grid[10][_], grid[_][0], grid[_][10] hold property count */
grid(0, 0, '  ').
grid(0, 1, '  ').
grid(0, 2, '  ').
grid(0, 3, '  ').
grid(0, 4, '  ').
grid(0, 5, '  ').
grid(0, 6, '  ').
grid(0, 7, '  ').
grid(0, 8, '  ').
grid(0, 9, '  ').
grid(0, 10, '  ').

grid(1, 0, '  ').
grid(1, 1, ' | FP |').
grid(1, 2, ' E1 |').
grid(1, 3, ' E2 |').
grid(1, 4, ' E3 |').
grid(1, 5, ' CC |').
grid(1, 6, ' F1 |').
grid(1, 7, ' F2 |').
grid(1, 8, ' F3 |').
grid(1, 9, ' WT | ').
grid(1, 10, '  ').

grid(2, 0, '  ').
grid(2, 1, ' | D3 |').
grid(2, 2, '-----').
grid(2, 3, '-----').
grid(2, 4, '-----').
grid(2, 5, '-----').
grid(2, 6, '-----').
grid(2, 7, '-----').
grid(2, 8, '----|').
grid(2, 9, ' G1 | ').
grid(2, 10, '  ').

grid(3, 0, '  ').
grid(3, 1, ' | D2 |').
grid(3, 2, '     ').
grid(3, 3, '     ').
grid(3, 4, '     ').
grid(3, 5, '     ').
grid(3, 6, '     ').
grid(3, 7, '     ').
grid(3, 8, '    |').
grid(3, 9, ' G2 | ').
grid(3, 10, '  ').

grid(4, 0, '  ').
grid(4, 1, ' | D1 |').
grid(4, 2, '     ').
grid(4, 3, '     ').
grid(4, 4, '     ').
grid(4, 5, '     ').
grid(4, 6, '     ').
grid(4, 7, '     ').
grid(4, 8, '    |').
grid(4, 9, ' G3 | ').
grid(4, 10, '  ').

grid(5, 0, '  ').
grid(5, 1, ' | TX |').
grid(5, 2, '     ').
grid(5, 3, '     ').
grid(5, 4, 'M O N').
grid(5, 5, ' O P ').
grid(5, 6, 'O L Y').
grid(5, 7, '     ').
grid(5, 8, '    |').
grid(5, 9, ' TX | ').
grid(5, 10, '  ').

grid(6, 0, '  ').
grid(6, 1, ' | C3 |').
grid(6, 2, '     ').
grid(6, 3, '     ').
grid(6, 4, '     ').
grid(6, 5, '     ').
grid(6, 6, '     ').
grid(6, 7, '     ').
grid(6, 8, '    |').
grid(6, 9, ' CF | ').
grid(6, 10, '  ').

grid(7, 0, '  ').
grid(7, 1, ' | C2 |').
grid(7, 2, '     ').
grid(7, 3, '     ').
grid(7, 4, '     ').
grid(7, 5, '     ').
grid(7, 6, '     ').
grid(7, 7, '     ').
grid(7, 8, '    |').
grid(7, 9, ' H1 | ').
grid(7, 10, '  ').

grid(8, 0, '  ').
grid(8, 1, ' | C1 |').
grid(8, 2, '-----').
grid(8, 3, '-----').
grid(8, 4, '-----').
grid(8, 5, '-----').
grid(8, 6, '-----').
grid(8, 7, '-----').
grid(8, 8, '----|').
grid(8, 9, ' H2 | ').
grid(8, 10, '  ').

grid(9, 0, '  ').
grid(9, 1, ' | JL |').
grid(9, 2, ' B3 |').
grid(9, 3, ' B2 |').
grid(9, 4, ' B1 |').
grid(9, 5, ' CC |').
grid(9, 6, ' A3 |').
grid(9, 7, ' A2 |').
grid(9, 8, ' A1 |').
grid(9, 9, ' GO | ').
grid(9, 10, '  ').

grid(10, 0, '  ').
grid(10, 1, '  ').
grid(10, 2, '  ').
grid(10, 3, '  ').
grid(10, 4, '  ').
grid(10, 5, '  ').
grid(10, 6, '  ').
grid(10, 7, '  ').
grid(10, 8, '  ').
grid(10, 9, '  ').
grid(10, 10, '  ').


/*
ROW/COL
    0     1    2    3    4    5    6    7    8    9    10
0
1       | FP | E1 | E2 | E3 | CC | F1 | F2 | F3 | WT | 
2       | D3 |----------------------------------| G1 | 
3       | D2 |                                  | G2 | 
4       | D1 |                                  | G3 | 
5       | TX |          M O N O P O L Y         | TX | 
6       | C3 |                                  | CF | 
7       | C2 |                                  | H1 | 
8       | C1 |----------------------------------| H2 | 
9       | JL | B3 | B2 | B1 | CC | A3 | A2 | A1 | GO | 
10
*/

border :- write('    ----------------------------------------------    '), nl, !.

padding(R) :-
    R=:=0, write('   '), !.
padding(R) :-
    R=:=10, write('   '), !.
padding(R) :-
    R\=0, R\=10, !.

write_grid(R, C) :- grid(Row, Col, Info), R=:=Row, C=:=Col, write(Info), !.

write_cols(Row, StartCol) :-
    StartCol =:= 10, 
    write_grid(Row, StartCol), !.
write_cols(Row, StartCol) :-
    StartCol<10, StartCol>=0, 
    write_grid(Row, StartCol), padding(Row),
    NextCol is StartCol+1, write_cols(Row, NextCol).
    
write_playerinfo :-
    locPlayer(1, Pos1), locPlayer(2, Pos2), 
    tile(Pos1, P1), tile(Pos2, P2),
    write('    Posisi pemain:'), nl,
    write('    1 = '), write(P1), nl,
    write('    2 = '), write(P2), nl,
    !.

/* write map */
map :- 
    write(' '), write_cols(0, 0), write(' '), nl,
    border,
    write(' '), write_cols(1, 0), write(' '), nl,
    write(' '), write_cols(2, 0), write(' '), nl,
    write(' '), write_cols(3, 0), write(' '), nl,
    write(' '), write_cols(4, 0), write(' '), nl,
    write(' '), write_cols(5, 0), write(' '), nl,
    write(' '), write_cols(6, 0), write(' '), nl,
    write(' '), write_cols(7, 0), write(' '), nl,
    write(' '), write_cols(8, 0), write(' '), nl,
    write(' '), write_cols(9, 0), write(' '), nl,
    border,
    write(' '), write_cols(10, 0), write(' '), nl,

    write_playerinfo,
    !.


/* move player and build property demo */
/* chore: link player movement and property ownership */
buy :- retract(grid(0,3,_Info)), asserta(grid(0,3,'10')), !.
sell :- retract(grid(0,3,_Info)), asserta(grid(0,3,'  ')), !.