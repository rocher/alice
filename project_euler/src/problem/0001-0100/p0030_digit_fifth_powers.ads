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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Project_Euler.CLI;     use Project_Euler.CLI;

package P0030_Digit_Fifth_Powers is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (30);

   overriding function Title (Problem : Problem_Type) return String is
     ("Digit fifth powers");

   overriding function Brief (Problem : Problem_Type) return String is
     ("Find the sum of all the numbers that can be written as the sum of " &
      "fifth powers of their digits.");

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

end P0030_Digit_Fifth_Powers;
