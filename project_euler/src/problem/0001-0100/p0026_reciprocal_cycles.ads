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
--                 https://projecteuler.net/problem=26
--
--  Reciprocal cycles
--  -----------------
--
--  A unit fraction contains 1 in the numerator. The decimal representation
--  of the unit fractions with denominators 2 to 10 are given:
--
--                 1/2  = 0.5
--                 1/3  = 0.(3)
--                 1/4  = 0.25
--                 1/5  = 0.2
--                 1/6  = 0.1(6)
--                 1/7  = 0.(142857)
--                 1/8  = 0.125
--                 1/9  = 0.(1)
--                 1/10 = 0.1
--
--  Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can
--  be seen that 1/7 has a 6-digit recurring cycle.
--
--  Find the value of d < 1000 for which 1/d contains the longest recurring
--  cycle in its decimal fraction part.
--
-------------------------------------------------------------------------------

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Project_Euler.CLI;     use Project_Euler.CLI;

package P0026_Reciprocal_Cycles is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (26);

   overriding function Title (Problem : Problem_Type) return String is
     ("Reciprocal cycles");

   overriding function Brief (Problem : Problem_Type) return String is
     ("Find the value of d < 1000 for which 1/d contains the longest " &
      "recurring cycle in its decimal fraction part.");

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

end P0026_Reciprocal_Cycles;
