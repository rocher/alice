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
--                 https://projecteuler.net/problem=23
--
--  Non-abundant sums
--  -----------------
--
--  A perfect number is a number for which the sum of its proper divisors is
--  exactly equal to the number. For example, the sum of the proper divisors
--  of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect
--  number.
--
--  A number n is called deficient if the sum of its proper divisors is less
--  than n and it is called abundant if this sum exceeds n.
--
--  As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
--  smallest number that can be written as the sum of two abundant numbers is
--  24. By mathematical analysis, it can be shown that all integers greater
--  than 28123 can be written as the sum of two abundant numbers. However,
--  this upper limit cannot be reduced any further by analysis even though it
--  is known that the greatest number that cannot be expressed as the sum of
--  two abundant numbers is less than this limit.
--
--  Find the sum of all the positive integers which cannot be written as the
--  sum of two abundant numbers.
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0023_Non_Abundant_Sums is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Is_Sum_Of_Abundant_Numbers : Boolean;
      Non_Abundant_Counter       : Natural      := 0;
      Answer                     : Integer_Type := 1 + 2;
   begin

      for Number in 3 .. 28_123 loop

         Is_Sum_Of_Abundant_Numbers := False;

         Abundant_Loop :
         for A in 1 .. Number / 2 loop
            declare
               B : constant Integer_Type := Number - A;
            begin
               if Is_Abundant (A) and then Is_Abundant (B) then
                  Is_Sum_Of_Abundant_Numbers := True;
                  Non_Abundant_Counter       := @ + 1;
                  exit Abundant_Loop;
               end if;
            end;
         end loop Abundant_Loop;

         if not Is_Sum_Of_Abundant_Numbers then
            Answer := @ + Number;
         end if;

      end loop;

      Notes :=
        To_Unbounded_String
          ("There are" & Non_Abundant_Counter'Image & " numbers like that.");

      return To_String (Answer);
   end Answer;

end P0023_Non_Abundant_Sums;
