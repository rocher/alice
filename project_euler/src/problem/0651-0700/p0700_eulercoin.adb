-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher francesc.rocher@gmail.com
--  SPDX-License-Identifier: MIT
--
--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem=700
--
--  Eulercoin
--  ---------
--
--  Leonhard Euler was born on 15 April 1707.
--
--  Consider the sequence 1504170715041707n mod 4503599627370517.
--
--  An element of this sequence is defined to be an Eulercoin if it is
--  strictly smaller than all previously found Eulercoins.
--
--  For example, the first term is 1504170715041707 which is the first
--  Eulercoin. The second term is 3008341430083414 which is greater than
--  1504170715041707 so is not an Eulercoin. However, the third term is
--  8912517754604 which is small enough to be a new Eulercoin.
--
--  The sum of the first 2 Eulercoins is therefore 1513083232796311.
--
--  Find the sum of all Eulercoins.
--
-------------------------------------------------------------------------------

with Euler_Tools_Int3; use Euler_Tools_Int3;
with Text_IO;

package body P0700_Eulercoin is

   N : Integer_Type := 1;

   overriding function Answer (Problem : Problem_Type) return String is
      Eulercoin_Module : constant Integer_Type := 4_503_599_627_370_517;
      Eulercoin_Factor : constant Integer_Type := 1_504_170_715_041_707;
      --  Eulercoin_List   : List_Type;

      Last_Eulercoin : Integer_Type;
      Candidate      : Integer_Type;

      Answer : Integer_Type := 0;
   begin

      Last_Eulercoin := (Eulercoin_Factor * N) mod Eulercoin_Module;
      Answer         := Last_Eulercoin;
      --  Eulercoin_List.Append (Last_Eulercoin);
      loop
         N         := N + 1;
         Candidate := (Eulercoin_Factor * N) mod Eulercoin_Module;

         --  exit when Eulercoin_List.Contains (Candidate) or Candidate <= 1;

         --  Eulercoin_List.Append (Candidate);
         if Candidate < Last_Eulercoin then
            Last_Eulercoin := Candidate;
            Answer         := @ + Candidate;
            Text_IO.Put_Line
              ("N:" & N'Image & ", Candidate:" & Candidate'Image &
               ", Answer:" & Answer'Image);
         end if;

         exit when Candidate <= 1;
      end loop;
      if Candidate <= 1 then
         Answer := @ + 1;
      end if;

      return To_String (Answer);
   end Answer;

   overriding function Notes (Problem : Problem_Type) return String is
   begin
      return "There are" & N'Image & " Eulercoins.";
   end Notes;

end P0700_Eulercoin;
