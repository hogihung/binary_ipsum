require 'spec_helper'
require './binary_ipsum'

RSpec.describe BinaryIpsum do

  describe "string_to_char_code" do
    it "returns the character code for a given character" do
      single_char = BinaryIpsum.new('R')
      char_code   = single_char.to_char_code
      expect(char_code).to eq 82
    end
  end

end
