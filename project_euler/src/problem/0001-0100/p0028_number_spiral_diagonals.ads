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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Project_Euler.CLI;     use Project_Euler.CLI;

package P0028_Number_Spiral_Diagonals is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (28);

   overriding function Title (Problem : Problem_Type) return String is
     ("Number spiral diagonals");

   overriding function Brief (Problem : Problem_Type) return String is
     ("What is the sum of the numbers on the diagonals in a 1001 by 1001 " &
      "spiral formed in the same way?");

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

end P0028_Number_Spiral_Diagonals;
