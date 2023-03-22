-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0005_Smallest_Multiple;
with Project_Euler.CLI.Runner;

procedure C0005_Smallest_Multiple is
   Problem : P0005_Smallest_Multiple.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0005_Smallest_Multiple;
