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
--                 https://projecteuler.net/problem=14
--
--  Longest Collatz sequence
--  ------------------------
--
--  The following iterative sequence is defined for the set of positive
--  integers:
--
--                 n → n/2 (n is even)
--                 n → 3n + 1 (n is odd)
--
--  Using the rule above and starting with 13, we generate the following
--  sequence:
--
--                 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
--
--  It can be seen that this sequence (starting at 13 and finishing at 1)
--  contains 10 terms. Although it has not been proved yet (Collatz Problem),
--  it is thought that all starting numbers finish at 1.
--
--  Which starting number, under one million, produces the longest chain?
--
--  NOTE: Once the chain starts the terms are allowed to go above one
--  million.
--
-------------------------------------------------------------------------------

with Simple_Logging; use Simple_Logging;

package body P0014_Longest_Collatz_Sequence is

   ----------------
   -- Initialize --
   ----------------

   overriding procedure Initialize
     (Problem : Problem_Type; Parser : in out Parse_Args.Argument_Parser)
   is
   begin
      Parser.Add_Option
        (Make_Boolean_Option (False), Name => "REVERSE", Short_Option => 'r',
         Long_Option                       => "reverse",
         Usage => "Traverse search space in reverse order");
   end Initialize;

   -----------------
   -- Set_Options --
   -----------------

   overriding procedure Set_Options
     (Problem : in out Problem_Type; Parser : Parse_Args.Argument_Parser)
   is
   begin
      Problem.Option_Reverse := Parser.Boolean_Value ("REVERSE");
      Simple_Logging.Debug ("Reverse = " & Problem.Option_Reverse'Image);
   end Set_Options;

   ------------
   -- Answer --
   ------------

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Start   : Integer_Type;
      Δ_Start : Integer_Type;
      Last    : Integer_Type;
      Number  : Integer_Type;

      Length : Integer_Type := 0;
      Answer : Integer_Type := 0;
   begin

      Start   := (if Problem.Option_Reverse then 999_999 else 1);
      Δ_Start := (if Problem.Option_Reverse then -1 else 1);
      Last    := (if Problem.Option_Reverse then 1 else 999_999);

      Problem.Max_Length := 0;
      Problem.Max_Count  := 0;

      loop
         Number := Collatz_Next (Start);
         Length := 1;

         loop
            Number := Collatz_Next (Number);
            Length := @ + 1;
            exit when Number = 1;
         end loop;

         if Length > Problem.Max_Length then
            Problem.Max_Length := Length;
            Problem.Max_Count  := @ + 1;
            Answer             := Start;
         end if;

         exit when Start = Last;
         Start := @ + Δ_Start;
      end loop;

      Notes :=
        To_Unbounded_String
          ("The chain contains" & Problem.Max_Length'Image &
           " numbers; Max changed" & Problem.Max_Count'Image & " times");

      return To_String (Answer);
   end Answer;

   -------------------
   -- Plotter_Setup --
   -------------------

   overriding procedure Plotter_Setup
     (Problem : Problem_Type; Plotter : Pointer_To_Plotter_Class)
   is
   begin
      Plotter.Set_Axes
        (X_Min => 0.0, X_Max => 1_000_000.0, Y_Min => 0.0, Y_Max => 600.0);
      Plotter.Draw_Grid
        (X_Major => 100_000.0, X_Minor => 50_000.0, Y_Major => 100.0,
         Y_Minor => 50.0);
      Plotter.Draw_Axes ("Number", "Length");
   end Plotter_Setup;

   --------------
   -- On_Start --
   --------------

   overriding procedure On_Start
     (Problem : in out Problem_Type; Plotter : Pointer_To_Plotter_Class)
   is
      Start      : Integer_Type;
      Number     : Integer_Type;
      Length     : Integer_Type;
      Answer     : Integer_Type;
      Max_Length : Integer_Type := 0;

      --  block computations
      Σ_Length    : Float;
      Has_Max     : Boolean;
      Block_Size  : constant Integer_Type := 10_000;
      Block_Max_X : Integer_Type;
      Block_Max_Y : Integer_Type          := 0;
      Block_Min_X : Integer_Type;
      Block_Min_Y : Integer_Type          := Integer_Type'Last;

      Has_Paused : Boolean := False;
   begin
      if Problem.Is_Started then
         return;
      end if;

      Problem.Start;
      Plotter.Start;

      Start      := 999_999;
      Number     := 0;
      Length     := 0;
      Answer     := 0;
      Max_Length := 0;

      Σ_Length := 0.0;
      Has_Max  := False;

      loop
         Number := Collatz_Next (Start);
         Length := 1;

         loop
            Number := Collatz_Next (Number);
            Length := @ + 1;
            exit when Number = 1;
         end loop;

         Σ_Length := @ + Float (Length);

         if Length > Max_Length then
            Answer     := Start;
            Max_Length := Length;
            Has_Max    := True;
         end if;

         if Length > Block_Max_Y then
            Block_Max_X := Start;
            Block_Max_Y := Length;
         end if;

         if Length < Block_Min_Y then
            Block_Min_X := Start;
            Block_Min_Y := Length;
         end if;

         if Start mod Block_Size = 0 or else Start = 1 then
            Plotter.Rectangle
              (Float (Start), 0.0, Float (Start) + Float (Block_Size),
               Σ_Length / Float (Block_Size), "#999");
            if Has_Max then
               Plotter.Line
                 (Float (Answer), 0.0, Float (Answer), Float (Max_Length),
                  "#c00");
               Plotter.Line
                 (0.0, Float (Max_Length), 1_000_000.0, Float (Max_Length),
                  "#f88");
            else
               Plotter.Line
                 (Float (Block_Max_X), 0.0, Float (Block_Max_X),
                  Float (Block_Max_Y), "#33c");
               Plotter.Line
                 (Float (Block_Min_X), 0.0, Float (Block_Min_X),
                  Float (Block_Min_Y), "#000");
            end if;
            Σ_Length    := 0.0;
            Has_Max     := False;
            Block_Max_Y := 0;
            Block_Min_Y := Integer_Type'Last;

            if Start <= 100_000 and then not Has_Paused then
               Problem.Pause;
               Plotter.Pause;
               Has_Paused := True;
            end if;

            delay (0.001);
            Problem.Wait_To_Continue;
            if Problem.Is_Stopped then
               return;
            end if;
         end if;

         exit when Start = 1;  --  ! Intuition: Start >= 99_999
         Start := Start - 1;

      end loop;

      Problem.Stop;
      Plotter.Stop;
   end On_Start;

end P0014_Longest_Collatz_Sequence;
