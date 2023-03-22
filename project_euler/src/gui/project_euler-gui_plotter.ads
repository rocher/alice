-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;

package Project_Euler.GUI_Plotter is

   type Math_Point is record
      X, Y : Float;
   end record;

   type Device_Point is record
      X, Y : Natural;
   end record;

   overriding function "=" (A, B : Math_Point) return Boolean is
     (A.X = B.X and then A.Y = B.Y);

   package Point_Package is new Doubly_Linked_Lists (Math_Point);
   subtype Point_List is Point_Package.List;

   type Plotter_Type is limited interface;
   type Pointer_To_Plotter_Class is access all Plotter_Type'Class;

   procedure Start (Plotter : in out Plotter_Type) is abstract;
   --  Informs the Plotter that the computation starts. Usually Clears the
   --  plot area.

   procedure Pause (Plotter : in out Plotter_Type) is abstract;
   --  Informs the Plotter that the computation is paused. Usually calls also
   --  a callback given by the Runner to act accordingly.

   procedure Stop (Plotter : in out Plotter_Type) is abstract;
   --  Informs the Plotter that the computation has ben stopped, either by
   --  the user or because it has finished. Usually also calls a callback
   --  given by the Runner.

   procedure Clear_Plot (Plotter : in out Plotter_Type) is abstract;
   --  Cleat the Plot and Info areas; keeps the Axes area intact.

   procedure Set_Axes
     (Plotter : in out Plotter_Type; Min, Max : Float) is abstract;
   --  Set symmetric mathematical coordinates X and Y; range [Min, Max] is
   --  guaranteed to be available both at X and Y, independently of the size
   --  of the device horizontal and vertical size. Also guarantees that units
   --  in X and Y have the same length in the device.

   procedure Set_Axes
     (Plotter                    : in out Plotter_Type;
      X_Min, X_Max, Y_Min, Y_Max :        Float) is abstract;
   --  Set asymmetric mathematical coordinates for X and Y; both ranges are
   --  available in the device independently of the range widths and device
   --  lengths.

   procedure Draw_Grid
     (Plotter                            : in out Plotter_Type;
      X_Major, X_Minor, Y_Major, Y_Minor :        Float) is abstract;
   --  Draw the grid in the Axes area and put labels wit units in major
   --  ticks. Do not draw lines (nor labels) when a parameter is 0.0.

   procedure Draw_Axes
     (Plotter : in out Plotter_Type; X_Label, Y_Label : String) is abstract;
   --  Draw Axes X and Y, if visible, and add specified labels.

   procedure Draw_Axes_Rectangle (Plotter : in out Plotter_Type) is abstract;
   --  Draw a rectangle enclosing all available mathematical coordinates.

   procedure Plot
     (Plotter : in out Plotter_Type; Points : Point_List;
      Color   :        String) is abstract;
   --  Plot the given map represented as a point list.

   procedure Line
     (Plotter : in out Plotter_Type; X0, Y0, X1, Y1 : Float;
      color   :        String) is abstract;
   --  Draw the line between the indicated points.

   procedure Rectangle
     (Plotter : in out Plotter_Type; X0, Y0, X1, Y1 : Float;
      color   :        String) is abstract;
   --  Draw a rectangle with corners in the indicated points.

   procedure Arc
     (Plotter                                : in out Plotter_Type;
      X0, Y0, Radius, Start_Angle, End_Angle :        Float;
      color                                  :        String) is abstract;
   --  Draw and arc with center in the indicated point, with the given
   --  Radius, and starting and ending in the indicated angles. Angles are
   --  measured in degrees as in mathematics: angle 0 is over X axe and
   --  increases counterclockwise.

end Project_Euler.GUI_Plotter;
