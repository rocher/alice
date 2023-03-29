<img src="Alice_Adventures.png" width="200" />

# Glossary

   * **CLIs** : Command Line Interfaces (CLIs) are the most basic interfaces
     that a Problem can implement to find the solution and show the answer.
     Users can indirectly influence the algorithm by passing arguments to the
     implemented algorithm.

   * **GUIs** : Graphical User Interfaces (GUIs) are the most advanced
     interfaces a Problem can implement to find the solution, give the answer
     and to draw interesting stuff. Users can interact with a problem by
     setting or changing some algorithm parameters.

   * **Plotter** : Interface used by a Program to create graphical (mostly
     mathematical) representations.

   * **Problem** : Element from a Problem Source implemented using the
    Command Line Interface (CLI), the Graphical User Interface (GUI) or any
    other interface available in ALICE.

   * **Problem Source** : Collection of problems or programming challenges
     that can be implemented using one of the currently available Runners.
     Currently, only [Project Euler](https://projecteuler.net) is supported.

   * **Runner** : Software artifact used to create a program that can show a
     Problem solution, check the validity of that solution or test it against
     a set of test cases. Runners usually implement only one of the
     interfaces that problems can implement (CLI or GUI), but not both.
     Runners are specifically designed to work with a Problem Source. For
     example, a GUI Runner for Project Euler problems is different from a
     Runner for CodinGame problems. This may change in the future.

---
## License
MIT (c) 2023 Francesc Rocher
