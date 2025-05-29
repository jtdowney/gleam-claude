import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string
import simplifile

pub type Input {
  Input(left: List(Int), right: List(Int))
}

pub fn parse(input: String) -> Result(Input, String) {
  let lines =
    input
    |> string.trim
    |> string.split("\n")
    |> list.filter(fn(line) { line != "" })

  let parsed_lines =
    lines
    |> list.map(fn(line) {
      case string.split(line, "   ") {
        [left, right] -> {
          case int.parse(left), int.parse(right) {
            Ok(l), Ok(r) -> Ok(#(l, r))
            _, _ -> Error("Failed to parse numbers")
          }
        }
        _ -> Error("Invalid line format")
      }
    })

  case list.all(parsed_lines, result.is_ok) {
    True -> {
      let pairs = list.filter_map(parsed_lines, fn(x) { x })
      let left = list.map(pairs, fn(pair) { pair.0 })
      let right = list.map(pairs, fn(pair) { pair.1 })
      Ok(Input(left, right))
    }
    False -> Error("Failed to parse input")
  }
}

pub fn part1(input: Input) -> Int {
  let sorted_left = list.sort(input.left, int.compare)
  let sorted_right = list.sort(input.right, int.compare)

  list.zip(sorted_left, sorted_right)
  |> list.map(fn(pair) {
    let #(l, r) = pair
    int.absolute_value(l - r)
  })
  |> list.fold(0, int.add)
}

pub fn part2(input: Input) -> Int {
  input.left
  |> list.map(fn(left_num) {
    let count = list.count(input.right, fn(right_num) { right_num == left_num })
    left_num * count
  })
  |> list.fold(0, int.add)
}

pub fn main() {
  let assert Ok(content) = simplifile.read("input/day01.txt")
  let assert Ok(input) = parse(content)

  io.println("Part 1: " <> int.to_string(part1(input)))
  io.println("Part 2: " <> int.to_string(part2(input)))
}
