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
--                 https://projecteuler.net/problem=15
--
--  Lattice paths
--  -------------
--
--  Starting in the top left corner of a 2×2 grid, and only being able to
--  move to the right and down, there are exactly 6 routes to the bottom
--  right corner.
--
--                 [ see diagram ]
--
--  How many such routes are there through a 20×20 grid?
--
-------------------------------------------------------------------------------

with Euler_Tools_Int3; use Euler_Tools_Int3;

package body P0015_Lattice_Paths is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Answer : Integer_Type;
   begin
      Answer := Combination (40, 20);

      return To_String (Answer);
   end Answer;

end P0015_Lattice_Paths;
