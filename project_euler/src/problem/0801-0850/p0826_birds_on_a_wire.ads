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
--                 https://projecteuler.net/problem=826
--
--  Birds on a wire
--  ---------------
--
--  Consider a wire of length 1 unit between two posts. Every morning birds
--  land on it randomly with every point on the wire equally likely to host a
--  bird. The interval from each bird to its closest neighbour is then
--  painted.
--
--  Define F(n) to be the expected length of the wire that is painted. You
--  are given.
--
--  Find the average of F(n) where n ranges through all odd prime less than a
--  million. Give your answer rounded to 10 places after the decimal point.
--
-------------------------------------------------------------------------------

with Project_Euler.CLI; use Project_Euler.CLI;

package P0826_Birds_On_A_Wire is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (826);

   overriding function Title (Problem : Problem_Type) return String is
     ("Birds on a wire");

   overriding function Answer (Problem : Problem_Type) return String;

   overriding function Brief (Problem : Problem_Type) return String is
     ("Find the average of F(n) where n ranges through all odd prime less " &
      "than a million. " &
      "Give your answer rounded to 10 places after the decimal point.");

   overriding function Notes (Problem : Problem_Type) return String is ("");

end P0826_Birds_On_A_Wire;
