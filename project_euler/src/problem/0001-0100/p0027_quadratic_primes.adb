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
--                 https://projecteuler.net/problem=27
--
--  Quadratic primes
--  ----------------
--
--  Euler discovered the remarkable quadratic formula:
--
--                 n² + n + 41
--
--  It turns out that the formula will produce 40 primes for the consecutive
--  integer values 0 <= n <= 39. However, when n=40, 40²+40+41=40(40+1)+41 is
--  divisible by 41, and certainly when n=41, 41²+41+41 is clearly divisible
--  by 41.
--
--  The incredible formula n² - 79n + 1601 was discovered, which produces 80
--  primes for the consecutive values 0 <= n <= 79. The product of the
--  coefficients, −79 and 1601, is −126479.
--
--  Considering quadratics of the form:
--
--                 n² + an + b, where |a| < 1000 and |b| <= 1000
--
--  where |n| is the modulus/absolute value of n
--
--  Find the product of the coefficients, a and b, for the quadratic
--  expression that produces the maximum number of primes for consecutive
--  values of n, starting with n=0.
--
-------------------------------------------------------------------------------

with Euler_Tools; use Euler_Tools;

package body P0027_Quadratic_Primes is

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String
   is
      Coefficient_A, Coefficient_B : Integer_Type;
      Max_Sequence                 : Natural := 0;

      A, B    : Integer_Type;
      N, Eval : Integer_Type;
      Cursor  : Prime_Cursor_Type;
      Answer  : Integer_Type;
   begin

      B := Prime_First (Cursor);
      Over_B :
      loop

         A := -B;
         Over_A :
         loop

            N := 0;
            Finding_Primes :
            loop
               Eval := (N**2) + (A * N) + B;

               exit Finding_Primes when Eval <= 0 or else not Is_Prime (Eval);

               N := N + 1;
            end loop Finding_Primes;

            if N > Max_Sequence then
               Answer        := A * B;
               Coefficient_A := A;
               Coefficient_B := B;
               Max_Sequence  := N;
            end if;

            Next_A :
            loop
               A := A + 1;
               exit Next_A when Is_Prime (1 + A + B);
            end loop Next_A;

            exit Over_A when abs (A) >= 1_000;
         end loop Over_A;

         B := Prime_Next (Cursor);
         exit Over_B when B > 1_000;
      end loop Over_B;

      Notes :=
        To_Unbounded_String
          ("Coefficients a =" & Coefficient_A'Image & ", b =" &
           Coefficient_B'Image & " produce a sequence of" &
           Max_Sequence'Image & " primes.");

      return To_String (Answer);
   end Answer;

end P0027_Quadratic_Primes;
