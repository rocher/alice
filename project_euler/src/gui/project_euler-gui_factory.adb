-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

package body Project_Euler.GUI_Factory is

   function Problem_Factory return Pointer_To_GUI_Class is
     (new GUI_Problem_Type);

end Project_Euler.GUI_Factory;
