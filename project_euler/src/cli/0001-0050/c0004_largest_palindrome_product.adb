-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with P0004_Largest_Palindrome_Product;
with Project_Euler.CLI.Runner;

procedure C0004_Largest_Palindrome_Product is
   Problem : P0004_Largest_Palindrome_Product.Problem_Type;
begin

   Project_Euler.CLI.Runner.Run (Problem);

end C0004_Largest_Palindrome_Product;
