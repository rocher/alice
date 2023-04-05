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
--                 https://projecteuler.net/problem=13
--
--  Large sum
--  ---------
--
--  Work out the first ten digits of the sum of the following one-hundred
--  50-digit numbers.
--
-------------------------------------------------------------------------------

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Project_Euler.CLI;     use Project_Euler.CLI;

package P0013_Large_Sum is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (13);

   overriding function Title (Problem : Problem_Type) return String is
     ("Large sum");

   overriding function Brief (Problem : Problem_Type) return String is
     ("Work out the first ten digits of the sum of the following " &
      "one-hundred 50-digit numbers.");

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

end P0013_Large_Sum;
