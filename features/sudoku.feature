Feature: Sudoku
  In order to get a sudoku resolved
  As a sudoku addict
  I want to be able to check the solved puzzle

Scenario: A partially completed sudoku
  When I enter the following partially completed sudoku to the resolver:
    | a | b | c | d | e | f | g | h | i |
    |   | 4 | 7 | 2 | 5 | 8 | 3 | 6 | 9 |
    | 2 | 5 | 8 | 3 | 6 | 9 | 4 |   | 1 |
    | 3 | 6 | 9 |   | 7 | 1 | 5 | 8 | 2 |
    | 4 | 7 | 1 |   | 8 | 2 | 6 | 9 | 3 |
    | 5 | 8 |   | 6 | 9 | 3 | 7 | 1 | 4 |
    | 6 | 9 | 3 | 7 | 1 | 4 |   | 2 | 5 |
    | 7 | 1 | 4 | 8 | 2 | 5 |   | 3 | 6 |
    | 8 | 2 | 5 | 9 | 3 |   | 1 | 4 | 7 |
    | 9 |   | 6 | 1 | 4 | 7 | 2 | 5 | 8 |

  Then the resolver should solve the sudoku like this:
    | a | b | c | d | e | f | g | h | i |
    | 1 | 4 | 7 | 2 | 5 | 8 | 3 | 6 | 9 |
    | 2 | 5 | 8 | 3 | 6 | 9 | 4 | 7 | 1 |
    | 3 | 6 | 9 | 4 | 7 | 1 | 5 | 8 | 2 |
    | 4 | 7 | 1 | 5 | 8 | 2 | 6 | 9 | 3 |
    | 5 | 8 | 2 | 6 | 9 | 3 | 7 | 1 | 4 |
    | 6 | 9 | 3 | 7 | 1 | 4 | 8 | 2 | 5 |
    | 7 | 1 | 4 | 8 | 2 | 5 | 9 | 3 | 6 |
    | 8 | 2 | 5 | 9 | 3 | 6 | 1 | 4 | 7 |
    | 9 | 3 | 6 | 1 | 4 | 7 | 2 | 5 | 8 |

