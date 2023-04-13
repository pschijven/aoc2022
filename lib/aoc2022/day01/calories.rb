# frozen_string_literal: true

class Calories

  def initialize(filename)
    @filename = filename
  end

  def find_max_calories
    parse_calories.max
  end

  def find_top3_max_calories
    parse_calories.sort.last(3).sum(0)
  end

  private

  def parse_calories
    calories_by_elf = []
    calories = 0
    File.foreach(@filename) do |line|
      if line.strip.empty?
        calories_by_elf << calories
        calories = 0
      else
        calories += line.to_i
      end
    end
    calories_by_elf
  end
end
