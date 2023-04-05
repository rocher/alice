-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem=28
--
--  Number spiral diagonals
--  -----------------------
--
--  Starting with the number 1 and moving to the right in a clockwise
--  direction a 5 by 5 spiral is formed as follows:
--
--                 21 22 23 24 25
--                 20  7  8  9 10
--                 19  6  1  2 11
--                 18  5  4  3 12
--                 17 16 15 14 13
--
--  It can be verified that the sum of the numbers on the diagonals is 101.
--
--  What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
--  formed in the same way?
--
-------------------------------------------------------------------------------

with Euler_Tools_Int2; use Euler_Tools_Int2;

package body P0028_Number_Spiral_Diagonals is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is

      --  Σ_Diagonal:
      --     1 : 1, 3, 13, 31 -> right-down
      --     2 : 1, 5, 17, 37 -> left-down
      --     3 : 1, 7, 21, 43 -> left-up
      --     4 : 1, 9, 25, 49 -> right-up
      --
      --  With some analysis, for all n >= 0,
      --
      --     Σ_Diagonal (1, n) = 4n² - 2n + 1
      --     Σ_Diagonal (2, n) = 4n²      + 1
      --     Σ_Diagonal (3, n) = 4n² + 2n + 1
      --     Σ_Diagonal (4, n) = 4n² + 4n + 1
      --
      --                            4
      --  Thus, Σ_Diagonals (n)  =  Σ   Σ_Diagonal (i, n) + 1
      --                           i=1
      --  for n = 1 .. 500.
      --
      --  This sum can be computed with a simple formula.

      Answer : Integer_Type;
   begin

      Answer := 4 * (4 * Sum_Squares (500) + Sum_Sequence (500) + 500) + 1;

      return To_String (Answer);
   end Answer;

end P0028_Number_Spiral_Diagonals;
