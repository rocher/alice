<img src="../Alice_Adventures.png" width="200" />

## Alice / Project Euler TODO List

### Short term

   * [ ] Enrich the Plotter interface:
     * [ ] Fix axes labels.
     * [ ] Add answer visualization as text.
     * [ ] Add Problem parameters that users can set/change.
       * [x] Implemented in CLI as program arguments.
       * [ ] Pending to implement in GUI.
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
   * [x] Add unit tests to check if a problem is solved correctly.
     * Implemented in the CLI Runner using MD5 to hide the correct answer. 
   * [ ] Documentation for contributors:
     * [ ] How to implement TUI or GUI Problem.
     * [ ] For GUI Problems, how to use the Plotter and GUI interface.
     * [ ] Instructions to implement new GUI Runners based on a different
       graphic framework.
   * [ ] Explore extension alternatives:
     * [ ] Analyze the possibility to have multi-problem Runners.
     * [ ] Add measures of time and algorithm complexity to compare two
       different implementations.

---
## License
MIT (c) 2023 Francesc Rocher
