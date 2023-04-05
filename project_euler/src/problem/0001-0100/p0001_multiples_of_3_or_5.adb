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
--                 https://projecteuler.net/problem=1
--
--  Multiples of 3 or 5
--  -------------------
--
--  If we list all the natural numbers below 10 that are multiples of 3 or 5,
--  we get 3, 5, 6 and 9. The sum of these multiples is 23.
--
--  Find the sum of all the multiples of 3 or 5 below 1000.
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0001_Multiples_Of_3_Or_5 is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Answer : Integer_Type;
   begin
      Answer :=
        Sum_Multiples (3, 1_000) + Sum_Multiples (5, 1_000) -
        Sum_Multiples (15, 1_000);

      Notes :=
        To_Unbounded_String
          ("Sum all multiples of 3 and all multiples of 5, " &
           "and subtract all multiples of 15.");

      return To_String (Answer);
   end Answer;

end P0001_Multiples_Of_3_Or_5;
