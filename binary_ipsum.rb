class BinaryIpsum
  require 'faker'

  attr_reader :lorem_string

  def initialize(string: 'Ruby', random: false, sentences: 5)
    return @lorem_string = Faker::Lorem.sentences(sentences).join(' ') if random
    @lorem_string = string
  end

  def to_char_codes
    lorem_string.chars.map { |ltr| ltr.ord }
  end

  def to_binary
    binary_sentence = self.to_char_codes.map { |int| int.to_s(2) }
    binary_sentence = binary_sentence.map { |binary_word| zero_pad(binary_word) }
    binary_sentence.join(' ')
  end

  def zero_pad(binary_value)
    binary_value.rjust(8,'0')
  end

end

