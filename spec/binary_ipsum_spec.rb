require 'spec_helper'
require './binary_ipsum'

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

end

