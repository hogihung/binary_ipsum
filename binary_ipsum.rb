class BinaryIpsum

  def initialize(lorem_string)
    @lorem_string = lorem_string
  end

  def to_char_codes
    @lorem_string.chars.map { |ltr| ltr.ord }
  end

end
