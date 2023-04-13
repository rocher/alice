-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with Ada.Float_Text_IO;

with Gnoga.Gui.Element; use Gnoga.Gui.Element;
with Gnoga.Gui.Element.Canvas.Context_2D;
with UXStrings;

use Gnoga.Gui.Element.Canvas;
use Gnoga.Gui.Element.Canvas.Context_2D;

package body Project_Euler.GUI_Plotter.Canvas is

   Font_Family_Axis   : constant String  := "Arial";
   Font_Height_Medium : constant String  := "12px";
   Font_Height_Small  : constant String  := "10px";
   Font_Size_Medium   : constant Natural := 12;
   Font_Size_Small    : constant Natural := 10;

   --------------
   -- Screen_X --
   --------------

   function Screen_X (P : in out Canvas_Type; Px : Float) return Natural is
      Sx : constant Float := (Px - P.X.Min) / (P.X.Max - P.X.Min);
   begin
      return
        Natural
          (Float (P.X.Margin) +
           Float'Rounding
             ((Float (P.X.Width) - 2.0 * Float (P.X.Margin)) * Sx));
   end Screen_X;

   function Sx (P : in out Canvas_Type; Px : Float) return Natural renames
     Screen_X;

   --------------
   -- Screen_Y --
   --------------

   function Screen_Y (P : in out Canvas_Type; Py : Float) return Natural is
      Sy : constant Float := (Py - P.Y.Min) / (P.Y.Max - P.Y.Min);
   begin
      return
        Natural
          (Float (P.Y.Width - P.Y.Margin) -
           Float'Rounding
             ((Float (P.Y.Width) - 2.0 * Float (P.Y.Margin)) * Sy));
   end Screen_Y;

   function Sy (P : in out Canvas_Type; Py : Float) return Natural renames
     Screen_Y;

   ------------
   -- Math_X --
   ------------

   --  function Math_X (P : in out Canvas_Type; Sx : Natural) return Float is
   --     Dx : constant Float :=
   --       Float (Sx - P.X.Margin) / Float (P.X.Width - 2 * P.X.Margin);
   --  begin
   --     return Dx * (P.X.Max - P.X.Min) + P.X.Min;
   --  end Math_X;

   ------------
   -- Math_X --
   ------------

   --  function Math_Y (P : in out Canvas_Type; Sy : Natural) return Float is
   --     Dy : constant Float :=
   --       Float (Sy - P.Y.Width + P.Y.Margin) / Float (P.Y.Width - 2 * P.Y.Margin);
   --  begin
   --     return Dy * (P.Y.Max - P.Y.Min) + P.Y.Min;
   --  end Math_Y;

   ---------
   -- UXS --
   ---------

   function UXS
     (Item : UXStrings.ASCII_Character_Array) return UXStrings.UXString renames
     UXStrings.From_ASCII;

   ------------
   -- Canvas --
   ------------

   function Canvas
     (P : Canvas_Type; Name : Canvas_Name)
      return Gnoga.Gui.Element.Canvas.Canvas_Access
   is
   begin
      return
        (if Name = Back then P.Back'Unrestricted_Access
         elsif Name = Draw then P.Draw'Unrestricted_Access
         else P.Info'Unrestricted_Access);
   end Canvas;

   ------------
   -- Create --
   ------------

   procedure Create
     (P : in out Canvas_Type; View : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Pause_Callback :        not null Runner_Callback;
      Stop_Callback  :        not null Runner_Callback;
      App_Data       : not null Gnoga.Types.Pointer_to_Connection_Data_Class)
   is
      Context : Context_2D_Type;
   begin
      P.Pause_Callback := Pause_Callback;
      P.Stop_Callback  := Stop_Callback;
      P.App_Data       := App_Data;

      P.Back.Create
        (Parent => View.all, Width => View.Width, Height => View.Height,
         ID     => "Canvas.Back");
      P.Back.Style ("position", "absolute");
      P.Back.Style ("left", 0);
      P.Back.Style ("top", 0);

      Context.Get_Drawing_Context_2D (P.Back);
      Context.Fill_Color ("#fff");
      Context.Fill_Rectangle ((0, 0, P.Back.Width, P.Back.Height));

      P.Draw.Create
        (Parent => View.all, Width => View.Width, Height => View.Height,
         ID     => "Canvas.Draw");
      P.Draw.Style ("position", "absolute");
      P.Draw.Style ("left", 0);
      P.Draw.Style ("top", 0);

      P.Info.Create
        (Parent => View.all, Width => View.Width, Height => View.Height,
         ID     => "Canvas.Info");
      P.Info.Style ("position", "absolute");
      P.Info.Style ("left", 0);
      P.Info.Style ("top", 0);
   end Create;

   -------------------
   -- Start_Plotter --
   -------------------

   overriding procedure Start (P : in out Canvas_Type) is
   begin
      P.Clear_Plot;
   end Start;

   -------------------
   -- Pause_Plotter --
   -------------------

   overriding procedure Pause (P : in out Canvas_Type) is
   begin
      P.Pause_Callback.all (P.App_Data);
   end Pause;

   ------------------
   -- Stop_Plotter --
   ------------------

   overriding procedure Stop (P : in out Canvas_Type) is
   begin
      P.Stop_Callback.all (P.App_Data);
   end Stop;

   ----------------
   -- Clear_Plot --
   ----------------

   overriding procedure Clear_Plot (P : in out Canvas_Type) is
      Context : Context_2D_Type;
   begin
      Context.Get_Drawing_Context_2D (P.Draw);

      Context.Begin_Path;
      Context.Clear_Rectangle ([0, 0, P.Draw.Width, P.Draw.Height]);
   end Clear_Plot;

   --------------
   -- Set_Axes --
   --------------

   overriding procedure Set_Axes (P : in out Canvas_Type; Min, Max : Float) is
      Margin_Ratio : constant Natural := 5; -- in %
      Margin       : constant Natural :=
        Natural'Max (P.Back.Width, P.Back.Height) * Margin_Ratio / 100;
      Length       : Float;
   begin
      P.X.Width  := P.Back.Width;
      P.X.Margin := Margin;

      P.Y.Width  := P.Back.Height;
      P.Y.Margin := Margin;

      if P.X.Width <= P.Y.Width then
         P.X.Min := Min;
         P.X.Max := Max;
         Length  :=
           (Max - Min) * Float (P.Y.Width - 2 * P.Y.Margin) /
           Float (P.X.Width - 2 * P.X.Margin);
         P.Y.Min := -Length / 2.0;
         P.Y.Max := Length / 2.0;
      else
         P.Y.Min := Min;
         P.Y.Max := Max;
         Length  :=
           (Max - Min) * Float (P.X.Width - 2 * P.X.Margin) /
           Float (P.Y.Width - 2 * P.Y.Margin);
         P.X.Min := (-Length + Max - Min) / 2.0;
         P.X.Max := (Length + Max - Min) / 2.0;
      end if;
   end Set_Axes;

   --------------
   -- Set_Axes --
   --------------

   overriding procedure Set_Axes
     (P : in out Canvas_Type; X_Min, X_Max, Y_Min, Y_Max : Float)
   is
      Margin_Ratio : constant Natural := 5; -- in %
      Margin       : constant Natural :=
        Natural'Max (P.Back.Width, P.Back.Height) * Margin_Ratio / 100;
   begin
      P.X.Min    := X_Min;
      P.X.Max    := X_Max;
      P.X.Width  := P.Back.Width;
      P.X.Margin := Margin;

      P.Y.Min    := Y_Min;
      P.Y.Max    := Y_Max;
      P.Y.Width  := P.Back.Height;
      P.Y.Margin := Margin;
   end Set_Axes;

   ---------------
   -- Draw_Grid --
   ---------------

   overriding procedure Draw_Grid
     (P : in out Canvas_Type; X_Major, X_Minor, Y_Major, Y_Minor : Float)
   is
      Context : Context_2D_Type;
      Px, Py  : Float;
      Length  : Natural;
      Count   : Natural;
      Text    : String (1 .. 8);

      --  #region Internal procedures
      procedure Draw_X (Δx : Float; Is_Major : Boolean) is
      begin
         if Δx = 0.0 then
            return;
         end if;

         if Is_Major then
            P.X.Has_Ticks := True;
         end if;

         Px    := 0.0;
         Count := 0;
         loop
            Context.Move_To (Sx (P, Px), Sy (P, P.Y.Min));
            Context.Line_To (Sx (P, Px), Sy (P, P.Y.Max));
            Px    := @ - Δx;
            Count := @ + 1;
            exit when Px < P.X.Min;
         end loop;
         if Is_Major and then (Count = 0 or else Px - P.X.Min < Δx / 3.0) then
            Context.Move_To (Sx (P, P.X.Min), Sy (P, P.Y.Min));
            Context.Line_To (Sx (P, P.X.Min), Sy (P, P.Y.Max));
         end if;

         Px    := 0.0;
         Count := 0;
         loop
            Context.Move_To (Sx (P, Px), Sy (P, P.Y.Min));
            Context.Line_To (Sx (P, Px), Sy (P, P.Y.Max));
            Px    := @ + Δx;
            Count := @ + 1;
            exit when Px > P.X.Max;
         end loop;
         if Is_Major and then (Count = 0 or else P.X.Max - Px < Δx / 3.0) then
            Context.Move_To (Sx (P, P.X.Max), Sy (P, P.Y.Min));
            Context.Line_To (Sx (P, P.X.Max), Sy (P, P.Y.Max));
         end if;
      end Draw_X;

      procedure Draw_Y (Δy : Float; Is_Major : Boolean) is
      begin
         if Δy = 0.0 then
            return;
         end if;

         if Is_Major then
            P.Y.Has_Ticks := True;
         end if;

         Py    := 0.0;
         Count := 0;
         loop
            Context.Move_To (Sx (P, P.X.Min), Sy (P, Py));
            Context.Line_To (Sx (P, P.X.Max), Sy (P, Py));
            Py    := @ - Δy;
            Count := @ + 1;
            exit when Py < P.Y.Min;
         end loop;
         if Is_Major and then (Count = 0 or else Py - P.Y.Min < Δy / 3.0) then
            Context.Move_To (Sx (P, P.X.Min), Sy (P, P.Y.Min));
            Context.Line_To (Sx (P, P.X.Max), Sy (P, P.Y.Min));
         end if;

         Py    := 0.0;
         Count := 0;
         loop
            Context.Move_To (Sx (P, P.X.Min), Sy (P, Py));
            Context.Line_To (Sx (P, P.X.Max), Sy (P, Py));
            Py    := @ + Δy;
            Count := @ + 1;
            exit when Py > P.Y.Max;
         end loop;
         if Is_Major and then (Count = 0 or else P.Y.Max - Py < Δy / 3.0) then
            Context.Move_To (Sx (P, P.X.Min), Sy (P, P.Y.Max));
            Context.Line_To (Sx (P, P.X.Max), Sy (P, P.Y.Max));
         end if;
      end Draw_Y;
      --  #end region

   begin
      Context.Get_Drawing_Context_2D (P.Back);

      --  minor ticks
      Context.Stroke_Color ("#ccc");
      Context.Line_Width (1);
      Context.Set_Line_Dash (Center_Dash_List);

      Context.Begin_Path;
      Draw_X (X_Minor, False);
      Draw_Y (Y_Minor, False);
      Context.Stroke;

      --  major ticks
      Context.Stroke_Color ("#999");
      Context.Line_Width (1);
      Context.Set_Line_Dash (Empty_Dash_List);

      Context.Begin_Path;
      Draw_X (X_Major, True);
      Draw_Y (Y_Major, True);
      Context.Stroke;

      --  labels
      Context.Font
        (Family => UXS (Font_Family_Axis), Height => UXS (Font_Height_Small));
      Context.Fill_Color ("#000");

      if X_Major > 0.0 then
         Context.Text_Baseline (Top);
         Context.Text_Alignment (Center);
         Px    := -X_Major;
         Count := 0;
         loop
            exit when Px < P.X.Min;
            Length := Font_Size_Small / 2 * UXStrings.Length (UXS (Px'Image));
            Context.Fill_Text
              (UXS (Px'Image), Sx (P, Px) - Length / 2,
               Sy (P, 0.0) + Font_Size_Small + 2, Length);
            Px := @ - X_Major;
         end loop;

         Px    := X_Major;
         Count := 0;
         loop
            exit when Px > P.X.Max;
            Length := Font_Size_Small / 2 * UXStrings.Length (UXS (Px'Image));
            Context.Fill_Text
              (UXS (Px'Image), Sx (P, Px) - Length / 2,
               Sy (P, 0.0) + Font_Size_Small + 2, Length);
            Px := @ + X_Major;
         end loop;
      end if;

      if Y_Major > 0.0 then
         Context.Text_Baseline (Bottom);
         Context.Text_Alignment (Right);
         Py    := -Y_Major;
         Count := 0;
         loop
            exit when Py < P.Y.Min;
            Length := Font_Size_Small / 2 * UXStrings.Length (UXS (Py'Image));
            Ada.Float_Text_IO.Default_Fore := 6;
            Ada.Float_Text_IO.Put
              (To => Text, Item => Py / 100.0, Aft => 1, Exp => 1);
            Context.Fill_Text
              (UXS ("Text"), Sx (P, 0.0) - Length - 3, Sy (P, Py) - 2, Length);
            Py := @ - Y_Major;
         end loop;

         Py    := Y_Major;
         Count := 0;
         loop
            exit when Py > P.Y.Max;
            --  Ada.Float_Text_IO.Default_Fore := 6;
            Ada.Float_Text_IO.Default_Fore := 6;
            Ada.Float_Text_IO.Default_Aft  := 0;
            Ada.Float_Text_IO.Default_Exp  := 0;
            Ada.Float_Text_IO.Put (To => Text, Item => Py, Aft => 0, Exp => 0);
            Length := Font_Size_Small / 2 * UXStrings.Length (UXS (Text));
            Context.Fill_Text
              (UXS (Text), Sx (P, 0.0) - Length - 3, Sy (P, Py) - 2, Length);
            Py := @ + Y_Major;
         end loop;
      end if;
   end Draw_Grid;

   ---------------
   -- Draw_Axes --
   ---------------

   overriding procedure Draw_Axes
     (P : in out Canvas_Type; X_Label, Y_Label : String)
   is
      Context : Context_2D_Type;
      Length  : Natural;
   begin
      Context.Get_Drawing_Context_2D (P.Back);

      Context.Stroke_Color ("#000");
      Context.Line_Width (2);
      Context.Begin_Path;

      Context.Move_To (Sx (P, P.X.Min), Sy (P, 0.0));
      Context.Line_To (Sx (P, P.X.Max), Sy (P, 0.0));

      Context.Move_To (Sx (P, 0.0), Sy (P, P.Y.Min));
      Context.Line_To (Sx (P, 0.0), Sy (P, P.Y.Max));

      Context.Font (UXS (Font_Family_Axis), UXS (Font_Height_Medium));
      Context.Fill_Color ("#000");

      Context.Text_Alignment (Left);
      Context.Text_Baseline (Top);
      Length := 6 * UXStrings.Length (UXS (X_Label));
      Context.Fill_Text
        (UXS (X_Label), Sx (P, P.X.Max) - Length / 2,
         Sy (P, 0.0) + 2 +
         (if P.X.Has_Ticks then Font_Size_Medium * 2 else Font_Size_Medium),
         Length);

      Context.Text_Alignment (Center);
      Context.Text_Baseline (Bottom);
      Length := 6 * UXStrings.Length (UXS (Y_Label));
      Context.Fill_Text
        (UXS (Y_Label), Sx (P, 0.0) - Length / 2,
         Sy (P, P.Y.Max) -
         (if P.Y.Has_Ticks then Font_Size_Medium * 2
          else Font_Size_Medium / 2),
         Length);

      Context.Stroke;
   end Draw_Axes;

   ----------------------
   -- Draw_Axes_Square --
   ----------------------

   overriding procedure Draw_Axes_Rectangle (P : in out Canvas_Type) is
      Context : Context_2D_Type;
      X_Min   : constant Float := P.X.Min;
      Y_Min   : constant Float := P.Y.Min;
      X_Max   : constant Float := P.X.Max;
      Y_Max   : constant Float := P.Y.Max;
   begin
      Context.Get_Drawing_Context_2D (P.Back);

      Context.Begin_Path;
      Context.Stroke_Color ("#000000");
      Context.Line_Width (2);
      Context.Line_Join (Value => Round);
      Context.Rectangle
        ([Sx (P, X_Min), Sy (P, Y_Min), Sx (P, X_Max) - Sx (P, X_Min),
         Sy (P, Y_Max) - Sy (P, Y_Min)]);
      Context.Stroke;
   end Draw_Axes_Rectangle;

   ----------
   -- Plot --
   ----------

   overriding procedure Plot
     (P : in out Canvas_Type; Points : Point_List; Color : String)
   is
      Context : Context_2D_Type;
      Point   : Math_Point;
   begin
      Context.Get_Drawing_Context_2D (P.Draw);

      Context.Begin_Path;
      Context.Stroke_Color (UXS (Color));
      Context.Line_Width (2);
      Context.Line_Join (Value => Miter);

      Point := Points.First_Element;
      Context.Move_To (Sx (P, Point.X), Sy (P, Point.Y));
      for Point of Points loop
         Context.Line_To (Sx (P, Point.X), Sy (P, Point.Y));
      end loop;
      Context.Stroke;
   end Plot;

   ----------
   -- Line --
   ----------

   overriding procedure Line
     (P : in out Canvas_Type; X0, Y0, X1, Y1 : Float; color : String)
   is
      Context : Context_2D_Type;
   begin
      Context.Get_Drawing_Context_2D (P.Draw);

      Context.Begin_Path;
      Context.Stroke_Color (UXS (color));
      Context.Line_Width (1);
      Context.Move_To (Sx (P, X0), Sy (P, Y0));
      Context.Line_To (Sx (P, X1), Sy (P, Y1));
      Context.Stroke;
   end Line;

   ---------------
   -- Rectangle --
   ---------------

   overriding procedure Rectangle
     (P : in out Canvas_Type; X0, Y0, X1, Y1 : Float; color : String)
   is
      Context : Context_2D_Type;
      X       : constant Natural := Natural'Min (Sx (P, X0), Sx (P, X1));
      Y       : constant Natural := Natural'Min (Sy (P, Y0), Sy (P, Y1));
      Width   : constant Natural := Natural (abs (Sx (P, X1) - Sx (P, X0)));
      Height  : constant Natural := Natural (abs (Sy (P, Y1) - Sy (P, Y0)));
   begin
      Context.Get_Drawing_Context_2D (P.Draw);

      Context.Begin_Path;
      Context.Stroke_Color (UXS (color));
      Context.Line_Width (1);
      Context.Rectangle (Rectangle => [X, Y, Width, Height]);
      Context.Stroke;
   end Rectangle;

   ---------
   -- Arc --
   ---------

   overriding procedure Arc
     (P : in out Canvas_Type; X0, Y0, Radius, Start_Angle, End_Angle : Float;
      Color :        String)
   is
      Context : Context_2D_Type;
   begin
      Context.Get_Drawing_Context_2D (P.Draw);

      Context.Begin_Path;
      Context.Stroke_Color (UXS (Color));
      Context.Line_Width (1);
      --  Context.Move_To (Sx (P, X0), Sy (P, Y0));
      Context.Arc_Degrees
        (Sx (P, X0), Sy (P, Y0), Sx (P, Radius) - Sx (P, 0.0),
         360.0 - Start_Angle, 360.0 - End_Angle);
      Context.Stroke;
   end Arc;

end Project_Euler.GUI_Plotter.Canvas;
