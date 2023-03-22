-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0019_Counting_Sundays;
with Project_Euler.CLI.Runner;

procedure C0019_Counting_Sundays is
   Problem : P0019_Counting_Sundays.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0019_Counting_Sundays;
