class StartMarkerFinder

  def find_start_of_packet_marker(datastream)
    find_marker(datastream, 4)
  end

  def find_start_of_message_marker(datastream)
    find_marker(datastream, 14)
  end

  private

  def find_marker(input, window_size)
    window = []
    input.chars.each_with_index do |e, i|
      window.push e

      if window.length > window_size
        window.shift # remove first element
      end

      puts window.join(',')

      if window.length == window_size && has_unique_characters?(window)
        return i + 1
      end
    end

    raise StandardError.new "No start of marker found"
  end

  def has_unique_characters?(window)
    window.uniq.length == window.length
  end

end