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
--                 https://projecteuler.net/problem=8
--
--  Largest product in a series
--  ---------------------------
--
--  The four adjacent digits in the 1000-digit number that have the greatest
--  product are 9 × 9 × 8 × 9 = 5832.
--
--  Find the thirteen adjacent digits in the 1000-digit number that have the
--  greatest product. What is the value of this product?
--
-------------------------------------------------------------------------------

with Euler_Tools_Int1; use Euler_Tools_Int1;

package body P0008_Largest_Product_In_A_Series is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Series  : constant String :=
        "731671765313306249192251196744265747423553491949349698352031277450" &
        "632623957831801698480186947885184385861560789112949495459501737958" &
        "331952853208805511125406987471585238630507156932909632952274430435" &
        "576689664895044524452316173185640309871112172238311362229893423380" &
        "308135336276614282806444486645238749303589072962904915604407723907" &
        "138105158593079608667017242712188399879790879227492190169972088809" &
        "377665727333001053367881220235421809751254540594752243525849077116" &
        "705560136048395864467063244157221553975369781797784617406495514929" &
        "086256932197846862248283972241375657056057490261407972968652414535" &
        "100474821663704844031998900088952434506585412275886668811642717147" &
        "992444292823086346567481391912316282458617866458359124566529476545" &
        "682848912883142607690042242190226710556263211111093705442175069416" &
        "589604080719840385096245544436298123098787992724428490918884580156" &
        "166097919133875499200524063689912560717606058861164671094050775410" &
        "022569831552000559357297257163626956188267042825248360082325753042" &
        "0752963450";
      Product : Integer_Type;
      Answer  : Integer_Type    := 0;
   begin

      for I in Series'First .. Series'Last - 12 loop
         Product := 1;
         for C of Series (I .. I + 12) loop
            Product := @ * To_Number (C);
         end loop;
         Answer := Integer_Type'Max (@, Product);
      end loop;

      return To_String (Answer);
   end Answer;

end P0008_Largest_Product_In_A_Series;
