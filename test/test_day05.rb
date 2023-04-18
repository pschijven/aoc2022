require 'test_helper'
require 'aoc2022/day05/supply_dock'

class Day05Test < Minitest::Test

  def setup
    @sample_input = <<-SAMPLE
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
    SAMPLE
  end

  def test_sample_input
    supply_dock = SupplyDock.new @sample_input
    supply_dock.apply_rearrangements
    assert_equal "CMZ", supply_dock.crates_at_top
  end

  def test_sample_part2
    supply_dock = SupplyDock.new @sample_input
    supply_dock.apply_rearrangements_by_stack
    assert_equal "MCD", supply_dock.crates_at_top
  end

  def test_day05_part1
    input_file = File.read("data/day05", chomp: true)
    supply_dock = SupplyDock.new input_file
    supply_dock.apply_rearrangements

    assert_equal "VCTFTJQCG", supply_dock.crates_at_top
  end

  def test_day05_part2
    input_file = File.read("data/day05", chomp: true)
    supply_dock = SupplyDock.new input_file
    supply_dock.apply_rearrangements_by_stack

    assert_equal "GCFGLDNJZ", supply_dock.crates_at_top
  end

end

