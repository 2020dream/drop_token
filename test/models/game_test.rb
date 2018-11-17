require 'test_helper'

describe Game do

  describe 'relations' do
    it "has two players" do
      games(:one).players.length.must_equal 2
    end
  end

  describe 'validations' do
    let(:game) { games(:one) }

    it "must be valid" do
      game.valid?.must_equal true
    end

    it "is invalid with wrong value of columns" do
      game.columns = 3
      game.valid?.must_equal false
    end

    it "is invalid with wrong value of rows" do
      game.rows = 3
      game.valid?.must_equal false
    end
  end

  describe 'won?' do
    it "returns true when a player wins horizontally" do
      game = games(:one)
      game.won?.must_equal true
    end

    it "returns true when a player wins vertically" do
      game = games(:two)
      game.won?.must_equal true
    end

    it "returns true when a player wins diagonally" do
      game = games(:three)
      game.won?.must_equal true
    end

    it "returns false when no one wins" do
      game = games(:four)
      game.won?.must_equal false
    end
  end

end
