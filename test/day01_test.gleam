import day01
import gleeunit/should

pub fn parse_example_test() {
  let input =
    "3   4
4   3
2   5
1   3
3   9
3   3"

  let result = day01.parse(input)
  should.be_ok(result)
}

pub fn part1_example_test() {
  let input =
    "3   4
4   3
2   5
1   3
3   9
3   3"

  let assert Ok(parsed) = day01.parse(input)
  let result = day01.part1(parsed)

  should.equal(result, 11)
}

pub fn part2_example_test() {
  let input =
    "3   4
4   3
2   5
1   3
3   9
3   3"

  let assert Ok(parsed) = day01.parse(input)
  let result = day01.part2(parsed)

  should.equal(result, 31)
}
