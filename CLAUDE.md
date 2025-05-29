# Gleam Advent of Code 2024 with Claude Code

This repository demonstrates how to use Claude Code with Gleam by solving Advent of Code 2024 problems. This CLAUDE.md file provides guidelines and references for AI assistance when working with Gleam code.

## Project Overview

This is a Gleam project for solving Advent of Code 2024 problems. Each day's solution should be implemented as a separate module in the `src/` directory.

## Key Gleam Documentation References

### Language Tour
For comprehensive Gleam language features, refer to `@gleam-tour.md`. This covers:
- Basic syntax and types (Int, Float, String, Bool, List)
- Functions, pipelines, and higher-order functions
- Pattern matching and case expressions
- Custom types and records
- Error handling with Result types
- Standard library modules (list, result, dict, option)

### Writing Gleam Guide
For project structure and development workflow, refer to `@writing-gleam.md`. This covers:
- Creating and organizing Gleam projects
- Using the `gleam` build tool
- Managing dependencies with Hex packages
- Testing with gleeunit
- Building and running projects

## Gleam-Specific Guidelines

### Code Style
- Use snake_case for variables and functions
- Use PascalCase for types and constructors
- Prefer piping (`|>`) for function composition
- Use pattern matching instead of if/else where possible
- Leverage the Result type for error handling instead of exceptions

### Project Structure
```
advent_of_code_2024/
├── gleam.toml
├── src/
│   ├── advent_of_code_2024.gleam  # Main module
│   ├── day01.gleam                 # Day 1 solution
│   ├── day02.gleam                 # Day 2 solution
│   └── ...
├── test/
│   ├── day01_test.gleam
│   ├── day02_test.gleam
│   └── ...
└── input/
    ├── day01.txt
    ├── day02.txt
    └── ...
```

### Common Patterns for AoC Problems

#### Reading Input Files
```gleam
import simplifile

pub fn read_input(day: String) -> Result(String, simplifile.FileError) {
  simplifile.read("input/" <> day <> ".txt")
}
```

#### Parsing Input
Use string manipulation functions from `gleam/string` and consider these patterns:
- Split lines: `string.split(input, "\n")`
- Parse integers: `int.parse(str)`
- Filter empty lines: `list.filter(lines, fn(line) { line != "" })`

#### Working with Lists
The `gleam/list` module is essential for AoC:
- `list.map` - Transform elements
- `list.filter` - Select elements
- `list.fold` - Reduce to single value
- `list.find` - Find first matching element
- `list.zip` - Combine two lists

#### Error Handling
Use Result types consistently:
```gleam
use line <- result.try(parse_line(input))
use number <- result.map(int.parse(line))
```

### Testing Strategy
- Write tests for example inputs provided in AoC problems
- Test edge cases and parsing functions separately
- Use `gleeunit` for test organization

### Performance Considerations
- Gleam lists are linked lists - prepending is O(1), appending is O(n)
- Use tail recursion for loops to avoid stack overflow
- Consider using `dict` for lookups instead of repeated list searches
- The `set` type (from `gleam/set`) is useful for membership tests

### Useful Dependencies for AoC
Consider adding these packages:
- `simplifile` - For file operations
- `gleam_community/maths` - Additional math functions
- `gleam_community/colour` - For visualization (optional)

## AI Assistance Guidelines

When helping with AoC problems:

1. **Start Simple**: Begin with a working solution for the example, then handle the full input
2. **Parse First**: Focus on correctly parsing the input before solving the problem
3. **Use Types**: Define custom types to model the problem domain clearly
4. **Test Driven**: Write tests for examples before implementing the solution
5. **Functional Style**: Embrace immutability and functional patterns
6. **Error Handling**: Use Result types and handle all error cases explicitly

## Example Day Solution Template

```gleam
// ABOUTME: Solution for Advent of Code 2024 Day XX
// ABOUTME: Implements parsing and solving functions with proper error handling

import gleam/int
import gleam/list
import gleam/result
import gleam/string
import simplifile

pub type Input {
  // Define your parsed input type here
}

pub fn parse(input: String) -> Result(Input, String) {
  // Parse the input string into your data structure
  todo
}

pub fn part1(input: Input) -> Int {
  // Solve part 1
  todo
}

pub fn part2(input: Input) -> Int {
  // Solve part 2
  todo
}

pub fn main() {
  let assert Ok(content) = simplifile.read("input/day01.txt")
  let assert Ok(input) = parse(content)
  
  io.println("Part 1: " <> int.to_string(part1(input)))
  io.println("Part 2: " <> int.to_string(part2(input)))
}
```

## Common Gotchas

1. **Division by zero** returns 0 in Gleam, not an error
2. **String concatenation** uses `<>` operator, not `+`
3. **Equality** is structural, works on any type with `==`
4. **No early returns** - use pattern matching and Result types
5. **No null** - use Option type for optional values
6. **No exceptions** - use Result type for fallible operations

## Memory: Gleam Keywords

- You can use the `todo` keyword when something is not done yet

Remember to refer to the documentation files for detailed language features and project setup instructions.