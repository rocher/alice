-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0014_Longest_Collatz_Sequence;
with Project_Euler.CLI.Runner;

procedure C0014_Longest_Collatz_Sequence is
   Problem : P0014_Longest_Collatz_Sequence.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0014_Longest_Collatz_Sequence;
