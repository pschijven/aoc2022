require 'test_helper'
require 'aoc2022/day06/start_marker_finder'

class Day05Test < Minitest::Test

  def setup
    @finder = StartMarkerFinder.new
  end

  def test_samples_part1
    assert_equal 7, @finder.find_start_of_packet_marker('mjqjpqmgbljsphdztnvjfqwrcgsmlb')
    assert_equal 5, @finder.find_start_of_packet_marker('bvwbjplbgvbhsrlpgdmjqwftvncz')
    assert_equal 6, @finder.find_start_of_packet_marker('nppdvjthqldpwncqszvftbrmjlhg')
    assert_equal 10, @finder.find_start_of_packet_marker('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg')
    assert_equal 11, @finder.find_start_of_packet_marker('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw')
  end

  def test_samples_part2
    assert_equal 19, @finder.find_start_of_message_marker('mjqjpqmgbljsphdztnvjfqwrcgsmlb')
    assert_equal 23, @finder.find_start_of_message_marker('bvwbjplbgvbhsrlpgdmjqwftvncz')
    assert_equal 23, @finder.find_start_of_message_marker('nppdvjthqldpwncqszvftbrmjlhg')
    assert_equal 29, @finder.find_start_of_message_marker('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg')
    assert_equal 26, @finder.find_start_of_message_marker('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw')
  end

  def test_part_1
    result = @finder.find_start_of_packet_marker(File.read('data/day06', chomp: true))
    assert_equal 1929, result
  end

  def test_part_2
    result = @finder.find_start_of_message_marker(File.read('data/day06', chomp: true))
    assert_equal 3298, result
  end

end