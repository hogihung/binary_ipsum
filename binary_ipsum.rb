class BinaryIpsum

  def initialize(lorem_string)
    @lorem_string = lorem_string
  end

  def to_char_codes
    @lorem_string.chars.map { |ltr| ltr.ord }
  end

  def to_binary
    binary_sentence = self.to_char_codes.map { |int| int.to_s(2) }
    binary_sentence = binary_sentence.map { |binary_word| zero_pad(binary_word) }
    binary_sentence.join(' ')
  end

  def zero_pad(binary_value)
    return "0" + binary_value if binary_value.length < 8
    binary_value
  end

end

