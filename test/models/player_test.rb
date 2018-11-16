require 'test_helper'

describe Player do

  describe 'relations' do
    it "belongs to a game" do
      players(:one).game.must_equal games(:one)
    end
  end

  describe 'validations' do
    let(:player) { players(:one) }

    it "must be valid" do
      player.valid?.must_equal true
    end

    it "is invalid without name" do
      player.name = nil
      player.valid?.must_equal false
    end
  end

end
