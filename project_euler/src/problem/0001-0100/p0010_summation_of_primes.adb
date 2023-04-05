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
--                 https://projecteuler.net/problem=10
--
--  Summation of primes
--  -------------------
--
--  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
--
--  Find the sum of all the primes below two million.
--
-------------------------------------------------------------------------------

with Euler_Tools_Int1; use Euler_Tools_Int1;

package body P0010_Summation_Of_Primes is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Answer : Integer_Type := 0;
      Cursor : Prime_Cursor_Type;
      Prime  : Integer_Type := Prime_First (Cursor);
   begin

      loop
         Answer := @ + Prime;
         Prime  := Prime_Next (Cursor);

         exit when Prime > 2_000_000;
      end loop;

      return To_String (Answer);
   end Answer;

end P0010_Summation_Of_Primes;
