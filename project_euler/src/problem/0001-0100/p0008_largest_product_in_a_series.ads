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
--                 https://projecteuler.net/problem=8
--
--  Largest product in a series
--  ---------------------------
--
--  The four adjacent digits in the 1000-digit number that have the greatest
--  product are 9 × 9 × 8 × 9 = 5832.
--
--  Find the thirteen adjacent digits in the 1000-digit number that have the
--  greatest product. What is the value of this product?
--
-------------------------------------------------------------------------------

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Project_Euler.CLI;     use Project_Euler.CLI;

package P0008_Largest_Product_In_A_Series is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (8);

   overriding function Title (Problem : Problem_Type) return String is
     ("Largest product in a series");

   overriding function Brief (Problem : Problem_Type) return String is
     ("Find the thirteen adjacent digits in the 1000-digit number that " &
      "have the greatest product. What is the value of this product?");

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

end P0008_Largest_Product_In_A_Series;
