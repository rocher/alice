-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0023_Non_Abundant_Sums;
with Project_Euler.CLI.Runner;

procedure C0023_Non_Abundant_Sums is
   Problem : P0023_Non_Abundant_Sums.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0023_Non_Abundant_Sums;
