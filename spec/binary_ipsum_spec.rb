require 'spec_helper'
require './binary_ipsum'
require 'faker'

RSpec.describe BinaryIpsum do

  describe "string convert to character codes" do
    it "returns the character code for a given character" do
      single_char = BinaryIpsum.new('R')
      char_code   = single_char.to_char_codes
      expect(char_code).to eq [82]
    end

    it "returns an array of character codes for the word Ruby" do
      string_ruby = BinaryIpsum.new('Ruby')
      expect(string_ruby.to_char_codes).to eq [82, 117, 98, 121]
    end
  end

  describe "converts a string to binary" do
    it "returns binary representation for a submitted string" do
      string_ruby = BinaryIpsum.new('Ruby')
      expect(string_ruby.to_binary).to eq "01010010 01110101 01100010 01111001"
    end
  end

  describe "converts a string of Lorem Ipsum to binary" do
    it "returns binary representation for a lorem ipsum string" do
      lorem_string = BinaryIpsum.new("Sapiente consequatur aperiam eius.")
      expect(lorem_string.to_binary).to eq "01010011 01100001 01110000 01101001 01100101 01101110 01110100 01100101 0100000 01100011 01101111 01101110 01110011 01100101 01110001 01110101 01100001 01110100 01110101 01110010 0100000 01100001 01110000 01100101 01110010 01101001 01100001 01101101 0100000 01100101 01101001 01110101 01110011 0101110"
    end
  end

  describe "allows user to create a random lorem ipsum sentence and convert to binary" do
    it "returns the binary representation of a random lorem ipsum string when using random true attribute" do
      lorem_string = BinaryIpsum.new(random: true)
      expect(lorem_string.to_binary).to include("0100000")
    end

    it "returns the binary representation of a random lorem ipsum string when using random true attribute and specifying number of sentences" do
      lorem_string = BinaryIpsum.new(random: true, sentences: 5)
      expect(lorem_string.to_binary).to include("0100000")
    end

    it "returns the binary representation of the string Ruby if no parameters are passed " do
      lorem_string = BinaryIpsum.new()
      expect(lorem_string.to_binary).to eq "01010010 01110101 01100010 01111001"
    end
  end

end

