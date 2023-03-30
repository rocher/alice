-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0022_Names_Scores;
with Project_Euler.CLI.Runner;

procedure C0022_Names_Scores is
   Problem : P0022_Names_Scores.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0022_Names_Scores;
