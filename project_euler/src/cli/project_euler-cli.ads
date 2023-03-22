-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

package Project_Euler.CLI is

   type CLI_Type is interface;

   function Number (Problem : CLI_Type) return Natural is abstract;
   --  Return the number of the PRoject Euler problem begin solved.

   function Title (Problem : CLI_Type) return String is abstract;
   --  Return the problem name exactly as named by Project Euler.

   function Brief (Problem : CLI_Type) return String is abstract;
   --  Return a brief description of the problem, usually the last sentence
   --  os the description found in Project Euler web site.

   function Answer (Problem : CLI_Type) return String is abstract;
   --  Return a string containing the solution to the problem as it was
   --  entered in the Project Euler web site.

   function Notes (Problem : CLI_Type) return String is abstract;
   --  Return a string with additional considerations to complement the
   --  answer.

end Project_Euler.CLI;
