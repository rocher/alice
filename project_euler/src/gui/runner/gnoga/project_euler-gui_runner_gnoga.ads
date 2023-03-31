-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with Ada.Finalization; use Ada.Finalization;

with Gnoga.Gui.Base;
with Gnoga.Gui.Element;
with Gnoga.Gui.Element.Common;
with Gnoga.Gui.View;
with Gnoga.Gui.View.Grid;

with Project_Euler.GUI;                use Project_Euler.GUI;
with Project_Euler.GUI_Factory; use Project_Euler.GUI_Factory;
with Project_Euler.GUI_Runner;  use Project_Euler.GUI_Runner;
with Project_Euler.GUI_Plotter; use Project_Euler.GUI_Plotter;

with Gnoga.Types;

package Project_Euler.GUI_Runner_Gnoga is

   type Gnoga_Runner_Type is new Runner_Type with null record;

   type Runner_Callback is
     access procedure
       (App_Data : not null Gnoga.Types.Pointer_to_Connection_Data_Class);

   overriding procedure Run
     (Runner : Gnoga_Runner_Type; Factory : Pointer_To_Factory_Function);

private

   type Button_Bar_Type is record
      Panel    : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Start    : Gnoga.Gui.Element.Common.Button_Type;
      Step     : Gnoga.Gui.Element.Common.Button_Type;
      Continue : Gnoga.Gui.Element.Common.Button_Type;
      Stop     : Gnoga.Gui.Element.Common.Button_Type;
   end record;

   type App_Data_Type is new Gnoga.Types.Connection_Data_Type with record
      Grid         : Gnoga.Gui.View.Grid.Grid_View_Type;
      Panel_Margin : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Panel_Title  : Gnoga.Gui.View.Pointer_To_View_Base_Class;
      Button_Bar   : Button_Bar_Type;
      Plotter      : Pointer_To_Plotter_Class := null; -- aliased Canvas_Type;
      Problem      : Pointer_To_GUI_Class := null;
   end record;
   type App_Access is access all App_Data_Type;

   overriding procedure Initialize (Data : in out App_Data_Type);
   --  overriding procedure Finalize (Data : in out App_Data_Type);

end Project_Euler.GUI_Runner_Gnoga;
