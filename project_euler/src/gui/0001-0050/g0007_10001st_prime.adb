-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with Project_Euler.GUI_Runner_Gnoga; use Project_Euler.GUI_Runner_Gnoga;
with Project_Euler.GUI_Factory;      use Project_Euler.GUI_Factory;

with P0007_10001st_Prime; use P0007_10001st_Prime;

procedure G0007_10001st_Prime is

   Runner : Gnoga_Runner_Type;
   function P0007_Factory is new Problem_Factory (Problem_Type);

begin

   Runner.Run (P0007_Factory'Unrestricted_Access);

end G0007_10001st_Prime;
