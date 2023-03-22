<!--
[![Alire](https://img.shields.io/endpoint?url=https://alire.ada.dev/badges/alice.json)](https://alire.ada.dev/crates/alice.html)
[![Alire CI/CD](https://img.shields.io/endpoint?url=https://alire-crate-ci.ada.dev/badges/alice.json)](https://alire-crate-ci.ada.dev/crates/alice.html)
![unit-test](https://github.com/rocher/alice/actions/workflows/unit-test.yml/badge.svg)
[![GitHub release](https://img.shields.io/github/release/rocher/alice.svg)](https://github.com/rocher/alice/releases/latest)
[![License](https://img.shields.io/github/license/rocher/alice.svg?color=blue)](https://github.com/rocher/alice/blob/master/LICENSE)
-->

<img src="Alice_Adventures.png" width="200" />

# ALICE

> *Adventures for Learning and Inspiring Coding Excellence*

---
## Glossary

   * **GUIs** : Graphical User Interfaces (GUIs) are the most advanced
     interfaces a Problem can implement to find the solution, give the answer
     and to draw interesting stuff. Users can interact with a problem by
     setting or changing some algorithm parameters.
   * **Plotter** : Interface used by a Program to create graphical (mostly
     mathematical) representations.
   * **Problem** : Element from a Problem Source implemented using the Text
    User Interface (TUI), Graphical User Interface (GUI) or any other
    interface available in ALICE.
   * **Problem Source** : Collection of problems or programming challenges
     that can be implemented using one of the currently available Runners.
   * **Runner** : Software artifact used to create a program that can show a
     Problem solution. Runners usually implement only one of the interfaces
     that problems can implement (TUI or GUI), but not both. Runners are
     specifically designed to work with a Problem Source. For example, a GUI
     Runner for Project Euler problems is different from a Runner for
     CodinGame problems.
   * **TUIs** : Textual User Interfaces (TUIs) are the most basic interfaces
     that a Problem can implement to find the solution and show the answer.
     Users can indirectly influence the algorithm by passing arguments to the
     implemented algorithm.

---
## TODO List

### Short term
   * [ ] Enrich the Plotter interface:
     * [ ] Fix axes labels.
     * [ ] Add answer visualization as text.
     * [ ] Add Problem parameters that users can set/change.
     * [ ] Add more Plotter subprograms and parameters.
     * [ ] Add algorithm and steps explanations.
     * [ ] Add legends for graphical elements.
     * [ ] Add more Problem information (URL, difficulty ..)
     * [ ] Check font sizes on axes and GUI in general.
   * [ ] Gnoga: use HTML `div` elements instead of table cells in grid views
     (Gnoga patch)
   * [ ] Refactoring:
     * [ ] Reorganize and rename packages, interfaces and types.
     * [ ] Use `Ada.Finalization.Controlled` types for Plotters and Problems.
   * [ ] Add unit tests to check if a problem is solved correctly.
   * [ ] Documentation for contributors:
     * [ ] How to implement TUI or GUI Problem.
     * [ ] For GUI Problems, how to use the Plotter and GUI interface.
     * [ ] Instructions to implement new GUI Runners based on a different
       graphic framework.
   * [ ] Explore extension alternatives:
     * [ ] Analyze the possibility to have multi-problem Runners.
     * [ ] Add measures of time and algorithm complexity to compare two
       different implementations.

### Mid term
   * [ ] Add other problems sources, like Advent of Code or CodinGame.
   * [ ] Continue solving Project Euler problems.
   * [ ] Publish the project in Alire.

### Long term
   * [ ] Add a user interface to interact with Alice in a similar way one can
     do in CodinGame.

---
## License
MIT (c) 2023 Francesc Rocher
