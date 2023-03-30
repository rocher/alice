-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
--  ---------------------------------------------------------------------------

with P0008_Largest_Product_In_A_Series;
with Project_Euler.CLI.Runner;

procedure C0008_Largest_Product_In_A_Series is
   Problem : P0008_Largest_Product_In_A_Series.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0008_Largest_Product_In_A_Series;
