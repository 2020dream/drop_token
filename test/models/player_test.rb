require 'test_helper'

describe Player do

  describe 'relations' do
    it "belongs to a game" do
      players(:one).game.must_equal games(:one)
    end

    it "has moves" do
      players(:one).moves.length.must_equal 4
    end

    it "can have no moves" do
      players(:seven).moves.length.must_equal 0
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
