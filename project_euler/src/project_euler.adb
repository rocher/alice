-------------------------------------------------------------------------------
--
--  ALICE - Adventures for Learning and Inspiring Coding Excellence
--  Copyright (c) 2023 Francesc Rocher <francesc.rocher@gmail.com>
--  SPDX-License-Identifier: MIT
--
-------------------------------------------------------------------------------

with GNAT.MD5;
with Ada.Strings.Fixed;

package body Project_Euler is

   function Check_Solution
     (Problem_Number :     Natural; Problem_Answer : String;
      Known_Solution : out Boolean) return Boolean
   is
      --  ! Implementation will change when known solutions reach a big     !
      --  ! number; migrating to a sqlite database could be a nice idea.    !

      --  * Kind reminder: to add a new solution digest, please compute the *
      --  * md5sum of the string "<PROBLEM_NUMBER>.<PROBLEM_ANSWER>", with  *
      --  * no quotes and no end-of-line characters ('\n', '\r\n') added by *
      --  * CLI 'echo' commands.

      Digest : constant String :=
        GNAT.MD5.Digest
          (Ada.Strings.Fixed.Trim (Problem_Number'Image, Ada.Strings.Both) &
           "." & Problem_Answer);
   begin
      Known_Solution := True;

      case Problem_Number is
         when 1 =>
            return Digest = "1a92d5f2bcdfaec7947ae296a833fa17";
         when 2 =>
            return Digest = "56cd819215fa0dfdf34d0e52a6d76ed8";
         when 3 =>
            return Digest = "41e56a77c2cdd42b6e35a5f039b9619a";
         when 4 =>
            return Digest = "e62a960357f01a2ca7901f33c5d3ec98";
         when 5 =>
            return Digest = "fd29726a9d9ab4a5a4874d236d74c010";
         when 6 =>
            return Digest = "3a9deefa77469a0bd5661cdcd505107c";
         when 7 =>
            return Digest = "f7f90bcd72bea1feade51693ab5286aa";
         when 8 =>
            return Digest = "73c95c705f2c911b0bc6c9a8b324ece3";
         when 9 =>
            return Digest = "5a6420d44876df31d4fbc611c4477cdd";
         when 10 =>
            return Digest = "db96e3fdc46f5eb014537b1d66afc4e4";
         when 11 =>
            return Digest = "7d7d085d682d4b48b121e754ae2f0da8";
         when 12 =>
            return Digest = "bc52b79d88b525f2b9a84b8032f9cd88";
         when 13 =>
            return Digest = "3ac74e6b7bd171f3330bc7947ed96fa8";
         when 14 =>
            return Digest = "e503e78ff329f3111d1746c484065aac";
         when 15 =>
            return Digest = "0faf7eb58d08a2234b9ec3aeeeae5eb5";
         when 16 =>
            return Digest = "f4049f238a93762e5fd0828eafaefc62";
         when 17 =>
            return Digest = "7cdfaa4b89a3229107e2bc569394d594";
         when 18 =>
            return Digest = "d17129c0f88af6ee08088ba0a1f7376c";
         when 19 =>
            return Digest = "28758efce8718eb740a4aba0507a8204";
         when 20 =>
            return Digest = "8c684faeec579cae79e872e4c147c489";
         when 21 =>
            return Digest = "454e187b1a12a7839611df5b5d591170";
         when 22 =>
            return Digest = "e1fb6af73e56d847e65d097bd9e3e156";
         when 23 =>
            return Digest = "c3719bff19cab38325b39a961c155d1d";
         when 24 =>
            return Digest = "d5833cc73700b6c6b957b8003da79564";
         when 25 =>
            return Digest = "4855b796a626e51d5e912b1cbb3d3017";
         when 26 =>
            return Digest = "6481984a35ffd070fae68f470dca1328";
         when 27 =>
            return Digest = "1276d07f87a19b83a24a09f68d817ff3";
         when 28 =>
            return Digest = "a0494c17f7d92e4ca945afc8f4965768";
         when 29 =>
            return Digest = "29f17e453137423bbadf80dcf7cb2c20";
         when 30 =>
            return Digest = "6a7e8ec4fff83f42ddbd7dd1b012b5de";

         when others =>
            Known_Solution := False;
            return False;
      end case;
   end Check_Solution;

end Project_Euler;
