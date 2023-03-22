-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with Project_Euler.GUI_Runner;  use Project_Euler.GUI_Runner;
with Project_Euler.GUI_Factory; use Project_Euler.GUI_Factory;

with Gnoga.Types;

package Project_Euler.GUI_Runner_Gnoga is

   type Gnoga_Runner_Type is new Runner_Type with null record;

   type Runner_Callback is
     access procedure
       (App_Data : not null Gnoga.Types.Pointer_to_Connection_Data_Class);

   overriding procedure Run
     (Runner : Gnoga_Runner_Type; Factory : Pointer_To_Factory_Function);

end Project_Euler.GUI_Runner_Gnoga;
