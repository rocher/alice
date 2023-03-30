-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0006_Sum_Square_Difference;
with Project_Euler.CLI.Runner;

procedure C0006_Sum_Square_Difference is
   Problem : P0006_Sum_Square_Difference.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0006_Sum_Square_Difference;
