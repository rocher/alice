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
--                 https://projecteuler.net/problem=826
--
--  Birds on a wire
--  ---------------
--
--  Consider a wire of length 1 unit between two posts. Every morning birds
--  land on it randomly with every point on the wire equally likely to host a
--  bird. The interval from each bird to its closest neighbour is then
--  painted.
--
--  Define F(n) to be the expected length of the wire that is painted. You
--  are given.
--
--  Find the average of F(n) where n ranges through all odd prime less than a
--  million. Give your answer rounded to 10 places after the decimal point.
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0826_Birds_On_A_Wire is

   overriding function Answer (Problem : Problem_Type) return String is
      type Decimals_10 is digits 11 range 0.0 .. 1.0;
      Prime  : Natural;
      Cursor : Prime_Cursor_Type;
      Fn     : Float;
      N      : Float := 0.0;
      Σ_Fn   : Float := 0.0;
      Answer : Decimals_10;
   begin
      Prime := Prime_First (Cursor);  --  skip 2
      loop
         Prime := Prime_Next (Cursor);
         exit when Prime >= 1_000_000;
         Fn   := Float (Prime - 1) / Float (Prime + 1);
         N    := @ + 1.0;
         Σ_Fn := @ + Fn;
      end loop;
      Answer := Decimals_10 (Σ_Fn / N);

      return Answer'Image;
   end Answer;

end P0826_Birds_On_A_Wire;
