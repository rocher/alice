-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0007_10001st_Prime;
with Project_Euler.CLI.Runner;

procedure C0007_10001st_prime is
   Problem : P0007_10001st_Prime.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0007_10001st_prime;
