module Characters
  def self.one
    '   ' +
    '  |' +
    '  |'
  end

  def self.two
    ' _ ' +
    ' _|' +
    '|_ '
  end

  def self.three
    ' _ ' +
    ' _|' +
    ' _|'
  end

  def self.four
    '   ' +
    '|_|' +
    '  |'
  end

  def self.five
    ' _ ' +
    '|_ ' +
    ' _|'
  end

  def self.[](key)
    {
      one   => '1',
      two   => '2',
      three => '3',
      four  => '4',
      five  => '5'
    }[key]
  end
end
