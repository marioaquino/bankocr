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

  def self.six
    ' _ ' +
    '|_ ' +
    '|_|'
  end

  def self.seven
    ' _ ' +
    '  |' +
    '  |'
  end

  def self.eight
    ' _ ' +
    '|_|' +
    '|_|'
  end

  def self.nine
    ' _ ' +
    '|_|' +
    ' _|'
  end

  def self.zero
    ' _ ' +
    '| |' +
    '|_|'
  end

  def self.[](key)
    {
      zero  => '0',
      one   => '1',
      two   => '2',
      three => '3',
      four  => '4',
      five  => '5',
      six   => '6',
      seven => '7',
      eight => '8',
      nine  => '9',
    }[key]
  end
end
