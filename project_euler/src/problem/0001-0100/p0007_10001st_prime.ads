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
--                 https://projecteuler.net/problem=7
--
--  10001st prime
--  -------------
--
--  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can
--  see that the 6th prime is 13.
--
--  What is the 10001st prime number?
--
-------------------------------------------------------------------------------

with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Project_Euler.GUI;         use Project_Euler.GUI;
with Project_Euler.GUI_Plotter; use Project_Euler.GUI_Plotter;

package P0007_10001st_Prime is

   type Problem_Type is new GUI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (7);

   overriding function Title (Problem : Problem_Type) return String is
     ("10001st prime");

   overriding function Brief (Problem : Problem_Type) return String is
     ("What is the 10001st prime number?");

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

   overriding procedure Plotter_Setup
     (Problem : Problem_Type; Plotter : Pointer_To_Plotter_Class);

   overriding procedure On_Start
     (P : in out Problem_Type; Plotter : Pointer_To_Plotter_Class);

end P0007_10001st_Prime;
