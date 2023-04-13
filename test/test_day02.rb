require "test_helper"
require 'aoc2022/day02/round'

class Day02Test < Minitest::Test

  def test_part1_samples
    assert_equal 8, Round.score("A Y")
    assert_equal 1, Round.score("B X")
    assert_equal 6, Round.score("C Z")
  end

  def test_part2_samples
    assert_equal 4, Round.encrypted_score("A Y")
    assert_equal 1, Round.encrypted_score("B X")
    assert_equal 7, Round.encrypted_score("C Z")
  end

  def test_day2_part1
    result = File.readlines('data/day02', chomp: true)
        .map { |line| Round.score(line) }
        .sum

    assert_equal(11475, result)
  end

  def test_day2_part2
    result = File.readlines('data/day02', chomp: true)
                 .map { |line| Round.encrypted_score(line) }
                 .sum

    assert_equal(16862, result)
  end

end