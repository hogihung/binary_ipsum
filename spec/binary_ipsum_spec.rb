require 'spec_helper'
require './binary_ipsum'
require 'faker'

RSpec.describe BinaryIpsum do

  describe "string convert to character codes" do
    it "returns the character code for a given character" do
      single_char = BinaryIpsum.new(string: 'R')
      char_code   = single_char.to_char_codes
      expect(char_code).to eq [82]
    end

    it "returns an array of character codes for the word Ruby" do
      string_ruby = BinaryIpsum.new(string: 'Ruby')
      expect(string_ruby.to_char_codes).to eq [82, 117, 98, 121]
    end
  end

  describe "converts a string to binary" do
    it "returns binary representation for a submitted string" do
      string_ruby = BinaryIpsum.new(string: 'Ruby')
      expect(string_ruby.to_binary).to eq "01010010 01110101 01100010 01111001"
    end
  end

  describe "converts a string of Lorem Ipsum to binary" do
    it "returns binary representation for a lorem ipsum string" do
      lorem_string = BinaryIpsum.new(string: "Sapiente consequatur aperiam eius.")
      expect(lorem_string.to_binary).to eq "01010011 01100001 01110000 01101001 01100101 01101110 01110100 01100101 00100000 01100011 01101111 01101110 01110011 01100101 01110001 01110101 01100001 01110100 01110101 01110010 00100000 01100001 01110000 01100101 01110010 01101001 01100001 01101101 00100000 01100101 01101001 01110101 01110011 00101110"
    end
  end

  describe "allows user to create a random lorem ipsum sentence" do
    it "returns a random lorem ipsum string when using random true attribute" do
      string = BinaryIpsum.new(random: true)
      expect(string.lorem_string).to_not eq "Ruby"
      expect(string.lorem_string).not_to be_empty
    end

    it "returns a random lorem ipsum string of 7 sentences when using random true attribute and specifying number of sentences" do
      string = BinaryIpsum.new(random: true, sentences: 7)
      sentences = string.lorem_string.split('.')
      expect(sentences.count).to eq 7
    end

    it "returns the string Ruby if no parameters are passed " do
      string_ruby = BinaryIpsum.new()
      expect(string_ruby.lorem_string).to eq "Ruby"
    end
  end

end

