-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem=4
--
--  Largest palindrome product
--  --------------------------
--
--  A palindromic number reads the same both ways. The largest palindrome
--  made from the product of two 2-digit numbers is 9009 = 91 × 99.
--
--  Find the largest palindrome made from the product of two 3-digit numbers.
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0004_Largest_Palindrome_Product is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      N1     : Integer_Type := 999;
      N2     : Integer_Type := 999;
      Answer : Integer_Type := 0;
   begin

      loop
         Answer := N1 * N2;
         exit when Is_Palindrome (Answer);

         N1 := N1 - 1;
         if N1 = 900 then  --  ! Intuition: N1 > 900, N2 > 900
            N2 := N2 - 1;
            N1 := N2;
         end if;
      end loop;

      Notes :=
        To_Unbounded_String
          ("The two 3-digit numbers are" & N1'Image & " and" & N2'Image);

      return To_String (Answer);
   end Answer;

end P0004_Largest_Palindrome_Product;
