-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0028_Number_Spiral_Diagonals;
with Project_Euler.CLI.Runner;

procedure C0028_Number_Spiral_Diagonals is
   Problem : P0028_Number_Spiral_Diagonals.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0028_Number_Spiral_Diagonals;
