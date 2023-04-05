-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) {YEAR} {NAME} {EMAIL}
--  SPDX-License-Identifier: MIT
--
--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem={NUMBER}
--
--  {TITLE}
--  -------
--
--  {DESCRIPTION}
--
--  {BRIEF}
--
-------------------------------------------------------------------------------

with Project_Euler.CLI; use Project_Euler.CLI;

package P{0NUM}_{PACKAGE_TITLE} is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is
     ({NUMBER});

   overriding function Title (Problem : Problem_Type) return String is
     ("{TITLE}");

   overriding function Brief (Problem : Problem_Type) return String is
     ("{BRIEF}");

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

end P{0NUM}_{PACKAGE_TITLE};

-- --- 8< --- 8< --- 8< --- 8< --- 8< --- 8< --- 8< --- 8< --- 8< --- 8< --- 
--
--  INSTRUCTIONS based of the example problem 826 "Birds on a wire"
--  REMOVE this INSTRUCTIONS sections when finished
--
--  + Line 4: {YEAR}, {NAME} and {EMAIL} are optional, but we recommend to
--    clearly state that you're the copyright owner.
--
--  + Lines 11, 29: {NUMBER} is the problem number, 826 in this case.
--
--  + Lines 13, 32: {TITLE} is the title of the problem exactly as it appears
--    in the Project Euler website: "Birds on a wire" (w/o quotes in line
--    13). Adjust the underline in line 14 to the title length.
--
--  + Line 16: {DESCRIPTION} is the problem description exactly as it appears
--    in the Project Euler website. Minor format adjustments are allowed to
--    accommodate the HTML contents to plain text. Occupy as many lines as
--    necessary to keep the width of the paragraphs no longer than 80
--    characters. Use spaces, not tabs. Remember that Ada style checker
--    requires two spaces between the comment start '--' and the first
--    non-space character.
--
--  + Lines 18, 35: {BRIEF} if the final statement of the problem exactly as
--    it appears in the Project Euler website. Again, minor adjustments to
--    accommodate HTML to plain text and width are allowed.
--
--  + Line 24, 42: {0NUM} is the problem number, left-padded with 0 to form a
--    number of four digits, 0826 in this case.
--
--  + Line 24, 42: {PACKAGE_TITLE} is a valid Ada identifier formed with the
--    problem title in Title_Case convention, Birds_On_A_Wire in this
--    example.
--
-- --- 8< --- 8< --- 8< --- 8< --- 8< --- 8< --- 8< --- 8< --- 8< --- 8< --- 
