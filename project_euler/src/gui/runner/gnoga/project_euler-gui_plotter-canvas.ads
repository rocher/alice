-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with Gnoga.Gui.Element.Canvas;
with Gnoga.Gui.View;
with Gnoga.Types;

with Project_Euler.GUI_Runner_Gnoga; use Project_Euler.GUI_Runner_Gnoga;

package Project_Euler.GUI_Plotter.Canvas is

   type Canvas_Type is limited new Plotter_Type with private;
   type Canvas_Access is access Canvas_Type;

   type Canvas_Name is (Back, Draw, Top);

   function Canvas
     (P : Canvas_Type; Name : Canvas_Name)
      return Gnoga.Gui.Element.Canvas.Canvas_Access;

   procedure Create
     (P : in out Canvas_Type; View : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Pause_Callback :        not null Runner_Callback;
      Stop_Callback  :        not null Runner_Callback;
      App_Data       : not null Gnoga.Types.Pointer_to_Connection_Data_Class);

   overriding procedure Start (P : in out Canvas_Type);

   overriding procedure Pause (P : in out Canvas_Type);

   overriding procedure Stop (P : in out Canvas_Type);

   overriding procedure Clear_Plot (P : in out Canvas_Type);

   overriding procedure Set_Axes (P : in out Canvas_Type; Min, Max : Float);

   overriding procedure Set_Axes
     (P : in out Canvas_Type; X_Min, X_Max, Y_Min, Y_Max : Float);

   overriding procedure Draw_Grid
     (P : in out Canvas_Type; X_Major, X_Minor, Y_Major, Y_Minor : Float);

   overriding procedure Draw_Axes
     (P : in out Canvas_Type; X_Label, Y_Label : String);

   overriding procedure Draw_Axes_Rectangle (P : in out Canvas_Type);

   overriding procedure Plot
     (P : in out Canvas_Type; Points : Point_List; Color : String);

   overriding procedure Line
     (P : in out Canvas_Type; X0, Y0, X1, Y1 : Float; color : String);

   overriding procedure Rectangle
     (P : in out Canvas_Type; X0, Y0, X1, Y1 : Float; color : String);

   overriding procedure Arc
     (P : in out Canvas_Type; X0, Y0, Radius, Start_Angle, End_Angle : Float;
      Color :        String);

private

   type Axis_Type is record
      Min       : Float;   -- math x min
      Max       : Float;   -- math x max
      Width     : Natural; -- screen width, pixels
      Margin    : Natural; -- screen margin, pixels
      Has_Ticks : Boolean := False;
   end record;

   type Canvas_Type is limited new Plotter_Type with record
      Back           : Gnoga.Gui.Element.Canvas.Canvas_Type;
      Draw           : Gnoga.Gui.Element.Canvas.Canvas_Type;
      Info           : Gnoga.Gui.Element.Canvas.Canvas_Type;
      Pause_Callback : Runner_Callback                              := null;
      Stop_Callback  : Runner_Callback                              := null;
      App_Data       : Gnoga.Types.Pointer_to_Connection_Data_Class := null;
      X, Y           : Axis_Type;
   end record;

end Project_Euler.GUI_Plotter.Canvas;
