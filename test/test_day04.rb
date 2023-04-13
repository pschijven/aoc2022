require 'test_helper'
require 'aoc2022/day04/section_assignment'

class Day04Test < Minitest::Test

  def test_complete_overlap
    assert !SectionAssignment.new("2-4,6-8").has_complete_overlap?
    assert !SectionAssignment.new("2-3,4-5").has_complete_overlap?
    assert !SectionAssignment.new("5-7,7-9").has_complete_overlap?
    assert SectionAssignment.new("2-8,3-7").has_complete_overlap?
    assert SectionAssignment.new("6-6,4-6").has_complete_overlap?
    assert !SectionAssignment.new("2-6,4-8").has_complete_overlap?
  end

  def test_overlap
    assert !SectionAssignment.new("2-4,6-8").has_overlap?
    assert !SectionAssignment.new("2-3,4-5").has_overlap?
    assert SectionAssignment.new("5-7,7-9").has_overlap?
    assert SectionAssignment.new("2-8,3-7").has_overlap?
    assert SectionAssignment.new("6-6,4-6").has_overlap?
    assert SectionAssignment.new("2-6,4-8").has_overlap?
  end

  def test_part1
    result = File.readlines("data/day04", chomp: true)
        .map { |assignment| SectionAssignment.new(assignment) }
        .filter { |assignment| assignment.has_complete_overlap? }
        .length

    assert_equal 500, result
  end

  def test_part2
    result = File.readlines("data/day04", chomp: true)
                 .map { |assignment| SectionAssignment.new(assignment) }
                 .filter { |assignment| assignment.has_overlap? }
                 .length

    assert_equal 815, result
  end

end