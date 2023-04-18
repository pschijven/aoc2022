class SupplyDock

  Rearrangement = Struct.new :amount, :from, :to

  def initialize(input_file)
    cargo_map, instructions = split_input_file(input_file)

    @supply_stack = parse_cargo_map cargo_map
    @rearrangements = parse_rearrangements instructions
  end

  def apply_rearrangements
    @rearrangements.each do |rearrangement|
      rearrangement.amount.times do
        crate = @supply_stack[rearrangement.from].pop
        @supply_stack[rearrangement.to].push crate
      end
    end
  end

  def apply_rearrangements_by_stack
    @rearrangements.each do |rearrangement|
      crates = @supply_stack[rearrangement.from].pop(rearrangement.amount)
      @supply_stack[rearrangement.to].push *crates
    end
  end

  def crates_at_top
    @supply_stack.map { |stack| stack.last }.join
  end

  private

  def split_input_file(input_file)
    input_file.split(/^(?>\s*\d+\s*)+/)
              .map { |line| line.split("\n") }
  end

  # This code will transform the cargo map in the following form:
  # supply_stack = [
  #   ['Z', 'N'],
  #   ['M', 'C', 'D'],
  #   ['P'],
  # ]
  def parse_cargo_map(cargo_map)
    cargo_map.map { |row| row.chars }
             .map { |row| row.filter.with_index {|e, i| i % 4 == 1} } # Only keep elements for indices i with i % 4 == 1
             .reverse
             .transpose
             .map { |row| row.filter { |e| e != " " } } # Delete empty elements
  end

  def parse_rearrangements(instructions)
    instructions.map { |instruction| parse_instruction(instruction)}
  end

  def parse_instruction(instruction)
    instruction.match(/move\s+(\d+)\s+from\s+(\d+)\s+to\s+(\d+)/) do |m|
      Rearrangement.new(amount: m[1].to_i, from: m[2].to_i - 1, to: m[3].to_i - 1)
    end
  end

end