class SectionAssignment

  def initialize(assignment_pair)
    @first, @second = *parse_ranges(assignment_pair)
  end

  def has_complete_overlap?
    @first.cover?(@second) || @second.cover?(@first)
  end

  def has_overlap?
    @first.to_a.intersection(@second.to_a).length > 0
  end

  private

  def parse_ranges(assignment_pair)
    if is_valid?(assignment_pair)
      assignment_pair.split(',')
                     .map { |it| it.split('-') }
                     .map { |it| (it[0].to_i..it[1].to_i) }
    else
      raise StandardError.new("Invalid input")
    end
  end

  def is_valid?(assignment_pair)
    assignment_pair.match(/(\d+)-(\d+)/)
  end

end