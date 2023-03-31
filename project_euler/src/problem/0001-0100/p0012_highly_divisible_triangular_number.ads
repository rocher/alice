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
--                 https://projecteuler.net/problem=12
--
--  Highly divisible triangular number
--  ----------------------------------
--
--  The sequence of triangle numbers is generated by adding the natural
--  numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 =
--  28. The first ten terms would be:
--
--                 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
--
--  Let us list the factors of the first seven triangle numbers:
--
--                  1: 1
--                  3: 1,3
--                  6: 1,2,3,6
--                 10: 1,2,5,10
--                 15: 1,3,5,15
--                 21: 1,3,7,21
--                 28: 1,2,4,7,14,28
--
--  We can see that 28 is the first triangle number to have over five
--  divisors.
--
--  What is the value of the first triangle number to have over five hundred
--  divisors?
--
-------------------------------------------------------------------------------

with Project_Euler.CLI; use Project_Euler.CLI;

package P0012_Highly_Divisible_Triangular_Number is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (12);

   overriding function Title (Problem : Problem_Type) return String is
     ("Highly divisible triangular number");

   overriding function Brief (Problem : Problem_Type) return String is
     ("What is the value of the first triangle number to have over five " &
      "hundred divisors?");

   overriding function Answer (Problem : in out Problem_Type) return String;

   overriding function Notes (Problem : Problem_Type) return String;

end P0012_Highly_Divisible_Triangular_Number;