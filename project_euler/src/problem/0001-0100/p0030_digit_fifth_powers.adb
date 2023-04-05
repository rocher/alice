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
--                 https://projecteuler.net/problem=30
--
--  Digit fifth powers
--  ------------------
--
--  Surprisingly there are only three numbers that can be written as the sum
--  of fourth powers of their digits:
--
--                 1634 = 1⁴ + 6⁴ + 3⁴ + 4⁴
--                 8208 = 8⁴ + 2⁴ + 0⁴ + 8⁴
--                 9474 = 9⁴ + 4⁴ + 7⁴ + 4⁴
--
--  As 1 = 14 is not a sum it is not included.
--
--  The sum of these numbers is 1634 + 8208 + 9474 = 19316.
--
--  Find the sum of all the numbers that can be written as the sum of fifth
--  powers of their digits.
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0030_Digit_Fifth_Powers is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      P5      : array (0 .. 9) of Integer_Type;
      Powers  : Integer_Type;
      Counter : Natural      := 0;
      Answer  : Integer_Type := 0;
   begin

      for I in P5'Range loop
         P5 (I) := I**5;
      end loop;

      --  ! Intuition: all numbers are <= 999_999
      for Number in 11 .. 999_999 loop
         Powers := 0;
         for I in 1 .. Length (Number) loop
            Powers := @ + P5 (Sub_Number (Number, I, 1));
         end loop;
         if Powers = Number then
            Answer  := @ + Number;
            Counter := @ + 1;
         end if;
      end loop;

      Notes := To_Unbounded_String ("There are" & Counter'Image & " numbers.");

      return To_String (Answer);
   end Answer;

end P0030_Digit_Fifth_Powers;
