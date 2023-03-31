-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with Gnoga.Application.Multi_Connect;
with Gnoga.Gui.Window;
with UXStrings;

with Simple_Logging;

with Project_Euler.GUI_Plotter.Canvas; use Project_Euler.GUI_Plotter.Canvas;

use all type Gnoga.String;

package body Project_Euler.GUI_Runner_Gnoga is
   COL : Gnoga.Gui.View.Grid.Grid_Element_Type renames Gnoga.Gui.View.Grid.COL;
   SPN : Gnoga.Gui.View.Grid.Grid_Element_Type renames Gnoga.Gui.View.Grid.SPN;

   Window_Layout : constant Gnoga.Gui.View.Grid.Grid_Rows_Type :=
     [[COL, COL, COL], [COL, COL, SPN], [COL, COL, SPN]];

   overriding procedure Initialize (Data : in out App_Data_Type) is
   begin
      Simple_Logging.Always ("Initialize App_Data_Type @" & Data'Address'Image);
   end Initialize;

   --  overriding procedure Finalize (Data : in out App_Data_Type) is
   --     procedure Free_Problem is new Ada.Unchecked_Deallocation
   --       (GUI_Type'Class, Pointer_To_GUI_Class);
   --  begin
   --     Free_Problem (Data.Problem);
   --     Simple_Logging.Always ("Finalize App_Data_Type");
   --  end Finalize;

   procedure Button_Start_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   procedure Button_Step_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   procedure Button_Continue_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class);
   procedure Button_Stop_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class);

   Problem_Factory : Project_Euler.GUI_Factory.Pointer_To_Factory_Function :=
     null;

   ---------
   -- UXS --
   ---------

   function UXS
     (Item : UXStrings.ASCII_Character_Array) return UXStrings.UXString renames
     UXStrings.From_ASCII;

   ---------------------------
   -- Button_Start_On_Click --
   ---------------------------

   procedure Button_Start_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class)
   is
      App : constant App_Access := App_Access (Object.Connection_Data);
   begin
      App.Button_Bar.Start.Class_Name ("btn btn-outline-primary");
      App.Button_Bar.Start.Disabled (True);
      App.Button_Bar.Step.Class_Name ("btn btn-info");
      App.Button_Bar.Step.Disabled (False);
      App.Button_Bar.Stop.Class_Name ("btn btn-danger");
      App.Button_Bar.Stop.Disabled (False);
      App.Problem.On_Start (App.Plotter);
   end Button_Start_On_Click;

   --------------------------
   -- Button_Step_On_Click --
   --------------------------

   procedure Pause_Callback
     (App_Data : not null Gnoga.Types.Pointer_to_Connection_Data_Class)
   is
      App : constant App_Access := App_Access (App_Data);
   begin
      App.Problem.On_Step;
      App.Button_Bar.Continue.Class_Name ("btn btn-light");
      App.Button_Bar.Continue.Disabled (False);
   end Pause_Callback;

   procedure Button_Step_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class)
   is
   begin
      Pause_Callback (Object.Connection_Data);
   end Button_Step_On_Click;

   ------------------------------
   -- Button_Continue_On_Click --
   ------------------------------

   procedure Button_Continue_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class)
   is
      App : constant App_Access := App_Access (Object.Connection_Data);
   begin
      App.Button_Bar.Continue.Class_Name ("btn btn-outline-light");
      App.Button_Bar.Continue.Disabled;
      App.Problem.On_Continue;
   end Button_Continue_On_Click;

   --------------------------
   -- Button_Stop_On_Click --
   --------------------------

   procedure Stop_Callback
     (App_Data : not null Gnoga.Types.Pointer_to_Connection_Data_Class)
   is
      App : constant App_Access := App_Access (App_Data);
   begin
      App.Problem.On_Stop;
      App.Button_Bar.Start.Class_Name ("btn btn-primary");
      App.Button_Bar.Start.Disabled (False);
      App.Button_Bar.Step.Class_Name ("btn btn-outline-info");
      App.Button_Bar.Step.Disabled;
      App.Button_Bar.Continue.Class_Name ("btn btn-outline-light");
      App.Button_Bar.Continue.Disabled;
      App.Button_Bar.Stop.Class_Name ("btn btn-outline-danger");
      App.Button_Bar.Stop.Disabled;
   end Stop_Callback;

   procedure Button_Stop_On_Click
     (Object : in out Gnoga.Gui.Base.Base_Type'Class)
   is
   begin
      Stop_Callback (Object.Connection_Data);
   end Button_Stop_On_Click;

   --------------------
   -- On_App_Connect --
   --------------------

   procedure On_App_Connect
     (Main_Window : in out Gnoga.Gui.Window.Window_Type'Class;
      Connection  :        access Gnoga.Application.Multi_Connect
        .Connection_Holder_Type)
   is
      pragma Unreferenced (Connection);
      App : App_Access;
      Canvas : Canvas_Access := new Canvas_Type;
   begin

      App := new App_Data_Type;
      App.Plotter := Pointer_To_Plotter_Class (Canvas);
      App.Problem := Project_Euler.GUI_Runner_Gnoga.Problem_Factory.all;

      Main_Window.Connection_Data (App);
      Gnoga.Application.Title (UXS (App.Problem.Title));

      App.Grid.Create
        (Parent => Main_Window, Layout => Window_Layout, Fill_Parent => True,
         Set_Sizes => False, ID => "app_grid");

      App.Panel_Margin := App.Grid.Panel (1, 1);
      App.Panel_Margin.Padding ("10px", "10px", "10px", "10px");
      App.Panel_Margin.Class_Name ("third-cell");
      App.Panel_Margin.Attribute ("rowspan", "3");

      App.Panel_Title := App.Grid.Panel (1, 2);
      App.Panel_Title.Class_Name ("half-cell");
      App.Panel_Title.Padding ("10px", "10px", "10px", "10px");
      App.Panel_Title.Height (50);
      App.Panel_Title.Put_HTML
        (UXS ("<h2>Problem " & App.Problem.Number'Image & "</h2>"));
      App.Panel_Title.Put_HTML (UXS ("<h1>" & App.Problem.Title & "</h1>"));
      App.Panel_Title.Put_HTML
        (UXS ("<p class='fs-4'>" & App.Problem.Brief & "</p>"));
      App.Panel_Title.Horizontal_Rule;

      App.Button_Bar.Panel := App.Grid.Panel (3, 1);
      App.Button_Bar.Panel.Class_Name ("button_bar");
      App.Button_Bar.Panel.Height (100);

      App.Button_Bar.Start.Create
        (App.Button_Bar.Panel.all, "&nbsp;Start&nbsp;", "button_start");
      App.Button_Bar.Start.Class_Name ("btn btn-primary");
      App.Button_Bar.Start.Access_Key ("s");
      App.Button_Bar.Start.On_Click_Handler
        (Button_Start_On_Click'Unrestricted_Access);

      App.Button_Bar.Step.Create
        (App.Button_Bar.Panel.all, "&nbsp;Step&nbsp;", "button_step");
      App.Button_Bar.Step.Class_Name ("btn btn-outline-info");
      App.Button_Bar.Step.Access_Key ("t");
      App.Button_Bar.Step.Disabled;
      App.Button_Bar.Step.On_Click_Handler
        (Button_Step_On_Click'Unrestricted_Access);

      App.Button_Bar.Continue.Create
        (App.Button_Bar.Panel.all, "&nbsp;Continue&nbsp;", "button_continue");
      App.Button_Bar.Continue.Class_Name ("btn btn-outline-light");
      App.Button_Bar.Continue.Access_Key ("c");
      App.Button_Bar.Continue.Disabled;
      App.Button_Bar.Continue.On_Click_Handler
        (Button_Continue_On_Click'Unrestricted_Access);

      App.Button_Bar.Stop.Create
        (App.Button_Bar.Panel.all, "&nbsp;Stop&nbsp;", "button_stop");
      App.Button_Bar.Stop.Class_Name ("btn btn-outline-danger");
      App.Button_Bar.Stop.Access_Key ("p");
      App.Button_Bar.Stop.Disabled;
      App.Button_Bar.Stop.On_Click_Handler
        (Button_Stop_On_Click'Unrestricted_Access);

      App.Grid.Panel (2, 1).Padding ("10px", "10px", "10px", "10px");
      App.Grid.Panel (2, 1).Margin ("10px", "10px", "10px", "10px");
      App.Grid.Style ("position", "relative");

      Canvas.Create
        (App.Grid.Panel (2, 1), Pause_Callback'Access, Stop_Callback'Access,
         Main_Window.Connection_Data);
      App.Problem.Plotter_Setup (App.Plotter);
   end On_App_Connect;

   ----------
   -- Main --
   ----------

   overriding procedure Run
     (Runner  : Gnoga_Runner_Type;
      Factory : Project_Euler.GUI_Factory.Pointer_To_Factory_Function)
   is
   begin
      Project_Euler.GUI_Runner_Gnoga.Problem_Factory := Factory;

      Gnoga.Application.HTML_On_Close
        ("<h3 style='margin:50px;'>Application closed.<h3>");

      Gnoga.Application.Multi_Connect.Initialize
        (Event => On_App_Connect'Unrestricted_Access, Host => "localhost");

      Gnoga.Application.Multi_Connect.Message_Loop;
   end Run;

end Project_Euler.GUI_Runner_Gnoga;
