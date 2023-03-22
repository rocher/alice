-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
--  ---------------------------------------------------------------------------

with P0015_Lattice_Paths;
with Project_Euler.CLI.Runner;

procedure C0015_Lattice_Paths is
   Problem : P0015_Lattice_Paths.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0015_Lattice_Paths;
