-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0021_Amicable_Numbers;
with Project_Euler.CLI.Runner;

procedure C0021_Amicable_Numbers is
   Problem : P0021_Amicable_Numbers.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0021_Amicable_Numbers;
