-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0013_Large_Sum;
with Project_Euler.CLI.Runner;

procedure C0013_Large_Sum is
   Problem : P0013_Large_Sum.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0013_Large_Sum;
