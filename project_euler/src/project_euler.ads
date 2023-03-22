-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

package Project_Euler is

   function Check_Solution
     (Problem_Number :     Natural; Problem_Answer : String;
      Known_Solution : out Boolean) return Boolean with
     Post => Known_Solution = False and then Check_Solution'Result = False;
   --  Returns True if the solution is known and the Answer is correct, and
   --  sets Known_Solution to True. Returns False if the solution is known
   --  and the Answer is incorrect, and sets Known_Solution to True. Returns
   --  False and sets Known_Solution to False when the solution is not known
   --  by the solution checker.

end Project_Euler;
