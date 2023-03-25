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

with Project_Euler.CLI; use Project_Euler.CLI;

package P0700_Eulercoin is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (700);

   overriding function Title (Problem : Problem_Type) return String is
     ("Eulercoin");

   overriding function Brief (Problem : Problem_Type) return String is
     ("Find the sum of all Eulercoins.");

   overriding function Answer (Problem : Problem_Type) return String;

   overriding function Notes (Problem : Problem_Type) return String;

end P0700_Eulercoin;
