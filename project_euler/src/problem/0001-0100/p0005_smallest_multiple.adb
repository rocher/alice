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
--                 https://projecteuler.net/problem=5
--
--  Smallest multiple
--  -----------------
--
--  2520 is the smallest number that can be divided by each of the numbers
--  from 1 to 10 without any remainder.
--
--  What is the smallest positive number that is evenly divisible by all of
--  the numbers from 1 to 20?
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0005_Smallest_Multiple is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Answer       : Integer_Type := 2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 20;
      Factor       : Integer_Type;
      Is_Divisible : Boolean;
   begin

      loop
         Factor       := 19;
         Is_Divisible := True;

         loop
            Is_Divisible := Is_Divisor (Answer, Factor);

            exit when Factor = 2 or else not Is_Divisor (Answer, Factor);
            Factor := @ - 1;
         end loop;

         exit when Is_Divisible;
         Answer := @ + 20;
      end loop;

      return To_String (Answer);
   end Answer;

end P0005_Smallest_Multiple;
