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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Project_Euler.CLI;     use Project_Euler.CLI;

package P0015_Lattice_Paths is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (15);

   overriding function Title (Problem : Problem_Type) return String is
     ("Lattice paths");

   overriding function Brief (Problem : Problem_Type) return String is
     ("How many such routes (starting in the top left corner, and only " &
      "being able to move to the right and down) are there through a " &
      "20×20 grid?");

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

end P0015_Lattice_Paths;
