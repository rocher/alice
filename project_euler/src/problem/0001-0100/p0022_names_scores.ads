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
--                 https://projecteuler.net/problem=22
--
--  Names scores
--  ------------
--
--  Using names.txt (right click and 'Save Link/Target As...'), a 46K text
--  file containing over five-thousand first names, begin by sorting it into
--  alphabetical order. Then working out the alphabetical value for each
--  name, multiply this value by its alphabetical position in the list to
--  obtain a name score.
--
--  For example, when the list is sorted into alphabetical order, COLIN,
--  which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
--  So, COLIN would obtain a score of 938 × 53 = 49714.
--
--  What is the total of all the name scores in the file?
--
-------------------------------------------------------------------------------

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Project_Euler.CLI;     use Project_Euler.CLI;

package P0022_Names_Scores is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (22);

   overriding function Title (Problem : Problem_Type) return String is
     ("Names scores");

   overriding function Brief (Problem : Problem_Type) return String is
     ("What is the total of all the name scores in the file?");

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

end P0022_Names_Scores;
