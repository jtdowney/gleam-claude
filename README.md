# Advent of Code 2024 - Gleam Solutions

This repository contains solutions for [Advent of Code 2024](https://adventofcode.com/2024) implemented in [Gleam](https://gleam.run/), a type-safe functional programming language that compiles to Erlang and JavaScript.

## Overview

Advent of Code is an annual programming challenge that runs from December 1st to 25th. Each day presents two related puzzles that build programming skills through fun, holiday-themed problems.

This project demonstrates:
- Test-Driven Development (TDD) practices in Gleam
- Functional programming patterns and idioms
- Gleam's type system and error handling with Result types
- File I/O and string parsing techniques
- Using Gleam's standard library effectively

## Project Structure

```
advent_of_code_2024/
├── src/                    # Solution modules
│   ├── day01.gleam        # Day 1 solution
│   ├── day02.gleam        # Day 2 solution (when implemented)
│   └── ...
├── test/                   # Test files
│   ├── day01_test.gleam   # Day 1 tests
│   ├── day02_test.gleam   # Day 2 tests (when implemented)
│   └── ...
├── input/                  # Puzzle input files
│   ├── day01.txt          # Day 1 input
│   ├── day02.txt          # Day 2 input (when added)
│   └── ...
├── gleam.toml             # Project configuration
└── README.md              # This file
```

## Prerequisites

- [Gleam](https://gleam.run/getting-started/installing/) (v1.0.0 or later)
- [Erlang/OTP](https://www.erlang.org/) (installed automatically with Gleam)

## Getting Started

1. Clone this repository:
   ```sh
   git clone <repository-url>
   cd advent_of_code_2024
   ```

2. Install dependencies:
   ```sh
   gleam deps download
   ```

3. Run tests to verify everything is working:
   ```sh
   gleam test
   ```

## Running Solutions

Each day's solution can be run individually:

```sh
# Run Day 1
gleam run -m day01

# Run Day 2 (when implemented)
gleam run -m day02

# And so on...
```

The solutions expect input files in the `input/` directory named `dayXX.txt` where XX is the day number (e.g., `day01.txt`, `day02.txt`).

## Testing

This project follows Test-Driven Development practices. Each solution has comprehensive tests using the examples provided in the problem descriptions.

Run all tests:
```sh
gleam test
```

Run tests and watch for changes:
```sh
gleam test --watch
```

## Development Workflow

1. **Read the problem**: Each day's puzzle is released at midnight EST on [adventofcode.com](https://adventofcode.com/2024)

2. **Write failing tests**: Start by writing tests based on the examples in the problem description

3. **Implement the solution**: Write the minimal code needed to make tests pass

4. **Refactor**: Clean up the code while keeping tests green

5. **Add your input**: Download your personal input from the website and save it to `input/dayXX.txt`

6. **Run the solution**: Execute with `gleam run -m dayXX`

## Solution Structure

Each day's solution follows this pattern:

```gleam
// Parse the input into a structured format
pub fn parse(input: String) -> Result(Input, String) {
  // Implementation
}

// Solve part 1 of the puzzle
pub fn part1(input: Input) -> Int {
  // Implementation
}

// Solve part 2 of the puzzle
pub fn part2(input: Input) -> Int {
  // Implementation
}

// Main entry point
pub fn main() {
  let assert Ok(content) = simplifile.read("input/dayXX.txt")
  let assert Ok(input) = parse(content)
  
  io.println("Part 1: " <> int.to_string(part1(input)))
  io.println("Part 2: " <> int.to_string(part2(input)))
}
```

## Dependencies

- `gleam_stdlib` - Gleam's standard library
- `simplifile` - File system operations
- `gleeunit` - Testing framework (dev dependency)

## Tips for Solving AoC in Gleam

- Use pattern matching extensively - it's one of Gleam's strengths
- Leverage the pipe operator (`|>`) for readable data transformations
- Remember that Gleam lists are linked lists - prepending is O(1), appending is O(n)
- Use `Result` types for error handling instead of exceptions
- The `list`, `string`, and `int` modules from stdlib are your friends
- For performance-critical operations, consider using `dict` or `set` instead of lists

## Contributing

Feel free to open issues or submit pull requests if you find bugs or have suggestions for improvements!

## License

This project is open source and available under the MIT License.
