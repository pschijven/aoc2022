require "test_helper"
require 'aoc2022/day01/day01'

class Day01Test < Minitest::Test

  def test_day01_maxcalories
    day01 = Day01.new("data/day01")
    assert_equal 66719, day01.find_max_calories
  end

  def test_top3_calories
    day01 = Day01.new("data/day01")
    assert_equal 22, day01.find_top3_max_calories
  end

end
