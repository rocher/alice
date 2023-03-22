-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with Project_Euler.GUI; use Project_Euler.GUI;

package Project_Euler.GUI_Factory is

   generic
      type GUI_Problem_Type (<>) is new GUI_Type with private;
   function Problem_Factory return Pointer_To_GUI_Class;
   --  Instances of this function return a Problem object that implement the
   --  GUI.

   type Pointer_To_Factory_Function is
     access function return Pointer_To_GUI_Class;
   --  Function used to instantiated Problems of a given type. Runners use
   --  objects of this type to create Problem objects.

end Project_Euler.GUI_Factory;
