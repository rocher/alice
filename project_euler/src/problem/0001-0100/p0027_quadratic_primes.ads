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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Project_Euler.CLI;     use Project_Euler.CLI;

package P0027_Quadratic_Primes is

   type Problem_Type is new CLI_Type with null record;

   overriding function Number (Problem : Problem_Type) return Natural is (27);

   overriding function Title (Problem : Problem_Type) return String is
     ("Quadratic primes");

   overriding function Brief (Problem : Problem_Type) return String is
     ("Find the product of the coefficients, a and b, for the quadratic " &
      "expression that produces the maximum number of primes for " &
      "consecutive values of n, starting with n=0.");

   overriding function Answer
     (Problem : in out Problem_Type; Notes : in out Unbounded_String)
      return String;

end P0027_Quadratic_Primes;
