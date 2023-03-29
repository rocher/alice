<img src="../Alice_Adventures.png" width="200" />

## Alice / Codingame TODO List

### Short term

   * Add support for puzzles, based on [Project Euler
     CLI](../project_euler/src/cli/).
   * Use cases:
     * Add test cases of puzzles users already solved in Codingame (must be
       added manually, unfortunately).
     * Provide a solution for a puzzle and check it against an existing set
       of test cases.
   * [ ] Provide an automatic test case checker so that users can add a
     solution, the set of test cases they found in Codingame and check the
     correctness of the implementation.

### Mid term

   * Add support for *visual* or game-like puzzles, e.g. "Mars Lander" and
     "Power of Thor".
   * Use cases:
     * Add visual effects for a given puzzle.
     * Provide a solution for a puzzle and check it with the already
       implemented visualization.
   * [ ] Implement a basic *game engine* to allow the implementation of this
     kind of puzzles and the interaction with the users implementation.
     * [ ] Specify the game engine interface independent of the graphics
       library used by the *game runner* implementation, like in [Project
       Euler GUI](../project_euler/src/gui/).
     * [ ] Provide an implementation using one of the available graphic
       frameworks.
       * [ ] Implement the game visualizer.
       * [ ] Implement the game runner & checker.
       * [ ] Implement some sample games.

### Long term

   * [ ] Add support for interactive development like in Codingame.

---
## License
MIT (c) 2023 Francesc Rocher
