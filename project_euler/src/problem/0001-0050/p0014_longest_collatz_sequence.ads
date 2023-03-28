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

with Project_Euler.GUI;         use Project_Euler.GUI;
with Project_Euler.GUI_Plotter; use Project_Euler.GUI_Plotter;

package P0014_Longest_Collatz_Sequence is

   type Problem_Type is new GUI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (14);

   overriding function Title (Problem : Problem_Type) return String is
     ("Longest Collatz sequence");

   overriding function Brief (Problem : Problem_Type) return String is
     ("Which starting number, under one million, produces the longest " &
      "[Collatz] chain?");

   overriding function Answer (Problem : in out Problem_Type) return String;

   overriding function Notes (Problem : Problem_Type) return String;

   overriding procedure Plotter_Setup
     (Problem : Problem_Type; Plotter : Pointer_To_Plotter_Class);

   overriding procedure On_Start
     (Problem : in out Problem_Type; Plotter : Pointer_To_Plotter_Class);

end P0014_Longest_Collatz_Sequence;
