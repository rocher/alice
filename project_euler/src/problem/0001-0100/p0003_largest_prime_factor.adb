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
--                 https://projecteuler.net/problem=3
--
--  Largest prime factor
--  --------------------
--
--  The prime factors of 13195 are 5, 7, 13 and 29.

--  What is the largest prime factor of the number 600851475143?
--
-------------------------------------------------------------------------------

with Euler_Tools_Int2; use Euler_Tools_Int2;

package body P0003_Largest_Prime_Factor is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Number : constant Integer_Type := 600_851_475_143;
      Answer : Integer_Type          := Square_Root (Number);
   begin

      loop
         exit when Is_Divisor (Number, Answer) and then Is_Prime (Answer);
         Answer := @ - 1;
      end loop;

      return To_String (Answer);
   end Answer;

end P0003_Largest_Prime_Factor;
