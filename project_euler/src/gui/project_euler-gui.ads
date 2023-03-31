-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with Project_Euler.CLI;         use Project_Euler.CLI;
with Project_Euler.GUI_Plotter; use Project_Euler.GUI_Plotter;

package Project_Euler.GUI is

   type GUI_Type is abstract new CLI_Type with private;
   type Pointer_To_GUI_Class is access all GUI_Type'Class;

   --  -----------------------------------------------
   --  Subprograms implemented by the Problem/GUI_Type

   procedure Plotter_Setup
     (Problem : GUI_Type; Plotter : Pointer_To_Plotter_Class) is abstract;
   --  Prepares the Plotter for a graphical representation of a Problem.

   procedure On_Start
     (Problem : in out GUI_Type;
      Plotter :        Pointer_To_Plotter_Class) is abstract;
   --  Main procedure to be implemented by Problems inheriting from
   --  GUI_Type. Runners will call it when the user press the Start button.

   --  ---------------------------------------------------
   --  Common subprograms used by all implemented Problems

   procedure Start (Problem : in out GUI_Type);
   --  Procedure used by problems to signal the starting of a problem.
   --  Usually called at the beginning of the On_Start implementation.

   procedure Stop (Problem : in out GUI_Type);
   --  Procedure used by problems to signal that the problem has stopped,
   --  usually called at the end of the On_Start implementation.

   procedure Pause (Problem : in out GUI_Type);
   --  Procedure used by problems to signal that the problem has paused,
   --  usually because it is in an special state or point in the search
   --  space.

   function Is_Started (Problem : GUI_Type) return Boolean;
   --  Return True if the problem has already been started.

   function Is_Stopped (Problem : GUI_Type) return Boolean;
   --  Return True if the problem has been stopped.

   procedure Wait_To_Continue (Problem : in out GUI_Type);
   --  Procedure used by problems to wait a small amount of time to react to
   --  Pause, Step or Stop events.

   --  ---------------------------------------------------------------
   --  Subprograms used by Runners to transmit user events to Problems

   procedure On_Step (Problem : in out GUI_Type) renames Pause;
   --  Allows the Runner to set the status of the problem to Paused.

   procedure On_Continue (Problem : in out GUI_Type);
   --  Allows the Runner to set the status of the problem to Run again.

   procedure On_Stop (Problem : in out GUI_Type) renames Stop;
   --  Allows the Runner to set the status of the problem to Stop.

private

   type Status_Value is (Stop, Run, Step, Pause);

   type GUI_Type is abstract new CLI_Type with record
      Status : Status_Value := Stop;
      pragma Atomic (Status);
   end record;

end Project_Euler.GUI;
