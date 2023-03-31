-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with Ada.Finalization;

with Parse_Args;

package Project_Euler.CLI is

   type CLI_Type is
   abstract new Ada.Finalization.Limited_Controlled with null record;

   overriding procedure Initialize (Problem : in out CLI_Type) is null;
   overriding procedure Finalize (Problem : in out CLI_Type) is null;

   function Number (Problem : CLI_Type) return Natural is abstract;
   --  Return the number of the PRoject Euler problem begin solved.

   function Title (Problem : CLI_Type) return String is abstract;
   --  Return the problem name exactly as named by Project Euler.

   function Brief (Problem : CLI_Type) return String is abstract;
   --  Return a brief description of the problem, usually the last sentence
   --  os the description found in Project Euler web site.

   procedure Initialize
     (Problem : CLI_Type; Parser : in out Parse_Args.Argument_Parser) is null;
   --  This procedure allow objects setting global/private stuff and adding
   --  options.

   procedure Set_Options
     (Problem : in out CLI_Type; Parser : Parse_Args.Argument_Parser) is null;

   function Answer (Problem : in out CLI_Type) return String is abstract;
   --  Return a string containing the solution to the problem as it was
   --  entered in the Project Euler web site.

   function Notes (Problem : CLI_Type) return String is abstract;
   --  Return a string with additional considerations to complement the
   --  answer.

end Project_Euler.CLI;
