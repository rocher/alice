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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Project_Euler.CLI;     use Project_Euler.CLI;

package P0020_Factorial_Digit_Sum is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (20);

   overriding function Title (Problem : Problem_Type) return String is
     ("Factorial digit sum");

   overriding function Brief (Problem : Problem_Type) return String is
     ("Find the sum of the digits in the number 100!");

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

end P0020_Factorial_Digit_Sum;
