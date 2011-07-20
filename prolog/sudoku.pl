%% Sudoku resolver
%% inspired by 'Seven Languages in Seven Weeks' by Bruce A. Tate
%% author Olli Sutinen <olli.sutinen@gmail.com>
:- use_module(library(clpfd)).

valid([]).
valid([Head|Tail]) :-
  clpfd:all_different(Head),
  Head ins 1..9,
  valid(Tail).

sudoku(Puzzle, Solution) :-
  Solution = Puzzle,
  Puzzle = [
    A1, B1, C1, D1, E1, F1, G1, H1, I1,
    A2, B2, C2, D2, E2, F2, G2, H2, I2,
    A3, B3, C3, D3, E3, F3, G3, H3, I3,
    A4, B4, C4, D4, E4, F4, G4, H4, I4,
    A5, B5, C5, D5, E5, F5, G5, H5, I5,
    A6, B6, C6, D6, E6, F6, G6, H6, I6,
    A7, B7, C7, D7, E7, F7, G7, H7, I7,
    A8, B8, C8, D8, E8, F8, G8, H8, I8,
    A9, B9, C9, D9, E9, F9, G9, H9, I9
  ],
  
  Row1 = [A1, B1, C1, D1, E1, F1, G1, H1, I1],
  Row2 = [A2, B2, C2, D2, E2, F2, G2, H2, I2],
  Row3 = [A3, B3, C3, D3, E3, F3, G3, H3, I3],
  Row4 = [A4, B4, C4, D4, E4, F4, G4, H4, I4],
  Row5 = [A5, B5, C5, D5, E5, F5, G5, H5, I5],
  Row6 = [A6, B6, C6, D6, E6, F6, G6, H6, I6],
  Row7 = [A7, B7, C7, D7, E7, F7, G7, H7, I7],
  Row8 = [A8, B8, C8, D8, E8, F8, G8, H8, I8],
  Row9 = [A9, B9, C9, D9, E9, F9, G9, H9, I9],

  Col1 = [A1, A2, A3, A4, A5, A6, A7, A8, A9],
  Col2 = [B1, B2, B3, B4, B5, B6, B7, B8, B9],
  Col3 = [C1, C2, C3, C4, C5, C6, C7, C8, C9],
  Col4 = [D1, D2, D3, D4, D5, D6, D7, D8, D9],
  Col5 = [E1, E2, E3, E4, E5, E6, E7, E8, E9],
  Col6 = [F1, F2, F3, F4, F5, F6, F7, F8, F9],
  Col7 = [G1, G2, G3, G4, G5, G6, G7, G8, G9],
  Col8 = [H1, H2, H3, H4, H5, H6, H7, H8, H9],
  Col9 = [I1, I2, I3, I4, I5, I6, I7, I8, I9],

  Sqr1 = [A1, B1, C1,
          A2, B2, C2,
          A3, B3, C3],
  Sqr2 = [D1, E1, F1,
          D2, E2, F2,
          D3, E3, F3],
  Sqr3 = [G1, H1, I1,
          G2, H2, I2,
          G3, H3, I3],
  Sqr4 = [A4, B4, C4, 
          A5, B5, C5, 
          A6, B6, C6], 
  Sqr5 = [D4, E4, F4, 
          D5, E5, F5, 
          D6, E6, F6], 
  Sqr6 = [G4, H4, I4,
          G5, H5, I5,
          G6, H6, I6],
  Sqr7 = [A7, B7, C7, 
          A8, B8, C8, 
          A9, B9, C9], 
  Sqr8 = [D7, E7, F7, 
          D8, E8, F8, 
          D9, E9, F9], 
  Sqr9 = [G7, H7, I7,
          G8, H8, I8,
          G9, H9, I9],

  valid([Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9, 
         Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, 
         Sqr1, Sqr2, Sqr3, Sqr4, Sqr5, Sqr6, Sqr7, Sqr8, Sqr9]),
  write(Solution).
