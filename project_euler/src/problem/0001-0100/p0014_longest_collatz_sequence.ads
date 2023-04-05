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
--                 https://projecteuler.net/problem=14
--
--  Longest Collatz sequence
--  ------------------------
--
--  The following iterative sequence is defined for the set of positive
--  integers:
--
--                 n → n/2 (n is even)
--                 n → 3n + 1 (n is odd)
--
--  Using the rule above and starting with 13, we generate the following
--  sequence:
--
--                 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
--
--  It can be seen that this sequence (starting at 13 and finishing at 1)
--  contains 10 terms. Although it has not been proved yet (Collatz Problem),
--  it is thought that all starting numbers finish at 1.
--
--  Which starting number, under one million, produces the longest chain?
--
--  NOTE: Once the chain starts the terms are allowed to go above one
--  million.
--
-------------------------------------------------------------------------------

with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Project_Euler.GUI;         use Project_Euler.GUI;
with Project_Euler.GUI_Plotter; use Project_Euler.GUI_Plotter;

with Euler_Tools_Int1; use Euler_Tools_Int1;
with Parse_Args;       use Parse_Args;

package P0014_Longest_Collatz_Sequence is

   type Problem_Type is new GUI_Type with private;

   overriding function Number (Problem : Problem_Type) return Natural is (14);

   overriding function Title (Problem : Problem_Type) return String is
     ("Longest Collatz sequence");

   overriding function Brief (Problem : Problem_Type) return String is
     ("Which starting number, under one million, produces the longest " &
      "[Collatz] chain?");

   overriding procedure Initialize
     (Problem : Problem_Type; Parser : in out Parse_Args.Argument_Parser);

   overriding procedure Set_Options
     (Problem : in out Problem_Type; Parser : Parse_Args.Argument_Parser);

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

   overriding procedure Plotter_Setup
     (Problem : Problem_Type; Plotter : Pointer_To_Plotter_Class);

   overriding procedure On_Start
     (Problem : in out Problem_Type; Plotter : Pointer_To_Plotter_Class);

private

   type Problem_Type is new GUI_Type with record
      Max_Length : Integer_Type := 0;
      Max_Count  : Natural      := 0;

      Option_Reverse : Boolean := False;
   end record;

end P0014_Longest_Collatz_Sequence;
