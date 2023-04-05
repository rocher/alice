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
--                 https://projecteuler.net/problem=20
--
--
--  Factorial digit sum
--
--  n! means n × (n − 1) × ... × 3 × 2 × 1
--
--  For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800, and the sum of the
--  digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
--
--  Find the sum of the digits in the number 100!
--
-------------------------------------------------------------------------------

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;
with Euler_Tools; use Euler_Tools;

package body P0020_Factorial_Digit_Sum is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Factorial : Big_Natural := 1;
      Answer    : Natural     := 0;
   begin

      for N in 2 .. 100 loop
         Factorial := @ * To_Big_Integer (N);
      end loop;

      declare
         Text : constant String := To_String (Factorial);
      begin
         for Char of Text loop
            Answer := @ + To_Number (Char);
         end loop;
      end;

      return To_String (Answer);
   end Answer;

end P0020_Factorial_Digit_Sum;
