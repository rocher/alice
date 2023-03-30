-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0011_Largest_Product_In_A_Grid;
with Project_Euler.CLI.Runner;

procedure C0011_Largest_Product_In_A_Grid is
   Problem : P0011_Largest_Product_In_A_Grid.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0011_Largest_Product_In_A_Grid;
