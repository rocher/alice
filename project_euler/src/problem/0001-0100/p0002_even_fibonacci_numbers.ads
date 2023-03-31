-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem=2
--
--  Even Fibonacci numbers
--  ----------------------
--
--  Each new term in the Fibonacci sequence is generated by adding the
--  previous two terms. By starting with 1 and 2, the first 10 terms will be:
--
--                 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
--
--  By considering the terms in the Fibonacci sequence whose values do not
--  exceed four million, find the sum of the even-valued terms.
--
-------------------------------------------------------------------------------

with Project_Euler.GUI;         use Project_Euler.GUI;
with Project_Euler.GUI_Plotter; use Project_Euler.GUI_Plotter;

package P0002_Even_Fibonacci_Numbers is

   type Problem_Type is new GUI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (2);

   overriding function Title (Problem : Problem_Type) return String is
     ("Even Fibonacci numbers");

   overriding function Brief (Problem : Problem_Type) return String is
     ("By considering the terms in the Fibonacci sequence whose values do " &
      "not exceed four million, find the sum of the even-valued terms.");

   overriding function Answer (Problem : in out Problem_Type) return String;

   overriding function Notes (Problem : Problem_Type) return String;

   overriding procedure Plotter_Setup
     (Problem : Problem_Type; Plotter : Pointer_To_Plotter_Class);

   overriding procedure On_Start
     (Problem : in out Problem_Type; Plotter : Pointer_To_Plotter_Class);

end P0002_Even_Fibonacci_Numbers;