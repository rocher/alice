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
--                 https://projecteuler.net/problem=25
--
--  1000-digit Fibonacci number
--  ---------------------------
--
--  The Fibonacci sequence is defined by the recurrence relation:
--
--                 Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
--
--  Hence the first 12 terms will be:
--
--                 F1 = 1
--                 F2 = 1
--                 F3 = 2
--                 F4 = 3
--                 F5 = 5
--                 F6 = 8
--                 F7 = 13
--                 F8 = 21
--                 F9 = 34
--                 F10 = 55
--                 F11 = 89
--                 F12 = 144
--
--  The 12th term, F12, is the first term to contain three digits.
--
--  What is the index of the first term in the Fibonacci sequence to contain
--  1000 digits?
--
-------------------------------------------------------------------------------

with Ada.Strings.Fixed;
with Ada.Numerics.Big_Numbers.Big_Integers;
with Euler_Tools;

use Ada.Strings;
use Ada.Strings.Fixed;
use Ada.Numerics.Big_Numbers.Big_Integers;
use Euler_Tools;

package body P0025_1000_Digit_Fibonacci_Number is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      F1     : Big_Natural := 1;
      F2     : Big_Natural := 1;
      Fn     : Big_Natural;
      Answer : Natural     := 2;
   begin

      loop
         Answer := @ + 1;
         Fn     := F1 + F2;
         exit when Trim (To_String (Fn), Both)'Length >= 1_000;

         F2 := F1;
         F1 := Fn;
      end loop;

      return To_String (Answer);
   end Answer;

end P0025_1000_Digit_Fibonacci_Number;
