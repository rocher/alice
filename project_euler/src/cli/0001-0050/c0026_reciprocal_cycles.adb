-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0026_Reciprocal_Cycles;
with Project_Euler.CLI.Runner;

procedure C0026_Reciprocal_Cycles is
   Problem : P0026_Reciprocal_Cycles.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0026_Reciprocal_Cycles;
