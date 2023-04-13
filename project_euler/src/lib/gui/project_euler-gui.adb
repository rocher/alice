-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

package body Project_Euler.GUI is

   function Is_Started (Problem : GUI_Type) return Boolean is
     (Problem.Status /= Stop);

   function Is_Stopped (Problem : GUI_Type) return Boolean is
     (Problem.Status = Stop);

   -----------
   -- Start --
   -----------

   procedure Start (Problem : in out GUI_Type) is
   begin
      Problem.Status := Run;
   end Start;

   ----------
   -- Stop --
   ----------

   procedure Stop (Problem : in out GUI_Type) is
   begin
      Problem.Status := Stop;
   end Stop;

   -----------
   -- Pause --
   -----------

   procedure Pause (Problem : in out GUI_Type) is
   begin
      Problem.Status := Pause;
   end Pause;

   -----------------
   -- Wait_To_Run --
   -----------------

   procedure Wait_To_Continue (Problem : in out GUI_Type) is
   begin
      while Problem.Status = Pause loop
         delay (0.1);
      end loop;
      if Problem.Status = Step then
         Problem.Status := Pause;
      end if;
   end Wait_To_Continue;

   -----------------
   -- On_Continue --
   -----------------

   procedure On_Continue (Problem : in out GUI_Type) is
   begin
      Problem.Status := Run;
   end On_Continue;

end Project_Euler.GUI;
