-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0002_Even_Fibonacci_Numbers;
with Project_Euler.CLI.Runner;

procedure C0002_Even_Fibonacci_Numbers is
   Problem : P0002_Even_Fibonacci_Numbers.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0002_Even_Fibonacci_Numbers;
