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

with Ada.Strings.Unbounded;              use Ada.Strings.Unbounded;
with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;
with Text_IO;                            use Text_IO;

with Euler_Tools; use Euler_Tools;

package body P0022_Names_Scores is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      subtype Name_Type is Ada.Strings.Unbounded.Unbounded_String;

      package Name_Package is new Doubly_Linked_Lists (Name_Type);
      use Name_Package;

      package Sorting is new Name_Package.Generic_Sorting;

      Names  : List;
      Answer : Natural := 0;

      function Read_Name (Input : File_Type) return Name_Type is
         Char : Character;
         Name : Name_Type := To_Unbounded_String ("");
      begin
         loop
            Get (Input, Char);
            exit when Char = '"';
            Name.Append (Char);
         end loop;
         return Name;
      end Read_Name;

      function To_Number (Name : Name_Type) return Natural is
         Number : Natural := 0;
      begin
         for C of To_String (Name) loop
            Number :=
              @ + Character'Enum_Rep (C) - Character'Enum_Rep ('A') + 1;
         end loop;
         return Number;
      end To_Number;
   begin

      declare
         Input     : File_Type;
         Next_Char : Character;
         EOL       : Boolean;
      begin
         Open (Input, In_File, "input/p0022_names_scores.txt");
         loop
            --  opening " character
            Get (Input, Next_Char);
            Names.Append (Read_Name (Input));
            --  closing " character : already read by Read_Name function

            Look_Ahead (Input, Next_Char, EOL);
            exit when Next_Char /= ',';
            Get (Input, Next_Char);  --  skip ','
         end loop;
         Close (Input);
      end;

      Sorting.Sort (Names);

      declare
         Index : Natural := 1;
      begin
         for Name of Names loop
            Answer := @ + (Index * To_Number (Name));
            Index  := @ + 1;
         end loop;
      end;

      return To_String (Answer);
   end Answer;

end P0022_Names_Scores;
