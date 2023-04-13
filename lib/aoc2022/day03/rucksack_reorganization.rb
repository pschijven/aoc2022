class RucksackReorganization

  def initialize
    # Initialize Hash of priorities
    @priorities = initialize_priorities
  end

  def priority(content)
    if is_valid(content)
      compartment1 = content[0...(content.length / 2)].chars
      compartment2 = content[(content.length / 2)..-1].chars
      common = compartment1.intersection(compartment2).first

      @priorities[common]
    else
      0
    end
  end

  # We assume here that grouped_content is the content for a group of 3 elves (array of 3 strings)
  def badge_priority(grouped_content)

    if grouped_content.length == 3
      common_char = grouped_content[0].chars.intersection(grouped_content[1].chars, grouped_content[2].chars).first
      @priorities[common_char]
    else
      0
    end
  end

  private

  def initialize_priorities
    lowercase = ("a".."z").to_h { |item| [item, item.ord - "a".ord + 1] }
    uppercase = ("A".."Z").to_h { |item| [item, item.ord - "A".ord + 27] }
    lowercase.merge uppercase
  end

  def is_valid(content)
    content.length > 0 && content.length % 2 == 0 # Should be splittable in two equal parts
  end
end