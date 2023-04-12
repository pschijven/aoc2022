require_relative 'round'

class Day02 < Aoc2022Base

  def score
    read_lines
      .map { |line| Round.score(line) }
      .sum
  end

  def encrypted_score
    read_lines
      .map { |line| Round.encrypted_score(line) }
      .sum
  end

  private

  def read_lines
    File.readlines(@filename, chomp: true)
  end

end