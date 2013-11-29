module Parser
  def self.character_length
    3
  end

  def self.one
    '   ' +
    '  |' +
    '  |'
  end

  def self.characters
    {
      one => '1'
    }
  end

  def self.read_characters(lines, starting_position = 0, accumulator = '')
    value = lines.map{|line| line[starting_position, character_length]}.join
    return accumulator if value == ''
    read_characters lines, starting_position + character_length, accumulator << characters[value]
  end
end
