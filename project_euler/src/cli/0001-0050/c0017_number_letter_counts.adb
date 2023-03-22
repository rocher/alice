-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0017_Number_Letter_Counts;
with Project_Euler.CLI.Runner;

procedure C0017_Number_Letter_Counts is
   Problem : P0017_Number_Letter_Counts.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0017_Number_Letter_Counts;
