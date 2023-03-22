-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0001_Multiples_Of_3_Or_5;
with Project_Euler.CLI.Runner;

procedure C0001_Multiples_Of_3_Or_5 is
   Problem : P0001_Multiples_Of_3_Or_5.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0001_Multiples_Of_3_Or_5;
