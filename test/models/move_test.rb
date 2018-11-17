require 'test_helper'

describe Move do

  describe 'relations' do
    it "belongs to a game" do
      moves(:one).game.id.must_equal games(:one).id
    end

    it "belongs to a player" do
      moves(:one).player.id.must_equal players(:one).id
    end
  end

  describe 'validations' do
    let(:move) { moves(:one) }

    it "must be valid" do
      move.valid?.must_equal true
    end

    it "is invalid without column" do
      move.column = nil
      move.valid?.must_equal false
    end

    it "is invalid with wrong value of column" do
      move.column = 4
      move.valid?.must_equal false
    end

    it "is invalid with wrong type for column" do
      move.column = "wrong_type"
      move.valid?.must_equal false
    end
  end

end
