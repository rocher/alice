-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0027_Quadratic_Primes;
with Project_Euler.CLI.Runner;

procedure C0027_Quadratic_Primes is
   Problem : P0027_Quadratic_Primes.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0027_Quadratic_Primes;
