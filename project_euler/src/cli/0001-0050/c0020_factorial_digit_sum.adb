-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0020_Factorial_Digit_Sum;
with Project_Euler.CLI.Runner;

procedure C0020_Factorial_Digit_Sum is
   Problem : P0020_Factorial_Digit_Sum.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0020_Factorial_Digit_Sum;
