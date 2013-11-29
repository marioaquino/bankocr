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

  def self.[](key)
    {
      one => '1',
      two => '2'
    }[key]
  end

end
