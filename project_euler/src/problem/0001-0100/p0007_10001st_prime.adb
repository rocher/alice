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
--                 https://projecteuler.net/problem=7
--
--  10001st prime
--  -------------
--
--  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can
--  see that the 6th prime is 13.
--
--  What is the 10001st prime number?
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0007_10001st_Prime is

   Module : constant Natural := 329;
   Color  : String (1 .. 4)  := "#xxx";

   ------------
   -- Answer --
   ------------

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Answer : Integer_Type;
   begin

      Answer := Prime_Nth (10_001);

      return To_String (Answer);
   end Answer;

   -------------------
   -- Plotter_Setup --
   -------------------

   overriding procedure Plotter_Setup
     (Problem : Problem_Type; Plotter : Pointer_To_Plotter_Class)
   is
   begin
      Plotter.Set_Axes (Min => -10.0, Max => Float (Module));
      Plotter.Draw_Grid
        (X_Major => 100.0, X_Minor => 10.0, Y_Major => 100.0, Y_Minor => 10.0);
      Plotter.Draw_Axes ("", "");
   end Plotter_Setup;

   --------------
   -- On_Start --
   --------------

   overriding procedure On_Start
     (P : in out Problem_Type; Plotter : Pointer_To_Plotter_Class)
   is
      Cursor : Prime_Cursor_Type;
      Prime  : Integer_Type;
      Count  : Natural;
      X, Y   : Float;
   begin
      if P.Is_Started then
         return;
      end if;

      P.Start;
      Plotter.Start;

      Prime := Prime_First (Cursor);
      Count := 1;

      loop
         X := 1.0 + Float (Prime mod Module);
         Y := 1.0 + Float (Prime / Module);
         case Units (Prime) is
            when 1 =>
               Color := "#900";
            when 3 =>
               Color := "#090";
            when 7 =>
               Color := "#009";
            when others =>
               Color := "#666";
         end case;
         Plotter.Rectangle (X - 0.5, Y - 0.5, X + 0.5, Y + 0.5, Color);

         exit when Count = 10_001;

         Prime := Prime_Next (Cursor);
         Count := @ + 1;

         delay (0.001);
         P.Wait_To_Continue;
         if P.Is_Stopped then
            return;
         end if;
      end loop;

      P.Stop;
      Plotter.Stop;
   end On_Start;

end P0007_10001st_Prime;
