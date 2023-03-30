-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0025_1000_Digit_Fibonacci_Number;
with Project_Euler.CLI.Runner;

procedure C0025_1000_Digit_Fibonacci_Number is
   Problem : P0025_1000_Digit_Fibonacci_Number.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0025_1000_Digit_Fibonacci_Number;
