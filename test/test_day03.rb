require "test_helper"
require 'aoc2022/day03/rucksack_reorganization'

class Day03Test < Minitest::Test

  def test_sample_input
    day3 = RucksackReorganization.new
    assert_equal 16, day3.priority("vJrwpWtwJgWrhcsFMMfFFhFp")
    assert_equal 38, day3.priority("jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL")
    assert_equal 42, day3.priority("PmmdzqPrVvPwwTWBwg")
    assert_equal 22, day3.priority("wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn")
    assert_equal 20, day3.priority("ttgJtRGJQctTZtZT")
    assert_equal 19, day3.priority("CrZsJsPPZsGzwwsLwLmpwMDw")
  end

  def test_sample_input_part2
    day3 = RucksackReorganization.new
    assert_equal(18, day3.badge_priority(["vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", "PmmdzqPrVvPwwTWBwg"]))
    assert_equal(52, day3.badge_priority(["wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn", "ttgJtRGJQctTZtZT", "CrZsJsPPZsGzwwsLwLmpwMDw"]))
  end

  def test_day3_part1
    day3 = RucksackReorganization.new
    result = File.readlines("data/day03", chomp: true)
             .map { |line| day3.priority line }
             .sum

    assert_equal 7553, result
  end

  def test_day3_part2
    day3 = RucksackReorganization.new
    result = File.readlines("data/day03", chomp: true)
                 .each_slice(3)
                 .map { |grouped_content| day3.badge_priority grouped_content }
                 .sum

    assert_equal 2758, result
  end
end