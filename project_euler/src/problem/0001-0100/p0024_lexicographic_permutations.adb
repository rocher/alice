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
--                 https://projecteuler.net/problem=24
--
--  Lexicographic permutations
--  --------------------------
--
--  A permutation is an ordered arrangement of objects. For example, 3124 is
--  one possible permutation of the digits 1, 2, 3 and 4. If all of the
--  permutations are listed numerically or alphabetically, we call it
--  lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
--
--                 012   021   102   120   201   210
--
--  What is the millionth lexicographic permutation of the digits 0, 1, 2, 3,
--  4, 5, 6, 7, 8 and 9?
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0024_Lexicographic_Permutations is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Digit_Set : Set_Type;
      --  set of digits to permute

      Digit_Elt : Natural;
      --  nth element of the previous set

      Digit_Index : Natural := 0;
      --  index (position) of the digit under consideration

      Free_Digits : Natural := 10;
      --  remaining digits (positions) to permute

      Perm_Total : Natural := 0;
      --  total number of permutations counted

      Perm_Free : Natural;
      --  number of permutations with the rest of free digit positions

      Perm_Skip : Natural;
      --  number of digits skipped in a position, counted as permutations

      Answer : String (1 .. 10);
   begin

      for D in 0 .. 9 loop
         Digit_Set.Insert (D);
      end loop;

      loop
         Digit_Index := @ + 1;
         Free_Digits := @ - 1;
         Perm_Free   := Factorial (Free_Digits);
         Perm_Skip   := 1;

         loop
            Perm_Total := @ + Perm_Free;
            Perm_Skip  := @ + 1;
            exit when Perm_Total + Perm_Free >= 1_000_000;
         end loop;

         Digit_Elt := Element_Nth (Digit_Set, Perm_Skip);
         Digit_Set.Delete (Digit_Elt);

         Answer (Digit_Index) := To_String (Digit_Elt) (1);
         --  set the correct digit in the current position

         exit when Perm_Total = 1_000_000;
      end loop;

      return Answer;
   end Answer;

end P0024_Lexicographic_Permutations;
