class BinaryIpsum

  def initialize(lorem_string)
    @lorem_string = lorem_string
  end

  def to_char_code
    @lorem_string.ord
  end

end
